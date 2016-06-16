class EventsController < ApplicationController

  def index
    event = Event.new(current_user)
    @events = event.all_events
  end

end
