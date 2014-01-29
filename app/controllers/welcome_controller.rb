class WelcomeController < ApplicationController
  
  def index
    @rand_video_url = Video.random.link_url
  end
end
