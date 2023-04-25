require 'spec_helper'
require './lib/decode'

RSpec.describe Decode do
  decode_data = {
    "bitlink": "http://bit.ly/2kkAHNs",
    "user_agent": "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; Media Center PC 6.0; InfoPath.3; MS-RTC LM 8; Zune 4.7",
    "timestamp": "2020-02-15T00:00:00Z",
    "referrer": "t.co",
    "remote_ip": "4.14.247.63"
  }
  let(:decode) { Decode.new(decode_data) }

  it 'exists' do
    expect(decode).to be_a(Decode)
  end

  it 'has attributes' do
    expect(decode.bitlink).to eq(decode_data["bitlink"])
    expect(decode.user_agent).to eq(decode_data["user_agent"])
    expect(decode.timestamp).to eq(decode_data["timestamp"])
    expect(decode.referrer).to eq(decode_data["referrer"])
    expect(decode.remote_ip).to eq(decode_data["remote_ip"])
  end

  it 'only has the attributes listed above' do
    expect(decode.instance_variables).to eq(%i[@bitlink @user_agent @timestamp @referrer @remote_ip])
  end
end