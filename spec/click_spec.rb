require 'spec_helper'
require './lib/click'

RSpec.describe Click do
  click_data = {
    "bitlink" => "http://bit.ly/2kkAHNs",
    "user_agent" => "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; Media Center PC 6.0; InfoPath.3; MS-RTC LM 8; Zune 4.7",
    "timestamp" => "2020-02-15T00:00:00Z",
    "referrer" => "t.co",
    "remote_ip" => "4.14.247.63"
  }
  let(:click) { Click.new(click_data) }

  it 'exists' do
    expect(click).to be_a(Click)
  end

  it 'has attributes' do
    expect(click.bitlink).to eq(click_data["bitlink"])
    expect(click.user_agent).to eq(click_data["user_agent"])
    expect(click.timestamp).to eq(click_data["timestamp"])
    expect(click.referrer).to eq(click_data["referrer"])
    expect(click.remote_ip).to eq(click_data["remote_ip"])
  end

  it 'only has the attributes listed above' do
    expect(click.instance_variables).to eq(%i[@bitlink @user_agent @timestamp @referrer @remote_ip @year])
  end
end