class Backers::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  def current_backer_bids
    @backer = current_backer
    @bids = current_backer.bids.all
    @total_equity_given = total_equity_given_to_current_company(:fundraiser_id)
    @total_equity_owned = total_equity_given_to_current_company(:fundraiser_id)
  end  

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
