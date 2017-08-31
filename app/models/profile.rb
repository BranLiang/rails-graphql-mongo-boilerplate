class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  embedded_in :user
  field :gender, type: String, default: 'male'
  validates :gender, inclusion: { in: %w(male female) }
end
