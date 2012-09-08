# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(:email => "abcdef@gmail.com", :password => 'password')
u2 = User.create(:email => "test@gmail.com", :password => 'password')
u3 = User.create(:email => "foobar@gmail.com", :password => 'password')

u1.profile = Profile.create(:name => "John Smith")
u2.profile = Profile.create(:name => "Jack Wellington")
u3.profile = Profile.create(:name => "Foo Bar")

Peership.create(:user_id => u1.id, :user2_id => u2.id)
PeerRequest.create(:user_id => u1.id, :to => u3.id)


