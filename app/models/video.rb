class Video < ActiveRecord::Base
  attr_accessible :url, :title
  
  validates :url, presence: true
  validates :title, presence: true
  
  def self.random
    if (c = count) != 0
      find(:first, :offset =>rand(c))
    end
  end
end