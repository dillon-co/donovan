# == Schema Information
#
# Table name: bids
#
#  id            :integer          not null, primary key
#  backer_id     :integer
#  fundraiser_id :integer
#  money_backed  :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Bid < ActiveRecord::Base
  belongs_to :backer
  belongs_to :fundraiser

  def equity_owned
    greater_of_goal_and_raised = [fundraiser.goal, fundraiser.money_raised].max.to_f
    money_backed / greater_of_goal_and_raised * 100
  end  
end

