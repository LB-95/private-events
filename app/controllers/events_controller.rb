class EventsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.created_events.build
    
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:success] = 'Event created successfully'

      redirect_to @event
    else
      render :new
    end
  end

  private
  def event_params
    params.require(:event).permit(:title,:date,:location,:description)
  end
  
end
