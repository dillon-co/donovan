class Fundraiser < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :backers
  has_many :bids
  
  
  def set_money_raised
    if self.bids.present?
      self.money_raised = self.bids.pluck(:money_backed).inject(&:+)
      self.save
    end  
  end  
end
