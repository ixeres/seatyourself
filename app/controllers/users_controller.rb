class UsersController < ApplicationController
  def index
    @users = Users.all
  end

  def show
    @user = Users.find(params[:id])
  end
  def new
    @user = Users.new
  end

  def edit
    @user = Users.find(params[:id])
  end

  def create
    @user = Users.new(user_params)

    if @users.save
      redirect_to  user_url
    else
      render :new
    end
  end

end

def update
  @user = User.find(params[:id])

  if @user.update_attributes(user_params)
    redirect_to user_url(@user)
  else
    render :edit
  end
end

def destroy
  @user = user.find(params[:id])
  @user.destroy
  redirect_to users_url
end

private

def user_params
  params.require(:user).permit(:name, :description, :address, :menu, :guests, :image)
end
end
