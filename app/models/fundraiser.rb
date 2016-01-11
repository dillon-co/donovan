class Fundraiser < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :backers
  has_many :bids
  before_save :set_money_raised
  
  def set_money_raised
    if bids.count > 0
      self.money_raised = bids.all.inject(&:+)
    end  
  end  
end
