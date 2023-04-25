require 'spec_helper'
require './lib/decodes_file_reader' 

RSpec.describe DecodesFileReader do 
  let(:decodes_file_reader) { DecodesFileReader.new('./data/decodes.json') }
  let(:json) { File.read('./data/decodes.json') }

  context 'when initialized' do 
    it 'exists' do
      expect(decodes_file_reader).to be_a(DecodesFileReader)
    end

    it 'has attributes' do
      expect(decodes_file_reader.instance_variables).to eq([:@decodes])
    end

    it 'should return an array of Decode objects' do
      expect(decodes_file_reader.decodes).to be_an(Array)
      expect(decodes_file_reader.decodes.first).to be_a(Decode)
    end

    it 'should have the correct number of decodes' do
      expect(decodes_file_reader.decodes.count).to eq(JSON.parse(json).count)
    end
  end

  context 'when file paths are incorrect' do
    it 'should raise an error if the file path is incorrect' do
      expect { DecodesFileReader.new('./data/nonexistent.json') }.to raise_error(Errno::ENOENT)
    end
  end
end