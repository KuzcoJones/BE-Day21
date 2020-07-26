class DailyHabitsController < ApplicationController
 def index
 end

 def create 
  token = request.headers[:Authorization].split(' ')[1]
  decoded_token = JWT.decode(token, 'tweak', true, algorithm: 'HS256')
  user_id = decoded_token[0]['user_id']
  user = User.find(user_id)
  # byebug
  daily = Daily.find_by(user_id: user_id)
  habit = Habit.find(params['habit_id'])
  daily_habit = DailyHabit.create(habit:habit, daily: daily)
  daily_habits = user.daily.habits
  render json: {message: 'Created Daily Habit', daily_habits: daily_habits}
 end 

 def show 
 end

 def update
  token = request.headers[:Authorization].split(' ')[1]
  decoded_token = JWT.decode(token, 'tweak', true, algorithm: 'HS256')
  user_id = decoded_token[0]['user_id']
  daily_habit = DailyHabit.find_by(habit_id: params['habit_id'])
  user = User.find(user_id)
  # byebug
  if daily_habit.completed === true 
   daily_habit.update(completed: params['completed'])
   streak = daily_habit.streak
   streak = streak.to_i
   streak += 1
   daily_habit.update(streak: streak) 
   daily_habits = user.daily.habits
   render json: {message: 'Edited Daily Habit', daily_habits: daily_habits}
  else
   render json: {message: 'Daily Habit update failed', daily_habits: daily_habits}
  end
 end

 def destroy
  
  token = request.headers[:Authorization].split(' ')[1]
  decoded_token = JWT.decode(token, 'tweak', true, algorithm: 'HS256')
  user_id = decoded_token[0]['user_id']
  user = User.find(user_id)
  daily = Daily.find_by(user_id: user_id)
  daily_habit = DailyHabit.find_by(habit_id: params["habit_id"], daily: daily )
  daily_habits = user.daily.habits
  if user_id === daily.user_id && daily_habit 
   daily_habit.delete
   # byebug
  render json: {message: 'Daily Habit was Deleted', daily_habits: daily_habits}
 else 
  render json: {message: 'Daily Habit was not Deleted', daily_habits: daily_habits}
 end
end


end
