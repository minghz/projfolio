class Page < ActiveRecord::Base
  attr_accessible :name, :chapter, :number, :image, :remote_image_url
  belongs_to :post
  mount_uploader :image, ImageUploader
end