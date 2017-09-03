class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user, counter_cache: true

  field :title, type: String
end
