class News < ActiveRecord::Base
  attr_accessible :body, :image_url, :is_important, :keywords, :title
  #text, string, bool, string, string
end
