require 'spec_helper'
require './lib/encodes_file_reader'

RSpec.describe EncodesFileReader do
  let(:encodes_file) { EncodesFileReader.new('./data/encodes.csv') }
  let(:rows) { CSV.read('./data/encodes.csv', headers: true, header_converters: :symbol) }

  context 'when initialized' do
    it 'exists' do
      expect(encodes_file).to be_a(EncodesFileReader)
    end

    it 'has attributes' do
      expect(encodes_file.instance_variables).to eq([:@links])
    end

    it 'should return an array of Encode objects' do
      expect(encodes_file.links).to be_an(Array)
      expect(encodes_file.links.first).to be_a(Link)
    end

    it 'should have the correct number of links' do
      expect(encodes_file.links.count).to eq(rows.count)
    end

    it 'should have the correct user_id for each encode' do
      expect(encodes_file.links.first.user_id).to eq(1)
      expect(encodes_file.links.last.user_id).to eq(encodes_file.links.count)
    end
  end

  context 'when file paths are incorrect' do
    it 'should raise an error if the file path is incorrect' do
      expect { EncodesFileReader.new('./data/nonexistent.csv') }.to raise_error(Errno::ENOENT)
    end
  end
end