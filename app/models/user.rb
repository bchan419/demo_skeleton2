class User < ActiveRecord::Base
  
  has_secure_password
  
  attr_accessible :email, :first_name, :last_name, :tsl_class, :user_name
  attr_accessible :password, :password_confirmation

  # validates_uniqueness_of :email

  has_many :skillsets    
  has_many :expertises, :through => :skillsets
end
