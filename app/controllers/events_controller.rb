class EventsController < ApplicationController
  # before_action :redirect_if_authenticated, only: :enter
  before_action :authenticate_session, only: :create

  def new
    reset_session
    render :new
  end

  def enter
    if authenticate_code(params[:authentication_code])
      redirect_to action: :new
    else
      flash.now[:alert] = "Invalid code!"
      render :new
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event successfully saved"
      EventMailer.create_event_email(@event).deliver_now
      redirect_to root_path
    else
      flash.now[:error] = @event.errors.full_messages
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:time, :location, :title, :description, :comments, :authentication_code)
  end

  def authenticate_code(code)
    if code == Figaro.env.entry_auth_key
      session[:authentication_code] = Figaro.env.session_auth_key
      return true
    else
      return false
    end
  end

  def authenticate_session
    unless session[:authentication_code] == Figaro.env.session_auth_key
      flash.now[:error] = "You are not authorized to view this page. Enter a valid authentication code below"
      render :new, status: 403 and return
    end

    return true
  end

  def redirect_if_authenticated
    if authenticate_session
      redirect_to action: :new
    end
  end

end
