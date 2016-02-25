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

require 'test_helper'

class BackerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
