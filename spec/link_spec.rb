require 'spec_helper'
require './lib/link'

RSpec.describe Link do
  link_data = {
    user_id: 1,
    long_url: 'https://google.com/',
    domain: 'bit.ly',
    hash: '31Tt55y'
  }
  let(:link) { Link.new(link_data) }

  context 'when initialized' do
    it 'exists' do
      expect(link).to be_a(Link)
    end

    it 'has attributes' do
      expect(link.user_id).to eq(link_data[:user_id])
      expect(link.long_url).to eq(link_data[:long_url])
      expect(link.domain).to eq(link_data[:domain])
      expect(link.hash).to eq(link_data[:hash])
      expect(link.bitlink).to eq("http://bit.ly/#{link_data[:hash]}")
    end

    it 'only has the attributes listed above' do
      expect(link.instance_variables).to eq(%i[@user_id @long_url @domain @hash @bitlink])
    end
  end
end