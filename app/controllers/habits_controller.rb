class HabitsController < ApplicationController
  def index
    byebug
  end

  def create
    habit = Habit.create(habit_params)
    render json: habit.to_json
  end

  def show
    byebug
  end
  
  def update
    byebug
  end

  def destroy
    token = request.headers[:Authorization].split(' ')[1]
    decoded_token = JWT.decode(token, 'tweak', true, algorithm: 'HS256')
    user_id = decoded_token[0]['user_id']
    user = User.find(user_id)

    habit = Habit.find(params['id'])

    if user.id === habit.user_id
      habit.delete
      render json: {message: 'habit delete', habits: user.habits}
    end
    
    
    
  end

  private 
  def habit_params
    params.require(:habit).permit(:title, :difficulty, :note, :type, :user_id)
  end
end