class User
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :profile

  field :name, type: String
end
