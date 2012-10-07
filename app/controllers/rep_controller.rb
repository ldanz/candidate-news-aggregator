class RepController < ApplicationController
  def index
  	@user = User.find(params[:user_id] = 1)
#  	@reps = Rep.find(user: @user)
  end

  def show
  end
end
