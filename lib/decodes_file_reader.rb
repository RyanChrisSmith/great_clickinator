require 'json'
require_relative 'decode'

class DecodesFileReader
  attr_reader :decodes

  def initialize(file_path)
    @decodes = []
    json_data = File.read(file_path)
    JSON.parse(json_data).each do |data|
      @decodes << Decode.new(data)
    end
  end
end