class Topic
  include Mongoid::Document
  field :name
  field :description
  field :url
  
  belongs_to :showdown
  
  mount_uploader :avatar, AvatarUploader
  
  #attr_accessible :name, :description, :url, :avatar, :avatar_cache
  
  validates_presence_of :name
  
end
