class User < ActiveRecord::Base
  geocoded_by :full_street_address
  after_validation :geocode #runs everytime a model is validated

  def self.from_omniauth(auth_info)
    new_user = User.find_by(github_id: auth_info.extra.raw_info.id)
    new_user.image = auth_info.info.image
    new_user.oauth_token = auth_info.credentials.token
    new_user.first_login = false
    new_user.save
    return new_user
  end

  def city_and_state(user)
    if user.city.nil? || user.state.nil?
      ""
    else
      "#{user.city}, #{user.state}"
    end
  end

  def full_street_address
    "#{street_address}, #{city}, #{state}"
  end


end
