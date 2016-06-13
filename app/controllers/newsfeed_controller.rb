class NewsfeedController < ApplicationController
  def index
    @newsfeeds = Newsfeed.all
  end
end
