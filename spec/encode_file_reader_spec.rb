require 'spec_helper'
require './lib/encodes_file_reader'

RSpec.describe EncodesFileReader do
  let(:encodes_file_reader) { EncodesFileReader.new('./data/encodes.csv') }
  let(:rows) { CSV.read('./data/encodes.csv', headers: true, header_converters: :symbol) }

  context 'when initialized' do
    it 'exists' do
      expect(encodes_file_reader).to be_a(EncodesFileReader)
    end

    it 'has attributes' do
      expect(encodes_file_reader.instance_variables).to eq([:@encodes])
    end

    it 'should return an array of Encode objects' do
      expect(encodes_file_reader.encodes).to be_an(Array)
      expect(encodes_file_reader.encodes.first).to be_a(Encode)
    end

    it 'should have the correct number of encodes' do
      expect(encodes_file_reader.encodes.count).to eq(rows.count)
    end

    it 'should have the correct user_id for each encode' do
      expect(encodes_file_reader.encodes.first.user_id).to eq(1)
      expect(encodes_file_reader.encodes.last.user_id).to eq(encodes_file_reader.encodes.count)
    end
  end

  context 'when file paths are incorrect' do
    it 'should raise an error if the file path is incorrect' do
      expect { EncodesFileReader.new('./data/nonexistent.csv') }.to raise_error(Errno::ENOENT)
    end
  end
end