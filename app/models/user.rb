class User < ActiveRecord::Base
  validates_presence_of :email, :first_name, :last_name, :provider, :on => :create
  validates_uniqueness_of :email

  has_secure_password(validations: false)
end
