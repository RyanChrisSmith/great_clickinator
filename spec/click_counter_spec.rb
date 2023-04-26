require 'spec_helper'
require './lib/click_counter'

RSpec.describe ClickCounter do
  let(:click_counter) { ClickCounter.new('./data/encodes.csv', './data/decodes.json') }

  context 'initialize' do
    it 'exists' do
      expect(click_counter).to be_a(ClickCounter)
    end

    it 'has attributes' do
      expect(click_counter.encodes).to be_an(Array)
      expect(click_counter.decodes).to be_an(Array)
    end
  end

  context '#count' do
    it 'can count clicks by year' do
      expect(click_counter.count(2021)).to eq([{ 'https://youtube.com/' => 557, 'https://twitter.com/' => 512, 'https://reddit.com/' => 510,
      'https://github.com/' => 497, 'https://linkedin.com/' => 496, 'https://google.com/' => 492 }])
    end
  end
end