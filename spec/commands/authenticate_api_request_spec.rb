RSpec.describe 'AuthenticateApiRequest' do
  let!(:current_user) { create(:user) }

  it 'return current_user with Authorization header' do
    auth_header = "Bearer #{JsonWebToken.encode(user_id: current_user.id.to_str)}"
    header = { Authorization: auth_header }
    decoded_user = AuthenticateApiRequest.call(header).result

    expect(decoded_user.name).to eq(current_user.name)
    expect(decoded_user.id.to_str).to eq(current_user.id.to_str)
  end
end
