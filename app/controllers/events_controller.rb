class EventsController < ApplicationController
  before_action :authenticate_user!, except:[:show, :index]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
    @event = current_user.created_events.build
    
  end

  def create
    @event = current_user.created_events.build(event_params)
    @event.attendees << current_user
    
    if @event.save
      flash[:success] = 'Event created successfully'

      redirect_to @event
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = 'Event updated successfully'

      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  private
  def event_params
    params.require(:event).permit(:title,:date,:location,:description)
  end
  
end
