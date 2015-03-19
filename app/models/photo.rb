class Photo < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :trip_info

  has_attached_file :avatar,
                    :styles => { :medium => "300x400>",
                                 :thumb => "100x100>",
                                 :city => "280x340",
                                 :large => "500x500"},
                    :path => ":rails_root/public/assets/:class/:attachment/:id_partition/:style/:filename",
                    :default_url => "/images/:style/logo3.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
