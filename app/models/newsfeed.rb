class Newsfeed

  def initialize(params)
    user = user_information(params['id'])
    cohort = params['user']['cohort']
    action = filter_action(params['user'])
    print_newsfeed(user, cohort, action)
  end

  def user_information(id)
    User.find(id).name
  end

  def filter_action(params)
    if params['cohort'].count > 0
      "updated cohort."
    elsif params['name'].count > 0
      "updated name."
    elsif params['current_employer'].count > 0
      "updated employer."
    elsif params['street_address'].count > 0
      "updated street address."
    elsif params['city'].count > 0 || params['state'].count > 0
      "updated location."
    elsif params['email'].count > 0
      "updated email address."
    elsif params['status'].count > 0
      focus = params['status']
      "updated their status: #{focus}."
    end
  end

  def print_newsfeed(user, cohort, action)
    @statement = "#{user} in cohort #{cohort} #{action}"
  end
end
