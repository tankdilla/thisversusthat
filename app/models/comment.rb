class Comment
  include Mongoid::Document
  field :name
  field :comment_text
  
  belongs_to :user
  belongs_to :showdown
  
  embedded_in :showdown
  
  validates_presence_of :user_id, :showdown_id
end
