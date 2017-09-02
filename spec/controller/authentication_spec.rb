require 'rails_helper'

RSpec.describe Api::AuthenticationController, type: :request do
  include ApiHelper
  let!(:current_user) { create(:user) }

  describe '#authenticate' do
    context 'with right credential' do
      before { post '/api/login', params: { login: 'login', password: '12345678' } }

      it 'return status 200' do
        expect(response.status).to eq(200)
      end

      it 'return auth_token' do
        expect(json_response.auth_token).to be_a(String)
      end
    end

    context 'with invalid login' do
      before { post '/api/login', params: { login: 'fake', password: 'fakefake' } }

      it 'return unauthorised status' do
        expect(response.status).to eq(401)
      end
    end

    context 'with valid login, but invalid password' do
      before { post '/api/login', params: { login: 'login', password: 'fakefake' } }

      it 'return unauthorised status' do
        expect(response.status).to eq(401)
      end
    end
  end

end
