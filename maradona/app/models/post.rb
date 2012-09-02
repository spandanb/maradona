class Post < ActiveRecord::Base
  attr_accessible :body, :city, :country, :latitude, :longitude, :reply_to_id, :user_id

  # only allow access to some of the attributes
#  attr_accessible :body, :reply_to_id, :ip_address

  # set up the geocoding to locate the tweets
  geocoded_by :ip_address do |obj,results|
    if geo = results.first
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
      obj.city    = geo.city
      obj.country = geo.country_code
    end
  end
  # and run the geocoding once the object is valid
  after_validation :geocode

  # a post belongs to the user who wrote it
  belongs_to :user

  # and it might have some replies to it
  has_many :replies, {:class_name => "Post",
                      :foreign_key => "reply_to_id"}
  belongs_to :in_reply_to, {:class_name => "Post",
                            :foreign_key => "reply_to_id"}

  # make sure that the post has a body, and that it is between
  # 1 and 140 characters long.
  validates :body, :length => 1..140, :presence => true


  # create a virtual attribute to store the ip_address of
  # the request. you might actually want to store this in your
  # database in a production application, but we won't in this
  # tutorial.
  def ip_address
    @ip_address ||= nil
  end

  def ip_address=(ip)
    @ip_address = ip
  end
end
