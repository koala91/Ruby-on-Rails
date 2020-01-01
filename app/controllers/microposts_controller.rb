class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destory]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = '发布成功'
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end

  def destory

  end
end
