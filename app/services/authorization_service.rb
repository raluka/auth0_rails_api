# frozen_string_literal: true

# The AuthorizationService grabs the access token in the Authorization HTTP Header
# and passes it to the JsonWebToken for verification
class AuthorizationService
  attr_reader :headers

  def initialize(headers = {})
    @headers = headers
  end

  def authenticate_request!
    verify_token
  end

  private

  def http_token
    headers['Authorization'].split(' ').last if headers['Authorization'].present?
  end

  def verify_token
    JsonWebToken.verify(http_token)
  end
end
