class Pin < ActiveRecord::Base
	belongs_to :user 
	has_attached_file :image, :styles => {:full => "auto", :large => "600x600>", :medium => "300x300>", :thumb => "100x100>"}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :image, presence: true
	validates :description, presence: true

end


