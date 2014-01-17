class Page < ActiveRecord::Base
  attr_accessible :name,
                  :chapter,
                  :number,
                  :image,
                  :remote_image_url,
                  :remove_image

  validates :name,  presence: true, 
                    length: { maximum: 50 }

  belongs_to :post
  mount_uploader :image, ImageUploader
end
