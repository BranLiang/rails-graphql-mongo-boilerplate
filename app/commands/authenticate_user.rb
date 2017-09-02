class AuthenticateUser
  prepend SimpleCommand

  def initialize(login, password)
    @login = login
    @password = password
  end

  def call
    # user.id is like BSON::ObjectId('59aa330517617a0bc289457b') when using mongoid
    JsonWebToken.encode(user_id: user.id.to_str) if user
  end

  private

  attr_accessor :login, :password

  def user
    user = User.find_by(login: login)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, I18n.t('invalid_credentials')
    nil
  end
end
