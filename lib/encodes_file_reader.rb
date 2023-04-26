require 'csv'
require_relative 'link'

class EncodesFileReader
  attr_reader :links

  def initialize(file_path)
    rows = CSV.read(file_path, headers: true, header_converters: :symbol)
    @links = rows.map.with_index(1) do |row, index|
      link_data = row.to_hash
      link_data[:user_id] = index
      Link.new(link_data)
    end
  end
end