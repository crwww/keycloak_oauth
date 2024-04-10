require "singleton"

module KeycloakOauth
  class Configuration
    include Singleton

    attr_accessor :auth_url, :realm, :client_id, :client_secret, :callback_module, :scope
  end
end
