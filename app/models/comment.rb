class Comment
  include Mongoid::Document
  field :name
  field :comment_text
  
  belongs_to :user
  
  embedded_in :showdown
  
end
