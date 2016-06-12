class Event
  attr_reader :service

  def initialize(user)
    @service ||= GithubService.new(user)
  end

  def type_change(type)
    actions[type]
  end

  def actions
    types = {"CreateEvent" => "created",
             "WatchEvent"  => "starred",
             "ForkEvent"   => "forked",
             "MemberEvent" => "added a collaborator to" }
  end

  def all
    temp_events = service.events_array
    temp_events.each do |event|
      {person: event[:actor][:login], type: event[:type], repo: event[:repo][:name]}
     end
  end


end
