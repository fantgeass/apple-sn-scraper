require 'spec_helper'


RSpec.describe AppleSnScraper::Client do
  describe '#get_expiration_date' do
    it 'check expired imei' do
      expect(subject.get_expiration_date('013896000639712')).to be false
    end
    it 'check active imei' do
      expect(subject.get_expiration_date('013977000323877')).to be_a(Date)
    end
  end
end