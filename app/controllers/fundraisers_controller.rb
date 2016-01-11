class FundraisersController < ApplicationController

  def new
    @fundraiser = Fundraiser.new
  end

  def create
    fundraiser = Fundraiser.new(fundraiser_params)
    if fundraiser.save
      redirect_to fundraiser_path(fundraiser)
    else
      render :error
    end 
  end  
  
  def index
    @fundraisers = Fundraiser.all
  end

  def show
    @bid = Bid.new
    @fundraiser = Fundraiser.find(params[:id])
  end  

  private

  def fundraiser_params
    params.require(:fundraiser).permit(:title, :description, :goal, :money_raised, :days_left, :number_of_backers)
  end  
end
