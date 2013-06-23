class News < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  attr_accessible :body, :image_url, :is_important, :keywords, :title, :id
  #text, string, bool, string, string
end
