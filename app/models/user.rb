class User < ActiveRecord::Base
  has_secure_password
  has_many :grams
  validates_presence_of :name, :email
  validates_format_of :email, with: /@/
  validates_uniqueness_of :email
  before_save { self.email = email.downcase }

end
