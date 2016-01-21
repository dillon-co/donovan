class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :backer_id
      t.integer :fundraiser_id
      t.integer :money_backed
      t.timestamps null: false
    end
  end
end
