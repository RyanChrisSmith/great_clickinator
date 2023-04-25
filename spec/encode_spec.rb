require 'spec_helper'
require './lib/encode'

RSpec.describe Encode do
  encode_data = {
    user_id: 1,
    long_url: 'https://google.com/',
    domain: 'bit.ly',
    hash: '31Tt55y'
  }
  let(:encode) { Encode.new(encode_data) }

  context 'when initialized' do
    it 'exists' do
      expect(encode).to be_a(Encode)
    end

    it 'has attributes' do
      expect(encode.user_id).to eq(encode_data[:user_id])
      expect(encode.long_url).to eq(encode_data[:long_url])
      expect(encode.domain).to eq(encode_data[:domain])
      expect(encode.hash).to eq(encode_data[:hash])
    end

    it 'only has the attributes listed above' do
      expect(encode.instance_variables).to eq(%i[@user_id @long_url @domain @hash])
    end
  end
end