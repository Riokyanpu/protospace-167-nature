class PrototypesController < ApplicationController
  def index
  end

  def show
    @comment = Comment.new
    @comments = comment.comments.includes(:user)
  end




end

