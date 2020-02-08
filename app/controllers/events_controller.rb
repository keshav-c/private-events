class EventsController < ApplicationController
  
  before_action :user_logged_in, only: :create

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    @event.save
    redirect_to event_path(@event)
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  private

    def event_params
      params.require(:event).permit(:name, :description, :time)
    end
end
