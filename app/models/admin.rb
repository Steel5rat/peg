class Admin < ActiveRecord::Base
  attr_accessible :email, :name, :password
end
