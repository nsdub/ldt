class WelcomeController < ApplicationController
  
  def index
    rand_video_id = Video.random.link_url.split('=').second
    @youtube_link = "//www.youtube-nocookie.com/embed/" + rand_video_id + "?rel=0"
  end
end
