require_relative 'decodes_file'
require_relative 'encodes_file'

class ClickCounter
  attr_reader :clicks,
              :links

  def initialize(encodes_file_path, decodes_file_path)
    @links = EncodesFile.new(encodes_file_path).links
    @clicks = DecodesFile.new(decodes_file_path).clicks
  end

  def count(year)
    clicks_hash = {}

    links.each do |link|
      click_count = count_clicks_for_link(link.bitlink, year)
      clicks_hash[link.long_url] = click_count
    end

    sorted_clicks = clicks_hash.sort_by { |_url, count| -count }.to_h

    sorted_objects = sorted_clicks.map do |url, count|
      { url => count }
    end
    sorted_objects
  end

  private

  def count_clicks_for_link(bitlink, year)
    links_filtered = clicks.select { |link| link.year == year && link.bitlink == bitlink }
    links_filtered.size
  end
end