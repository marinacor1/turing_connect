class GithubService

  def initialize(user)
    @user = user
    @connection = Faraday.new(url:"https://api.github.com/")
    @connection.headers[:Authorization] = "token #{@user['oauth_token']}"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_following_feed
    @connection.get "users/#{@user["screen_name"]}/received_events"
  end

  def events_array
    parse(get_following_feed)
  end



end
