class GithubService

  def initialize(user)
    @user = user
    @connection = Faraday.new(url:"https://api.github.com")
    @connection.headers[:Authorization] = "token #{@user['oauth_token']}"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_user
    @connection.get "/users/#{@user["screen_name"]}"
  end


end
