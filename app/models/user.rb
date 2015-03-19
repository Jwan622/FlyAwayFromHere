class User < ActiveRecord::Base
  include AirportAndCityLookupHelper

  has_secure_password
  has_many :photos
  before_save :email_downcase
  before_save :city_slugify

  validates :username, presence: true,
                       uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    if: :not_through_oauth?

  validate :valid_email?
  validate :valid_city?, :on => :update

  enum role: [ :flyer, :admin ]

  def self.find_or_create_from_auth_hash(auth)
    User.find_or_create_by!(attributes_from(auth)) do |member|
      member.first_name = auth.info.name.split[0] if auth.info.name.split[0]
      member.last_name = auth.info.name.split[1] if auth.info.name.split[1]
      member.username = auth.info.nickname
      member.image_url = auth.info.image
      member.role = 0
      member.departure_city_slug = "new-york-city"
      member.city = auth.info.location
      member.token = auth.credentials.token
      member.password = SecureRandom.urlsafe_base64
    end
  end

  def valid_email?
    email_checker if self.email
  end

  def full_name
    first_name + " " + last_name
  end

  def valid_city?
    unless airport_lookup[city.parameterize]
      errors.add(:error, "We don't fly from that city hub.")
    end
  end

  private

  def self.attributes_from(auth)
   { provider: auth.provider, uid: auth.uid }
  end

  def email_checker
    unless self.email =~ /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+$/
      errors.add(:error, "Your email isn't valid")
    end
  end

  def not_through_oauth?
    !token.present?
  end

  def email_downcase
    self.email = email.downcase if not_through_oauth?
  end

  def city_slugify
    self.departure_city_slug = city.parameterize
  end

end
