class EventsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all.reverse
  end

  def show
    @event = Event.find(params[:id])
    @start_date = @event.start_date.to_date.strftime('Le %d-%m-%Y à %-I:%M')
    # @end_date = @event.end_date.to_date.strftime('%d %m %Y')
  end

  def new
    @event = Event.new
  end


  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(post_params)
    redirect_to events_path
  end


  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  def create
    @event = Event.new(post_params)
    @event.organiser_id = current_user.id

    if @event.save
      redirect_to event_path(@event.id), alert: "Evènement créé avec succès"
    else
      p @event.errors.messages
      flash.now[:alert] = "Problème lors de la création de l'évènement"
      render :new
    end
  end

  def post_params
    params.require(:event).permit(:title,:description,:duration,:location,:price,:start_date,:img_event)
  end

end
