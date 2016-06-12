class Event
  attr_reader :service

  def initialize(user)
    @service ||= GithubService.new
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
    binding.pry
  end


end
