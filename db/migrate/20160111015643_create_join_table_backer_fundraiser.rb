class CreateJoinTableBackerFundraiser < ActiveRecord::Migration
  def change
    create_join_table :backers, :fundraisers do |t|
      # t.index [:backer_id, :fundraiser_id]
      # t.index [:fundraiser_id, :backer_id]
    end
  end
end
