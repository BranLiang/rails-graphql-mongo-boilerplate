class AuthenticateApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @auth_header = headers[:Authorization]
  end

  def call
    user
  end

  private

  attr_reader :auth_header

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, I18n.t('invalid_token')) && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    return auth_header.split(' ').last if auth_header.present?
    errors.add :token, I18n.t('missing_token')
    nil
  end
end
