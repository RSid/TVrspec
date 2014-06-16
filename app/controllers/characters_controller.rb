class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    # @television_show = TelevisionShow.new(television_show_params)

    # if @television_show.save
    #   flash[:notice] = "Success!"
    #   redirect_to '/television_shows'
    # else
    #   flash.now[:notice] = "Your movie couldn't be saved."
    #   render :new
    # end
  end

  private

  def character_params
    params.require(:charcter).permit(:name, :show_id)
  end
end
