class Post < ActiveRecord::Base
  attr_accessible :title,
                  :description,
                  :steps,
                  :tags_attributes,
                  :banner,
                  :remote_banner_url,
                  :remove_banner

  validates :title, :presence => true,
                    :length => { :maximum => 40 }
  
  validates :description,  :presence => true
 # validates :steps,    :presence => true
  validates :user_id,  :presence => true

  has_many :comments, :dependent => :destroy, :as => :commentable
  has_many :tags, :dependent => :destroy

  has_many :pages, :dependent => :destroy

  accepts_nested_attributes_for :tags,
                                :allow_destroy => :true,
                                :reject_if => proc { 
                                  |attrs| attrs.all? {
                                    |k, v| v.blank? 
                                  } 
                                }
  belongs_to :user

  mount_uploader :banner, BannerUploader
  
end
