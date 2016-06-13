class NewsfeedController < ApplicationController
  def index
    @feeds = Newsfeed.all
    #TODO Newsfeed is empty array
  end
end
