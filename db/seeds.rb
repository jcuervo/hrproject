# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.delete_all
AdminUser.create(email: 'admin@example.com', password: 'adminpass', password_confirmation: 'adminpass', :role => 'admin')
AdminUser.create(email: 'mod@example.com', password: 'modpass', password_confirmation: 'modpass', :role => 'moderator')