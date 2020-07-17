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
  # byebug
  render json: daily.to_json(:include => {:habits => {:only => [:id, :title, :difficulty, :note, :type]}})
  # render :json => user.daily_habits, :include => {:habits => {:only => :title, :difficulty, :note, :type }}
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
 end

end
