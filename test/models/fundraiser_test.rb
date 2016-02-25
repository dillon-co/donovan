# == Schema Information
#
# Table name: fundraisers
#
#  id                :integer          not null, primary key
#  title             :string
#  description       :string
#  video_url         :string
#  goal              :integer          not null
#  equity_given_away :integer          not null
#  money_raised      :integer          default(0), not null
#  days_left         :integer
#  number_of_backers :integer
#  featured          :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class FundraiserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
