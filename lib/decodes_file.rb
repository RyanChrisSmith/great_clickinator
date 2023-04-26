require_relative 'file_reader'
require_relative 'click'

class DecodesFile
  attr_reader :clicks

  def initialize(file_path)
    click_data = FileReader.new(file_path).read
    @clicks = click_data.map { |data| Click.new(data) }
  end
end