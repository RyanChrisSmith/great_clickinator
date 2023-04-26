require 'spec_helper'
require './lib/decodes_file'

RSpec.describe DecodesFile do
  let(:decodes_file) { DecodesFile.new('./data/decodes.json') }
  let(:json) { File.read('./data/decodes.json') }

  context 'when initialized' do 
    it 'exists' do
      expect(decodes_file).to be_a(DecodesFile)
    end

    it 'has attributes' do
      expect(decodes_file.instance_variables).to eq([:@clicks])
    end

    it 'should return an array of Decode objects' do
      expect(decodes_file.clicks).to be_an(Array)
      expect(decodes_file.clicks.first).to be_a(Click)
    end

    it 'should have the correct number of decodes' do
      expect(decodes_file.clicks.count).to eq(JSON.parse(json).count)
    end
  end

  context 'when file paths are incorrect' do
    it 'should raise an error if the file path is incorrect' do
      expect { DecodesFile.new('./data/nonexistent.json') }.to raise_error(Errno::ENOENT)
    end
  end
end