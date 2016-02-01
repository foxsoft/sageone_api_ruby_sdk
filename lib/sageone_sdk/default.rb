require 'sageone_sdk/version'

module SageoneSdk
  # Default
  module Default
    # Default Access Token
    ACCESS_TOKEN = "default_access_token"
    # Default Signing Secret
    SIGNING_SECRET = "default_signing_secret"
    # API Endpoint
    API_ENDPOINT = "https://api.sageone.com".freeze
    # User Agent
    USER_AGENT = "sageone_sdk Ruby Gem #{SageoneSdk::VERSION}".freeze
    # Media Type
    MEDIA_TYPE = "application/json"

    class << self
      # Options
      def options
        Hash[SageoneSdk::Configurable.keys.map{|key| [key, send(key)]}]
      end

      # Retrieve access token
      def access_token
        ENV["SAGE_ONE_ACCESS_TOKEN"] || ACCESS_TOKEN
      end

      # Retrieve signing secret
      def signing_secret
        ENV["SAGE_ONE_SIGNING_SECRET"] || SIGNING_SECRET
      end

      # Retrieve api endpoint
      def api_endpoint
        ENV["SAGE_ONE_API_ENDPOINT"] || API_ENDPOINT
      end

      # Retrieve media type
      def default_media_type
        ENV["SAGE_ONE_DEFAULT_MEDIA_TYPE"] || MEDIA_TYPE
      end

      # Retrieve user agent
      def user_agent
        ENV["SAGE_ONE_USER_AGENT"] || USER_AGENT
      end

      # Connection Options
      def connection_options
        {
          :headers => {
            :accept => default_media_type,
            :user_agent => user_agent
          }
        }
      end
    end
  end
end
