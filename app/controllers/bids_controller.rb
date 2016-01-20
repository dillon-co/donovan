class BidsController < ApplicationController
  
  def _new_bid
    @bid = Bid.new
  end  

  def new
    @bid = Bid.new
  end  

  def show
    @bid = Bid.find(params[:id])
  end  

  def index
    @bids = Bid.all
  end  

  def create
    bid = Fundraiser.find(params[:fundraiser_id]).bids.new(bid_params)
    if bid.save 
      redirect_to :back
    else
      render :error 
    end  
  end  

  private

  def bid_params
    params.require(:bid).permit(:money_backed)
  end
end
