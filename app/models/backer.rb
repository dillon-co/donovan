# == Schema Information
#
# Table name: backers
#
#  id                     :integer          not null, primary key
#  name                   :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  bid                    :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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
