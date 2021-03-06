class Photo < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :trip_info

  has_attached_file :avatar,
                    :styles => { :medium => "310x300#",
                                 :thumb => "100x100#",
                                 :city => "260x250#",
                                 :large => "500x300#"
                                },
                    :url => "/images/:class/:style/:basename.:extension",
                    :default_url => "/images/:style/logo3.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
