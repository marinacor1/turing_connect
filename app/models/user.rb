class User < ActiveRecord::Base
  has_many :updates
  geocoded_by :full_street_address
  after_validation :geocode #runs everytime a model is validated
  enum role: %w(default admin)
  scope :admin?, -> { where(role: 1) }
  validates_presence_of :city, :state

  def self.from_omniauth(auth_info)
    new_user = User.find_by(github_id: auth_info.extra.raw_info.id)
    attributes = {image: auth_info.info.image, oauth_token: auth_info.credentials.token, screen_name: auth_info.info.nickname, first_login: false}
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

  def update_newsfeed(params)
    user = User.find(params['id'])
    cohort = params['user']['cohort']
    action = filter_action(params['user'])
    Update.create(user: user, cohort: cohort, action: action)
    binding.pry
  end

  def filter_action(params)
    updates = []
    if params['status'].length > 0
      focus = params['status']
      updates << "updated their status: #{focus}"
    end
    if params['cohort'].length > 0
      updates << "updated cohort."
    end
    if params['current_employer'].length > 0
      updates << "updated employer."
    end
    if params['city'].length > 0 || params['state'].length > 0
      updates <<  "updated location."
    end
    if params['email'].length > 0
      updates << "updated email address."
    end
    return updates.flatten
  end


end
