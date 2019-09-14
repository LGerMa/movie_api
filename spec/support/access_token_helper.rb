module AccessTokenHelper
  #REDIRECT_URL = "https://localhost:3000".freeze
  def get_token(owner_id, scope = '')
    #app = Doorkeeper::Application.create!(name: "IOEmployeeControlAPI", redirect_uri: REDIRECT_URL)
    Doorkeeper::AccessToken.create!(resource_owner_id: owner_id, scopes: scope)
  end

  def get_headers(token)
    { 'Authorization' => "Bearer #{token}" }
  end
end