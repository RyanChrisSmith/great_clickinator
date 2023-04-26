class Decode
  attr_reader :bitlink,
              :user_agent,
              :timestamp,
              :referrer,
              :remote_ip,
              :year

  def initialize(decode_data)
    @bitlink = decode_data["bitlink"]
    @user_agent = decode_data["user_agent"]
    @timestamp = decode_data["timestamp"]
    @referrer = decode_data["referrer"]
    @remote_ip = decode_data["remote_ip"]
    @year = DateTime.strptime(timestamp, '%Y-%m-%dT%H:%M:%S%z').year
  end
end