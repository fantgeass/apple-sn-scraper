require 'scraper/version'

require 'date'
require 'capybara'
require 'capybara/webkit'


module AppleSnScraper
  class Client
    # class ScrapeError < StandardError; end

    include Capybara::DSL

    def initialize
      Capybara.current_driver = :webkit
      Capybara.app_host = 'https://selfsolve.apple.com'
      Capybara.run_server = false
      page.driver.allow_url 'apple.com'
    end

    def get_expiration_date(imei)
      visit '/agreementWarrantyDynamic.do'

      within('#serialnumbercheck') do
        fill_in 'sn', with: imei
      end
      click_button 'Continue'

      if first('#phone-true')
        phone_text = find('#phone-text').text
        Date.parse(phone_text)
      else
        false
      end
    end
  end
end
