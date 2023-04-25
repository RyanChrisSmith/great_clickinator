class Encode
  attr_reader :user_id,
              :long_url,
              :domain,
              :hash

  def initialize(encode_data)
    @user_id = encode_data[:user_id]
    @long_url = encode_data[:long_url]
    @domain = encode_data[:domain]
    @hash = encode_data[:hash]
  end
end