class CreateFundraisers < ActiveRecord::Migration
  def change
    create_table :fundraisers do |t|
      t.string :title
      t.string :description
      t.string :video_url
      t.integer :goal, null: false
      t.integer :equity_given_away, null: false
      t.integer :money_raised, default: 0, null: false
      t.integer :days_left
      t.integer :number_of_backers
      t.boolean :featured, default: false

      t.timestamps null: false
    end
  end
end
