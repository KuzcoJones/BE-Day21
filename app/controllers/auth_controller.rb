class AuthController < ApplicationController
  def create
      byebug
  end

  def show
  end



  private
  def auth 
    request.env['omniauth.auth']
  end
end
