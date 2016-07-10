# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

calvin = User.new
calvin.email = "calvinhlee23@gmail.com"
calvin.password = "password"
calvin.save!

sub1 = Sub.new
sub1.user_id = calvin.id
sub1.title = "First Title"
sub1.description = "This is the description of the Frist Title"
