class RepsController < ApplicationController
  def index
    @user = User.find(params[:user_id] )
    @reps = Rep.get_legislators_in(User.find(params[:user_id]).zipcode)
  end

  def show
  end
end
