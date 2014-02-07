class WelcomeController < ApplicationController
  def index
    @published_ideas = Idea.where("published_at is not ?", nil)
    if @published_ideas.any? 
      rand_video_id = @published_ideas.random.video_url.split('=').second
      @youtube_link = "//www.youtube-nocookie.com/embed/" + rand_video_id + "?rel=0&autoplay=1&disablekb=1"
    end
  end
end