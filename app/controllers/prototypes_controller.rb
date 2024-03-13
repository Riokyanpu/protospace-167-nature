class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]

  def index
    @prototypes = Prototype.all
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


  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = comment.comments.includes(:user)
  end

    def edit
    end

    def update
      @prototype = Prototype.find(params[:id])
      if @prototype.update(prototype_params)
        redirect_to root_path
      else
        render :edit, status: :unprocessable_entity
      end
    end
    
    def destroy
      @prototype = Prototype.find(params[:id])
      @prototype.destroy
      redirect_to root_path
    end

     


  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
