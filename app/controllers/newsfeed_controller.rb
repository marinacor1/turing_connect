class NewsfeedController < ApplicationController
  def index
    @feeds = Newsfeed.all
  end
end
