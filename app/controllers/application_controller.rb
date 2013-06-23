class ApplicationController < ActionController::Base
  protect_from_forgery
  WillPaginate.per_page = 10 #paginator, TODO: set empirical value
end
