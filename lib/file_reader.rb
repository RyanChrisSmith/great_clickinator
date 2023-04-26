require 'csv'

class FileReader 
  def initialize(file_path)
    @file_path = file_path
  end 

  def read 
    case File.extname(@file_path)
    when '.csv'
      read_csv
    when '.json'
      read_json
    else
      raise "File type not supported"
    end
  end

  private

  def read_json
    json_data = File.read(@file_path)
    JSON.parse(json_data)
  end

  def read_csv
    rows = CSV.read(@file_path, headers: true, header_converters: :symbol)
    rows.map(&:to_hash)
  end
end