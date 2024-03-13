class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new]

  def show
    @user = User.find(params[:id])
  end
end
