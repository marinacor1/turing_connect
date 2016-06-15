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

  def self.update_newsfeed(params)
    user = User.find(params['id'])
    cohort = user.cohort
    action = filter_action(params['user']) + status_check(params)
    action = "*" if action.nil?
    Update.create(user: user, cohort: cohort, action: action)
  end

  def self.filter_action(params)
    symbolized = params.keys.first.to_sym
    actions[symbolized]
  end

  def self.actions
     {street_address: 'updated their street address.',
                city: 'updated their city.',
               state: 'updated their state.',
               email: 'updated their contact information.',
    current_employer: 'updated their job.',
                name: 'updated their name.',
              status: 'updated their status: '}
  end

  def self.status_check(params)
    if params['user'].keys.first.include? 'status'
      status = params['user'].values.first
    else
      status = ""
    end
    return status
  end


end
