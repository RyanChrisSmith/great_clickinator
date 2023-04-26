require 'json'
require_relative 'click'

class DecodesFileReader
  attr_reader :clicks

  def initialize(file_path)
    @clicks = []
    json_data = File.read(file_path)
    JSON.parse(json_data).each do |click_data|
      @clicks << Click.new(click_data)
    end
  end
end