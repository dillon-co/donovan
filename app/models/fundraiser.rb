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

class Fundraiser < ActiveRecord::Base
  belongs_to :company
  
  has_many :bids
  has_many :backers, :through => :bids

  # has_attached_file :video, :styles => {  
  #   :large => {:geometry => "1000x600>", :format => 'flv'}
  # }, :processors => [:transcoder] 
  # validates_attachment_content_type :video, :content_type => /\Avideo\/.*\Z/
  # validates_presence_of :video
  # mount_uploader :video, VideoUploader 

  def owners_valuation
    (100/equity_given_away) * goal
  end  

  def self.get_featured
    featured_fundraisers = Fundraiser.where(featured: true).order(:created_at)
    featured_fundraisers.first(5)
  end    

  def money_raised
    bids.sum(:money_backed)
  end  

  def number_of_bids
    bids.count
  end  

  def embed(youtube_url)
    youtube_url.split("=").last
  end    
end
