class Fundraiser < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :backers
  has_many :bids
  
  
  # def set_money_raised
  #   update(money_raised: bids.sum(:money_backed))
  # end

  def money_raised
    bids.sum(:money_backed)
  end  
end
