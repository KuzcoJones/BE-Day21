class UsersController < ApplicationController

  def index 
  end

  def create
    byebug
    user = User.create!(user_params)
    payload = { user_id: user.id }
    token = JWT.encode(payload, 'tweak', 'HS256')
    render json: {token: token}
  end

  def show
  end

  def update 
  end

  private 
  def user_params
    #     params.require(:habit).permit(:title, :difficulty, :note, :type, :user_id)
    params.require(:user).permit(:email, :password)
  end

end

# keenan = User.create!(email: 'keenanjones210@gmail.com', password: '555', admin: true, type: 'User')
