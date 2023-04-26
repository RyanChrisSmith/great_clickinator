require 'decodes_file_reader'
require 'encodes_file_reader'

class ClickCounter
  attr_reader :encodes,
              :decodes

  def initialize(encodes_file_path, decodes_file_path)
    @encodes = EncodesFileReader.new(encodes_file_path).encodes
    @decodes = DecodesFileReader.new(decodes_file_path).decodes
  end

  def count(year)
    clicks_hash = {}

    encodes.each do |encode|
      decodes_filtered = decodes.select { |decode| decode.year == year && decode.bitlink == encode.bitlink }
      click_count = decodes_filtered.size

      clicks_hash[encode.long_url] = click_count
    end

    sorted_clicks = clicks_hash.sort_by { |_url, count| -count }.to_h

    [sorted_clicks]
  end
end