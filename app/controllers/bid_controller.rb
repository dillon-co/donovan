class BidsController < ApplicationController
  def create
    bid = Bid.new(bid_params)
    if bid.save 
      redirect_to fundraisers_path
    else
      render :error 
    end  
  end  

  private

  def bid_params
    params.require(:bid).permit(:money_backed)
  end  
end
