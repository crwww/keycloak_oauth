require_relative "endpoints"

module KeycloakOauth
  class Connection
    include KeycloakOauth::Endpoints

    attr_reader :auth_url, :realm, :client_id, :client_secret, :callback_module, :scope

    def initialize(auth_url:, realm:, client_id:, client_secret:, callback_module: nil, scope: nil)
      @auth_url = auth_url
      @realm = realm
      @client_id = client_id
      @client_secret = client_secret
      @callback_module = callback_module
      @scope = scope ||= "openid"
    end

    def get_user_information(access_token:, refresh_token:)
      service = KeycloakOauth::UserInfoRetrievalService.new(
        access_token: access_token,
        refresh_token: refresh_token,
      )
      service.perform
      service.parsed_response_body
    end

    def logout(session:)
      service = KeycloakOauth::LogoutService.new(session)
      service.perform
    end
  end
end
