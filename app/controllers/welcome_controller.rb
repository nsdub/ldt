class WelcomeController < ApplicationController
  
  def index
    if Video.any?
      rand_video_id = Video.random.url.split('=').second
      @youtube_link = "//www.youtube-nocookie.com/embed/" + rand_video_id + "?rel=0"
    end
  end
end