class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # def hello
  #   render html: "hello world2"
  # end
  include SessionsHelper


  private
    # 前置过滤器，确保用户已登录
    def logged_in_user
      unless logged_in?
        store_location
        flash[:dander] = '请登录'
        redirect_to login_url
      end
    end
end
