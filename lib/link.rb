class Link
  attr_reader :user_id,
              :long_url,
              :domain,
              :hash,
              :bitlink

  def initialize(link_data)
    @user_id = link_data[:user_id]
    @long_url = link_data[:long_url]
    @domain = link_data[:domain]
    @hash = link_data[:hash]
    @bitlink = "http://bit.ly/#{@hash}"
  end
end