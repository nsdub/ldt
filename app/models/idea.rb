class Idea < ActiveRecord::Base
  
  attr_accessible :creator_id, :video_url, :title
  
  validates :creator_id, presence: true
  validates :title, presence: true
  validates :video_url, presence: true
  
  def self.random
    if (c = count) != 0
      find(:first, :offset =>rand(c))
    end
  end
end
