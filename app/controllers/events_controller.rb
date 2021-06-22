class EventsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
end
