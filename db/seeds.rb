# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

fiorina = User.create username: 'Fiorina', password_digest: 'eewwqe'
trump = User.create username: 'Trump', password_digest: 'eewwqe'
carson = User.create username: 'Carson', password_digest: 'eewwqe'
clinton = User.create username: 'Clinton', password_digest: 'eewwqe'

Profile.create user: fiorina, birth_year: 1954, first_name: 'Carly', last_name: 'Fiorina', gender: 'female'
Profile.create user: trump, birth_year: 1946, first_name: 'Donald', last_name: 'Trump', gender: 'male'
Profile.create user: carson, birth_year: 1951, first_name: 'Ben', last_name: 'Carson', gender: 'male'
Profile.create user: clinton, birth_year: 1947, first_name: 'Hillary', last_name: 'Clinton', gender: 'female'

next_year = Date.today + 1.year

TodoList.delete_all

fiorina_list = TodoList.create user: fiorina, list_due_date: next_year
trump_list = TodoList.create user: trump, list_due_date: next_year
carson_list = TodoList.create user: carson, list_due_date: next_year
clinton_list = TodoList.create user: clinton, list_due_date: next_year

[fiorina_list, trump_list, carson_list, clinton_list].each do |list|
  5.times { TodoItem.create( description: "blabla", title: "bleble", due_date: next_year, todo_list: list, completed: false ) }
end
