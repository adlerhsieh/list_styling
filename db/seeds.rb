# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a_post = Post.create([{title: "an example post", content: "this is simply a post content"}])
b_post = Post.create([{title: "this is the second example post", content: "this is simply a post content 2"}])