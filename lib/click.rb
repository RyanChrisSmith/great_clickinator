class Click
  attr_reader :bitlink,
              :user_agent,
              :timestamp,
              :referrer,
              :remote_ip,
              :year

  def initialize(click_data)
    @bitlink = click_data["bitlink"]
    @user_agent = click_data["user_agent"]
    @timestamp = click_data["timestamp"]
    @referrer = click_data["referrer"]
    @remote_ip = click_data["remote_ip"]
    @year = DateTime.strptime(timestamp, '%Y-%m-%dT%H:%M:%S%z').year
  end
end