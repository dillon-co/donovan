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
    # this in in cents, so this would be $5
    @amount = 500
    @bid = Fundraiser.find(params[:fundraiser_id]).bids.new(money_backed: params[:money_backed], backer_id: params[:backer_id])
    @bid.backer_id = current_backer.id
    if @bid.save 
      
    else
      render :error 
    end  
    backer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[:stripeToken],
    )
    charge = Stripe::Charge.create(
      :customer    => backer.id,
      :amount      => @amount, 
      :description => "Fundraiser's backer",
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    raise 'the roof'
    redirect_to new_charge_path
  end  

  private

  def bid_params
    params.require(:bid).permit(:money_backed, :backer_id)
  end
end
