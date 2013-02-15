class Vote
  include Mongoid::Document
  field :name, type: String
  field :ip_address
  
  belongs_to :showdown
  belongs_to :topic
  belongs_to :comment
  
  validates :ip_address, :presence=> true, :uniqueness=> {:scope => [:comment_id, :showdown_id], :message => "entry already logged for client"}
  
end
