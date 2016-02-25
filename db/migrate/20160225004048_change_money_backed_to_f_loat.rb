class ChangeMoneyBackedToFLoat < ActiveRecord::Migration
  def change
    change_column :bids, :money_backed, :float
  end
end
