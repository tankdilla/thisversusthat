class Vote
  include Mongoid::Document
  field :name, type: String
  field :ip_address
  
  belongs_to :showdown
  belongs_to :topic
  belongs_to :comment
  
  validates_presence_of :ip_address
  before_save :check_duplicate_vote_per_scope
  
  def check_duplicate_vote_per_scope
    if !showdown_id.nil?
      Vote.where(showdown_id: showdown_id, ip_address: ip_address).first.nil?
    elsif !comment_id.nil?
      Vote.where(comment_id: comment_id, ip_address: ip_address).first.nil?
    end
  end
end
