class GithubService

  def initialize(user)
    @user = user
    @connection = Faraday.new(url:"https://api.github.com/")
    @connection.headers[:Authorization] = "token #{@user['oauth_token']}"
  end



end
