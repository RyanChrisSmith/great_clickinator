require 'csv'
require 'encode'

class EncodesFileReader
  attr_reader :encodes

  def initialize(file_path)
    rows = CSV.read(file_path, headers: true, header_converters: :symbol)
    @encodes = rows.map.with_index(1) do |row, index|
      encode_data = row.to_hash
      encode_data[:user_id] = index
      Encode.new(encode_data)
    end
  end
end