class Vote
  include Mongoid::Document
  field :name, type: String
  
  belongs_to :showdown
  belongs_to :topic
  belongs_to :comment
end
