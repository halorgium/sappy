module Sappy
  module Responses
    class Auth < Response
      class LoginFailed < Error; end

      attr_reader :key
      def success(hash)
        @key = hash["session"].first["key"]
      end

      def failure(code, message)
        case code
        when "WRONG_DATA"
          raise LoginFailed, message
        end
      end
    end
  end
end
