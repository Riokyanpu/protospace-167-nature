class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :move_to_index, only: [:edit]
  def index
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
    return unless current_user != @prototype.user

    redirect_to action: :index
  end
end
