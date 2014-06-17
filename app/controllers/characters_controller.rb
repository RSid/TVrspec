class CharactersController < ApplicationController
  def index
    @character = Character.new()
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    if Character.find_by(name: (@character.name)) == nil
      if @character.save
        flash[:notice] = "Success!"
        redirect_to '/characters'
      else
        flash.now[:notice] = "Your character couldn't be saved."
        render :new
      end
    else
      flash.now[:notice] = "Character already exists."
        render :new
    end
  end

  def destroy

    @character = Character.find(params["character"]["id"])
    @character.destroy
    redirect_to '/characters'
  end

  private

  def character_params

    params.require(:character).permit(:name,:show_id, :actor_name, :description)

  end
end
