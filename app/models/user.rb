class User < ActiveRecord::Base
  geocoded_by :full_street_address
  after_validation :geocode #runs everytime a model is validated

  def self.from_omniauth(auth_info)
    new_user = User.find_by(github_id: auth_info.extra.raw_info.id)
    attributes = {image: auth_info.info.image, oauth_token: auth_info.credentials.token, first_login: false}
    new_user.update_attributes(attributes)
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

  def self.unique_states
    users = User.all
    all_states = users.map do |user|
      user.state
    end
    return all_states.uniq.compact.sort

  end

  def self.unique_cohorts
    users = User.all
    all_cohorts = users.map do |user|
      user.cohort
    end
    return all_cohorts.uniq.compact.sort
  end


end
