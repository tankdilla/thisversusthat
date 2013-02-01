class Vote
  include Mongoid::Document
  field :name, type: String
  
  belongs_to :tvt
  belongs_to :comment
end
