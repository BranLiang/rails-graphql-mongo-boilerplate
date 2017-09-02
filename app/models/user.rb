class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include BCrypt

  attr_accessor :password, :password_confirmation

  embeds_one :profile, autobuild: true

  field :name, type: String
  field :login, type: String
  field :password_hash, type: String

  validates_presence_of :name, message: I18n.t('name_not_presence')
  validates_length_of :name, in: 2..5, message: I18n.t('name_length_invalid')
  validates_format_of :name, with: /\p{Han}/u, message: I18n.t('name_format_error')
  validates_presence_of :login, message: I18n.t('login_not_presence')
  validates_uniqueness_of :login, message: I18n.t('login_should_be_uniq')
  validates_length_of :password, minimum: 8, message: I18n.t('password_too_short')
  validates_confirmation_of :password, message: I18n.t('password_confirmation_not_match')

  before_save :encrypt_password

  def authenticate(password)
    Password.new(password_hash) == password
  end

  protected

  def encrypt_password
    self.password_hash = Password.create(@password)
  end
end
