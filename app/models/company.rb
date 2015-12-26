class Company < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :fundraisers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
