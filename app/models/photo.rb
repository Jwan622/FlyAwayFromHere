class Photo < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :trip_info

  has_attached_file :avatar,
                    :styles => { :medium => "300x400#>",
                                 :thumb => "100x100#>",
                                 :city => "260x250#",
                                 :large => "500x500#"},
                    # :convert_options => { :medium => "-quality 70 -interlace Plane -strip",
                    #                       :small => "-quality 70 -interlace Plane -strip",
                    #                       :thumb => "-quality 70 -interlace Plane -strip" },
                    :default_url => "/images/:style/logo3.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
