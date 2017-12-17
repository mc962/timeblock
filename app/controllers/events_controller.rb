class EventsController < ApplicationController
  def new
    render :new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event successfully saved"
      redirect_to new_event_path
    else
      flash.now[:error] = @event.errors.full_messages
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:time, :location, :title, :description, :comments)
  end
end
