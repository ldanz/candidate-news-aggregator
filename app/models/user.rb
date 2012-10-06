class User < ActiveRecord::Base
  attr_accessible :economy, :healthcare, :name, :social_security, :zipcode

  validates_presence_of :zipcode
  validates_numericality_of :zipcode
end
