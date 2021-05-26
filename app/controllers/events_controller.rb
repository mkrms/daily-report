class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def show
  end

 def create
   @event = Event.new(event_params)
   if @event.save
    redirect_to events_path
   else
    render 'new'
   end
 end

 def update
  if @event.update(event_params)
    redirect_to events_path
  else
    render 'edit'
  end
 end

 def destroy
   if @event.destroy
    redirect_to events_path
   else
    render 'edit'
   end
 end

 private

 def set_event
  @event = Event.find(params[:id])
end

def event_params
  params.require(:event).permit(:title, :team, :start_date, :end_date)
end
end
