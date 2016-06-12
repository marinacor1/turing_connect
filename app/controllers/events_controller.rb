class EventsController < ApplicationController

  def index
    event = Event.new
    @events = event.all
  end

end
