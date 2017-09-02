class User
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :profile, autobuild: true

  field :name, type: String
  field :login, type: String
  field :password

  validates :name, length: { in: 2..8 }, format: { with: /\p{Han}/u }
end
