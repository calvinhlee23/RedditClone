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

paul = User.new
paul.email = "paul@gmail.com"
paul.password = "password"
paul.save!

sub1 = Sub.new
sub1.user_id = calvin.id
sub1.title = "First Sub"
sub1.description = "This is the description of the Frist Title"
sub1.save!

sub2 = Sub.new
sub2.user_id = calvin.id
sub2.title = "Second Sub"
sub2.description = "This is the description of the Frist Title"
sub2.save!


post1 = Post.new
post1.author_id = paul.id
post1.title = "Title of the First Post"
post1.content = "This is the content of the first post. Yes, boring, I know"
post1.sub_id= sub1.id
post1.save!
