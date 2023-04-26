require 'file_reader'
require 'link'

class EncodesFile
  attr_reader :links

  def initialize(file_path)
    link_data = FileReader.new(file_path).read
    @links = link_data.map.with_index(1) do |data, index|
      Link.new(data.merge(user_id: index))
    end
  end
end