class User
  include Mongoid::Document
  include Mongoid::Timestamps
  embeds_one :profile
  field :name, type: String
  validates :name, length: { in: 2..8 }, format: { with: /\p{Han}/u }
end
