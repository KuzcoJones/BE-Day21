class DailyHabitsController < ApplicationController
 def index
 end

 def create 
  token = request.headers[:Authorization].split(' ')[1]
  decoded_token = JWT.decode(token, 'tweak', true, algorithm: 'HS256')
  user_id = decoded_token[0]['user_id']
  user = User.find(user_id)
  daily = Daily.find_by(user_id: user_id)
  habit = Habit.find(params['habit_id'])
  daily_habit = DailyHabit.create(habit:habit, daily: daily)
  daily_habits = user.daily_habits
  render json: daily.to_json(:include => {:habits => {:only => [:id, :title, :difficulty, :note, :type]}})
 end 

 def show 
 end

 def update
  token = request.headers[:Authorization].split(' ')[1]
  decoded_token = JWT.decode(token, 'tweak', true, algorithm: 'HS256')
  user_id = decoded_token[0]['user_id']

  # if user id matches user id of daily

 end

 def destroy
  # if user id matches daily id and daily id matches dailyhabit daily_id then delete dailyhabit 
  # else return message process can't be completed 
  token = request.headers[:Authorization].split(' ')[1]
  decoded_token = JWT.decode(token, 'tweak', true, algorithm: 'HS256')
  user_id = decoded_token[0]['user_id']
  user = User.find(user_id)
  daily = Daily.find_by(user_id: user_id)
  daily_habit = DailyHabit.find_by(habit_id: params["habit_id"], daily: daily )

  if user_id === daily.user_id && daily.id === daily_habit.daily_id
  daily_habit.delete
  render json: UserSerializer.new(user).to_serialized_json 
 else 
  render json: {message: "User dones't match Daily"} 
 end

end


end
