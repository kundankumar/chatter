# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(name: 'User1', email: 'user1@example.com')
u2 = User.create(name: 'User2', email: 'user2@example.com')
u3 = User.create(name: 'User3', email: 'user3@example.com')
u4 = User.create(name: 'User4', email: 'user4@example.com')

Tweet.create(content: 'content1', user: u1)
Tweet.create(content: 'content2', user: u1)
Tweet.create(content: 'content3', user: u2)
Tweet.create(content: 'content4', user: u2)
Tweet.create(content: 'content5', user: u3)
Tweet.create(content: 'content6', user: u3)
Tweet.create(content: 'content7', user: u4)
Tweet.create(content: 'content8', user: u4)

u2.follow_down.create(following_id: u1.id)
u4.follow_down.create(following_id: u3.id)
