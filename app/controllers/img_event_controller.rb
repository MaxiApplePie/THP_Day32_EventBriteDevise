class ImgEventController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.img_event.attach(params[:img_event])
    redirect_to(event_path(@event))
  end

  def update
    puts "**" * 60
    @event = Event.find(params[:event_id])
    @event.img_event.attach(params[:img_event])
    redirect_to(event_path(@event))
  end
end