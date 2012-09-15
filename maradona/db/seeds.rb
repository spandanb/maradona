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

u1.profile = Profile.create(name: "John Smith", class_of: 2013, institution: "Ryerson University", department: "Faculty of Engineering and Architectural Science", honours: "BEng. Electrical Engineering" )
u2.profile = Profile.create(:name => "Jack Wellington", class_of: 2013, institution: "Ryerson University", department: "Ted Rogers School of Management", honours: "Bachelor of Commerce")
u3.profile = Profile.create(:name => "Foo Bar", class_of: 2013, institution: "Ryerson University", department: "Faculty of Science", honours: " Bachelor of Science")


Peership.create(:user_id => u1.id, :user2_id => u2.id)
PeerRequest.create(:user_id => u1.id, :to => u3.id)


Item.create(owner_id: u1.id, name: "Sedra Smith Microelectronics", price: 49.99, description: "Great Condition. Long Text. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
Item.create(owner_id: u2.id, name: "Fundamentals of Macroeconomics", price: 65, description: "Great Condition. Short Text. Lorem ipsum dolor sit amet.")
Item.create(owner_id: u3.id, name: "Ethics", price: 20, description: "Great Condition. Shortest Text.")


g1 = Group.create(name: "Evolutionary Biology Study Group")
g2 = Group.create(name: "Investement Banking: 101")

=begin
g2.users << u1 << u2 << u3
g1.users << u2 << u3
=end
