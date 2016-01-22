class Backer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :bids
  has_many :fundraisers, :through => :bids

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def total_equity_owned_of_current_company(id)
    array_of_all_equity_owned = []
    bids.where('fundraiser_id' == id).each { |bid| array_of_all_equity_owned << bid.equity_owned }
    array_of_all_equity_owned.sum
  end  

  def total_cash_given_to_current_company(id)
    bids.where('fundraiser_id' == id).sum(:money_backed)
  end  
end
