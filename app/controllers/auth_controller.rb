class AuthController < ApplicationController
  def create
    user = User.find_by(email: params["email"])
    # byebug
    payload = { user_id: user.id }
    token = JWT.encode(payload, 'tweak', 'HS256')

    if user && user.authenticate(params[:password])
      render json: {token: token}
    end

  end

  def show
    token = request.headers[:Authorization].split(' ')[1]
    decoded_token = JWT.decode(token, 'tweak', true, algorithm: 'HS256')
    user_id = decoded_token[0]['user_id']
    user = User.find(user_id)

    if user 
      render json: user.to_json(
        # render habits and daily 
        include: [habits: {only: [:id, :title, :difficulty, :note, :completed, :streak, :type ]}, tags: {only: [:id, :title]}, daily: {only: [:id, :completed, :title]} ], except: [:password_digest, :pin, :updated_at, :created_at]
      )
      
  else
      render json: {error: 'Invalid Token'}, status: 401
  end
  end



  private
  
end
