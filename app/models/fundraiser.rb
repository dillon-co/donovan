class Fundraiser < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :backers
  has_many :bids
  
  
  def set_money_raised
    if bids.count > 0
      money_raised = bids.pluck(:money_backed).inject(&:+)
    end  
  end  
end
