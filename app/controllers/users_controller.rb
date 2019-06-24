class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # debugger 
    # (控制台有效果)
  end
  def new
    # debugger
    @user = User.new
  end

  def create
    # 有漏洞,4.0开始不能用了
    # @user = User.new(params[:user])
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App"
      redirect_to @user
    else
      render 'new'
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
