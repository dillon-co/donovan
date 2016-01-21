class FundraisersController < ApplicationController
 
  def new
    @fundraiser = Fundraiser.new
  end

  def create
    fundraiser = Fundraiser.new(fundraiser_params)
    if fundraiser.save 
      redirect_to fundraiser_path(fundraiser)
    else  
      render :new
    end 
  end  
  
  def index
    @fundraisers = Fundraiser.all
  end

  def show
    @fundraiser = Fundraiser.find(params[:id])
    @bid = @fundraiser.bids.new
  end  

  def edit
    @fundraiser = Fundraiser.find(params[:id])
  end  

  def update
    fundraiser = Fundraiser.find(params[:id]).update(fundraiser_params)
  end  

  private

  def fundraiser_params
    params.require(:fundraiser).permit(:title, :description, :goal, :money_raised, :days_left, :number_of_backers, :bids)
  end   

end
