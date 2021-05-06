# frozen_string_literal: true

# This inherits from SecuredController, so all requests must include an access token
class ChirpsController < SecuredController
  def index
    chirps = Chirp.all
    render json: chirps
  end

  def show
    chirp = Chirp.find(params[:id])
    render json: chirp
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def create
    chirp = Chirp.create!(chirp_params)
    render json: chirp, status: :created
  end

  def destroy
    chirp = Chrip.find(params[:id])
    chirp.delete
    head :not_content
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  private

  def chirp_params
    params.permit(:body, :published)
  end
end
