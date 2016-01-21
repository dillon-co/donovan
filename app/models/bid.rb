class Bid < ActiveRecord::Base
  belongs_to :backer
  belongs_to :fundraiser

  def equity_owned
    greater_of_goal_and_raised = [fundraiser.goal, fundraiser.money_raised].max.to_f
    money_backed / greater_of_goal_and_raised
  end  
end

