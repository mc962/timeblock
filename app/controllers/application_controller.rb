class ApplicationController < ActionController::Base
  helper_method :basicly_authenticated?

  protect_from_forgery with: :exception

  private

  def basicly_authenticated?
    if session[:authentication_code] == Figaro.env.entry_auth_key
      true
    else
      false
    end
  end
end
