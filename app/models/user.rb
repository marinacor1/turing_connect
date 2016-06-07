class User < ActiveRecord::Base

  def city_and_state(user)
    "#{user.city}, #{user.state}"
  end
end
