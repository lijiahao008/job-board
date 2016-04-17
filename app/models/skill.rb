class Skill < ActiveRecord::Base
	searchkick
	belongs_to :user
	has_many :reviews
	has_attached_file :avatar, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end