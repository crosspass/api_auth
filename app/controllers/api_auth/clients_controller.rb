# frozen_string_literal: true

require_dependency "api_auth/application_controller"

module ApiAuth
  class ClientsController < ApplicationController
    before_action :set_client, only: [:show, :edit, :update, :destroy, :apis, :toggle_api]

    # GET /clients
    def index
      @clients = Client.all
    end

    # GET /clients/1
    def show
    end

    # GET /clients/new
    def new
      @client = Client.new
    end

    # GET /clients/1/edit
    def edit
    end

    # GET /clients/1/apis
    def apis
    end

    # PUT /clients/1/toggle_api
    def toggle_api
      api = Api.find(params[:api][:id])
      if api
        @client.toggle_api(api, api_params.require('api'))
      else
        render json: { message: 'api not found!' }, status: 422
      end
    end

    # POST /clients
    def create
      @client = Client.new(client_params)
      if @client.save
        redirect_to @client, notice: 'Client was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /clients/1
    def update
      if @client.update(client_params)
        redirect_to @client, notice: 'Client was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /clients/1
    def destroy
      @client.destroy
      redirect_to clients_url, notice: 'Client was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:name, :email, :desc)
    end

    def api_params
      params.permit(api: %i[id GET PUT DELETE POST])
    end
  end
end
