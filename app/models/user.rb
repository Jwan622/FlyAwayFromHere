class User < ActiveRecord::Base
  has_secure_password

  enum role: [ :flyer, :admin ]
end
