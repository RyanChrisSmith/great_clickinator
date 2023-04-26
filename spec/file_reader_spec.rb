require 'spec_helper'
require 'file_reader'

RSpec.describe FileReader do
  describe '#read' do
    context 'when the file is a CSV' do
      let(:file_path) { './data/encodes.csv' }

      it 'reads the CSV file and returns an array of hashes' do
        reader = FileReader.new(file_path)
        result = reader.read

        expect(result).to be_a Array
        expect(result.first).to be_a Hash
        expect(result.first).to eq({:domain=>"bit.ly", :hash=>"31Tt55y", :long_url=>"https://google.com/"})
      end
    end

    context 'when the file is a JSON' do
      let(:file_path) { './data/decodes_truncated.json' }

      it 'reads the JSON file and returns an array of hashes' do
        reader = FileReader.new(file_path)
        result = reader.read

        expect(result).to be_a Array
        expect(result.first).to be_a Hash
        expect(result.first).to eq(
                                    {
                                      "bitlink"=>"http://bit.ly/2kkAHNs",
                                      "user_agent"=>
                                      "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; Media Center PC 6.0; InfoPath.3; MS-RTC LM 8; Zune 4.7",
                                      "timestamp"=>"2020-02-15T00:00:00Z",
                                      "referrer"=>"t.co",
                                      "remote_ip"=>"4.14.247.63"
                                    }
                                  )
      end
    end

    context 'when the file type is not supported' do
      let(:file_path) { 'test_data.txt' }

      before do
        allow(File).to receive(:extname).with(file_path).and_return('.txt')
      end

      it 'raises an error' do
        reader = FileReader.new(file_path)
        expect { reader.read }.to raise_error("File type not supported")
      end
    end
  end
end
