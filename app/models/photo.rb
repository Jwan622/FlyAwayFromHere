class Photo < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x400>",
    :thumb => "100x100>" },
    :default_url => "/images/:style/logo3.png"

  validates_attachment :avatar, :presence => true,
    :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]
end
