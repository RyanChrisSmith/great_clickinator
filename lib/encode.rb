class Encode
  attr_reader :user_id,
              :long_url,
              :domain,
              :hash,
              :bitlink

  def initialize(encode_data)
    @user_id = encode_data[:user_id]
    @long_url = encode_data[:long_url]
    @domain = encode_data[:domain]
    @hash = encode_data[:hash]
    @bitlink = "http://bit.ly/#{@hash}"
  end
end