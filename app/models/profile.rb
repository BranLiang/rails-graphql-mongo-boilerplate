class Profile
  include Mongoid::Document

  embedded_in :user

  field :gender, type: Integer, default: 0
  validates_inclusion_of :gender, in: [0, 1]
end
