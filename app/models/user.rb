class User < ActiveRecord::Base
  has_secure_password

  enum role: [ :flyer, :admin ]

  def self.find_or_create_from_auth_hash(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)

    user.first_name = auth.info.name.split[0]
    user.last_name = auth.info.name.split[1]
    user.username = auth.info.nickname
    user.image_url = auth.info.image
    user.city = auth.info.location
    user.token = auth.credentials.token
    user.save
    user
  end
end
