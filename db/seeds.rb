# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
HabitTag.destroy_all
Habit.destroy_all
Tag.destroy_all
User.destroy_all
Daily.destroy_all
 



keenan = User.create!(email: 'keenanjones210@gmail.com', password: '555', admin: true, type: 'User')
habit = Habit.create!(user: keenan, title: 'No Smiling', difficulty: 2, note: 'No smiling for 24 hours', type: 'BadHabit')
sarai = User.create!(email: 'sarai@gmail.com', password: '555', admin: false, type: 'User')
tag = Tag.create!(title: 'Health')
habit_tag = HabitTag.create!(habit: habit, tag: tag)
daily = Daily.create!(user: keenan, title: 'Saturday', completed: false)
keenan.update!(type:'Admin', pin: 1234)
daily_habit = DailyHabit.create!(habit: habit, daily: daily)






