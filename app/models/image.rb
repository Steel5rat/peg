class Image < ActiveRecord::Base
  belongs_to :news
  attr_accessible :name, :picture, :news_id, :id
  has_attached_file :picture#, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
