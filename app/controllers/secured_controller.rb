# frozen_string_literal: true

# The SecuredController inherits from ApplicationController and adds a before_action call, ensuring that every request
# will pass through the AuthorizationService before running any additional handlers.
# SecuredController also handles returning a 401 Unauthorized response if the request doesn't pass.
class SecuredController < ApplicationController
  before_action :authorize_request

  private

  def authorize_request
    AuthorizationService.new(request.headers).authenticate_request!
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end
end
