require 'spec_helper'
require './lib/click_counter'

RSpec.describe ClickCounter do
  let(:clicks) { ClickCounter.new('./data/encodes.csv', './data/decodes.json') }
  # the decodes_truncated.json file is only 20 lines of data to help better test if the code is counting correctly
  let(:clicks_truncated) { ClickCounter.new('./data/encodes.csv', './data/decodes_truncated.json') }

  context 'initialize' do
    it 'exists' do
      expect(clicks).to be_a(ClickCounter)
    end

    it 'has attributes' do
      expect(clicks.links).to be_an(Array)
      expect(clicks.clicks).to be_an(Array)
    end
  end

  context '#count' do
    it 'returns an array of objects' do
      expect(clicks.count(2021)).to be_an(Array)
      expect(clicks.count(2021).first).to be_a(Hash)
    end

    it 'can count the truncated data correctly by year' do
      expect(clicks_truncated.count(2021)).to eq([{ 'https://github.com/' => 1, 'https://google.com/' => 0, 'https://linkedin.com/' => 0, 'https://reddit.com/' => 2, 'https://twitter.com/' => 1, 'https://youtube.com/' => 1 }])
    end

    it 'can count the truncated data correctly by a different year' do
      expect(clicks_truncated.count(2020)).to eq([{ 'https://github.com/' => 3, 'https://google.com/' => 0, 'https://linkedin.com/' => 3, 'https://reddit.com/' => 0, 'https://twitter.com/' => 1, 'https://youtube.com/' => 2 }])
    end

    it 'can count full data set clicks by year' do
      expect(clicks.count(2021)).to eq([{ 'https://youtube.com/' => 557, 'https://twitter.com/' => 512, 'https://reddit.com/' => 510, 'https://github.com/' => 497, 'https://linkedin.com/' => 496, 'https://google.com/' => 492 }])
    end

    it 'can count full data set clicks by a different year' do
      expect(clicks.count(2020)).to eq([{ 'https://youtube.com/' => 481, 'https://reddit.com/' => 464, 'https://google.com/' => 450, 'https://linkedin.com/' => 446, 'https://github.com/' => 420, 'https://twitter.com/' => 409 }])
    end
  end
end