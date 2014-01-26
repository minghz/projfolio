class Post < ActiveRecord::Base
  attr_accessible :title,
                  :description,
                  :steps,
                  :tags_attributes,
                  :banner,
                  :remote_banner_url,
                  :remove_banner

  has_many :comments, :dependent => :destroy, :as => :commentable
  has_many :tags, :dependent => :destroy
  has_many :pages, :dependent => :destroy

  belongs_to :user

  validates :title, :presence => true,
                    :length => { :maximum => 40 }
  validates :description,  :presence => true
  validates :user_id,  :presence => true
 # validates :steps,    :presence => true
  validate :tags_limit

  accepts_nested_attributes_for :tags,
                                :allow_destroy => :true,
                                :reject_if => proc { 
                                  |attrs| attrs.all? {
                                    |k, v| v.blank? 
                                  } 
                                }

  mount_uploader :banner, BannerUploader
  
  def tags_limit
    if self.tags.length > 3
      errors.add :base, 'No more tan 3 tags'
    end
  end

end
