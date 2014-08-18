class User < ActiveRecord::Base

  has_secure_password
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :username, presence: true, uniqueness: {case_sensitive: false}

end