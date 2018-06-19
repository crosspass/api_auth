class Api::ClientsController < Api::ApplicationController
  def index
    @clients = ApiAuth::Client.all
    render json: @clients
  end
end
