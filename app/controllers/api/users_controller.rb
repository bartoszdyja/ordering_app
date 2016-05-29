class Api::UsersController < ApplicationController
  before_filter :set_current_user, :authenticate_user!
  def show
      render json: current_user
  end
end
