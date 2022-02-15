class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def edit
  end
  
  def update
  end  

  def follows
  end

  def followers
  end
end
