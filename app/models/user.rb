class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    new_user = User.find_by(github_id: auth_info.extra.raw_info.uid)
    binding.pry
    new_user.image = auth_info.info.image
    new_user.oauth_token = auth_info.credentials.token
    new_user.first_login = false
    new_user.save
    return new_user
  end

  def city_and_state(user)
    "#{user.city}, #{user.state}"
  end
end
