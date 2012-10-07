class User < ActiveRecord::Base
  attr_accessible :economy, :healthcare, :name, :social_security, :zipcode

  VALID_ZIPCODE = /\d{5}/
  validates :zipcode, presence: true, format: {with: VALID_ZIPCODE}

end
