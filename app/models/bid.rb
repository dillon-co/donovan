class Bid < ActiveRecord::Base
  belongs_to :backer
  belongs_to :fundraiser

  
end
  
