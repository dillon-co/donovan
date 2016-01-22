class Fundraiser < ActiveRecord::Base
  belongs_to :company
  
  has_many :bids
  has_many :backers, :through => :bids 
  
  # def set_money_raised
  #   update(money_raised: bids.sum(:money_backed))
  # end

  def money_raised
    bids.sum(:money_backed)
  end  

  def number_of_bids
    bids.count
  end  
end
