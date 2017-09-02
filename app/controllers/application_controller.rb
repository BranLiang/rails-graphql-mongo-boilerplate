class ApplicationController < ActionController::Base
  before_action :authenticate_request
  protect_from_forgery with: :exception

  attr_reader :current_user
  helper_method :current_user

  private

  def authenticate_request
    @current_user = AuthenticateApiRequest.call(request.headers).result

    render json: { error: I18n.t('not_authorized') }, status: 401 unless @current_user
  end
end
