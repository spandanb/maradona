class Profile < ActiveRecord::Base
  attr_accessible :name,:user_id
  belongs_to :user
  
  validates :class_of, :inclusion => 2000..2030 
  validates :name, :presence => true 
  validates :institution ,:presence => true 
  validates :department ,:presence => true 
  validates :honours ,:presence => true 
  
end
