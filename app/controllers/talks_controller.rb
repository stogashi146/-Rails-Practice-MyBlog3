class TalksController < ApplicationController
  # before_action :authenticate_user!
  before_action :authenticate_user!,only: [:edit,:update,:destroy]


  def index
    @talks = Talk.all
  end

  def show
    @talk = Talk.find(params[:id])
  end

  def new
    @talk = Talk.new
  end

  def edit
    @talk = Talk.find(params[:id])
  end

  def update
    talk = Talk.find(params[:id])
    talk.update(talk_params)
    redirect_to talk_path(talk.id)
  end

  def destroy
    talk = Talk.find(params[:id])
    talk.destroy
    redirect_to talks_path
  end
  
  def create
    talk = Talk.new(talk_params)
    talk.user_id = current_user.id
    talk.save
    redirect_to talk_path(talk.id)
  end

  private
  def talk_params
    params.require(:talk).permit(:content)
  end
end
