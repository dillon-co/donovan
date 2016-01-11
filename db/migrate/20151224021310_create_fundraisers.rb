class CreateFundraisers < ActiveRecord::Migration
  def change
    create_table :fundraisers do |t|
      t.string :title
      t.text :description
      t.integer :goal
      t.integer :equity_given_away
      t.integer :money_raised
      t.integer :number_of_bids
      t.integer :days_left
      t.integer :number_of_backers

      t.timestamps null: false
    end
  end
end
