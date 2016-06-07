class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid = auth_info.uid
      new_user.screen_name = auth_info.info.nickname
      new_user.image = auth_info.info.image
      new_user.name = auth_info.info.name
      new_user.oauth_token = auth_info.credentials.token
      new_user.save
    end
  end

  def city_and_state(user)
    "#{user.city}, #{user.state}"
  end
end
