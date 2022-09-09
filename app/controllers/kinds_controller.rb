
class KindsController < ApplicationController

  TOKEN = "s1e2c3r4e5t"
  include ActionController::HttpAuthentication::Token::ControllerMethods

  #basic
  # include ActionController::HttpAuthentication::Basic::ControllerMethods
  # http_basic_authenticate_with name: "thyago", password: "secret"

  #digest
  # include ActionController::HttpAuthentication::Digest::ControllerMethods
  # USERS = { "thyago" => Digest::MD5.hexdigest(["thyago","Application","secret"].join(":"))}
  before_action :authenticate
  before_action :set_kind, only: %i[ show update destroy ]

  # GET /kinds
  def index
    @kinds = Kind.all

    render json: @kinds
  end

  # GET /kinds/1
  def show
    render json: @kind
  end

  # POST /kinds
  def create
    @kind = Kind.new(kind_params)

    if @kind.save
      render json: @kind, status: :created, location: @kind
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kinds/1
  def update
    if @kind.update(kind_params)
      render json: @kind
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kinds/1
  def destroy
    @kind.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kind
      if params[:contact_id]
        @kind = Contact.find(params[:contact_id]).kind_id
        return @kind
      end 

      @kind = Kind.find(params[:id])
    end

    # def authenticate
    #   authenticate_or_request_with_http_digest("Application") do |username|
    #     USERS[username]
    #   end
    # end

    def authenticate
      authenticate_or_request_with_http_token do |token, option|
        ActiveSupport::SecurityUtils.secure_compare(
          ::Digest::SHA256.hexdigest(token),
          ::Digest::SHA256.hexdigest(TOKEN)
        )
      end
    end

    # Only allow a list of trusted parameters through.
    def kind_params
      params.require(:kind).permit(:description)
    end 
end
