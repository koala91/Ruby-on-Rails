class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy ]
  before_action :correct_user, only: [:edit, :update]

  def index
    # @users = User.all
    @users = User.paginate(page:params[:page])
  end

  def show
    # http://localhost:3000/users/1
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    # http://localhost:3000/signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # 处理更新情况
      flash[:success] = "profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "删除成功"
    redirect_to users_url
  end
  



  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # 前置过滤器，确保用户已登录
    # def logged_in_user
    #   unless logged_in?
    #     store_location
    #     flash[:dander] = '请登录'
    #     redirect_to login_url
    #   end
    # end
    
    # 确保是正确的用户
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
    
end
