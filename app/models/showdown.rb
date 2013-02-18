class Showdown
  include Mongoid::Document
  field :name, type: String
  field :topic_ids, type: Array, :default=>[]
  
  #has_many :topics
  has_many :votes, :dependent=>:destroy
  embeds_many :comments
  
  def topics
    Topic.in(id: topic_ids)
  end
  
  def votes_for(topic)
    Vote.where(topic_id: topic.id, showdown_id: self.id).count
  end
end
