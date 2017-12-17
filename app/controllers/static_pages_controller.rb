class StaticPagesController < ApplicationController
  before_action :check_authentication, only: :enter
  
  def home
    render :home
  end

  def enter
    redirect_to new_event_path        
  end

  private

  def check_authentication
    unless params[:authentication_code] == Figaro.env.entry_auth_key
      flash.now[:alert] = "Invalid code!"
      render :home and return
    end
    
    return true
  end
end
