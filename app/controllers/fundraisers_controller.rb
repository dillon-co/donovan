class FundraisersController < ApplicationController
  before_filter :authenticate_backer!

  def new
    @fundraiser = Fundraiser.new
  end

  def create
    fundraiser = Fundraiser.new(fundraiser_params)
    # raise "the roof"
    if fundraiser.save 
      redirect_to fundraiser_path(fundraiser)
    else  
      render :new
    end 
  end  

  def home
    @featured_fundraisers = Fundraiser.where(featured: true)
  end  
  
  def index
    @fundraisers = Fundraiser.all
  end

  def show
    @fundraiser = Fundraiser.find(params[:id])
    @youtube_id = @fundraiser.embed(@fundraiser.video_url)
    @bid = @fundraiser.bids.new
    @backer = current_backer
    @bids = current_backer.bids.all
    @bid_count = @bids.count
    @total_cash_given = current_backer.total_cash_given_to_current_company(:fundraiser_id)
    @total_equity_owned = current_backer.total_equity_owned_of_current_company(:fundraiser_id)
  end  

  def edit
    @fundraiser = Fundraiser.find(params[:id])
  end  

  def update
    fundraiser = Fundraiser.find(params[:id]).update(fundraiser_params)
  end  

  private

  def fundraiser_params
    params.require(:fundraiser).permit(:title, 
                                       :description,
                                       :goal,
                                       :equity_given_away,
                                       :money_raised,
                                       :days_left,
                                       :number_of_backers,
                                       :bids,
                                       :video_url
                                       )
  end   

end
