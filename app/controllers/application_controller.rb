class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # def hello
  #   render html: "hello world2"
  # end
  include SessionsHelper
end
