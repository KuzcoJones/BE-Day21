class AuthController < ApplicationController
  def create
    user = User.find_by(email: params["email"])
    
    
    if user && user.authenticate(params[:password])
      payload = { user_id: user.id }
      token = JWT.encode(payload, 'tweak', 'HS256')
      render json: {token: token}
    else
      render json: { error: 'User not found' }, status: 404
    end

  end

  def show
    token = request.headers[:Authorization].split(' ')[1]
    decoded_token = JWT.decode(token, 'tweak', true, algorithm: 'HS256')
    user_id = decoded_token[0]['user_id']
    user = User.find(user_id)
    if user 
      render json: UserSerializer.new(user).to_serialized_json
    else
      render json: {error: 'Invalid Token'}, status: 401
    end
  end

end
