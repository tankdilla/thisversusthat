class Comment
  include Mongoid::Document
  field :name, type: String
  
  belongs_to :user
  belongs_to :showdown
  
  validates_presence_of :user_id, :showdown_id
end
