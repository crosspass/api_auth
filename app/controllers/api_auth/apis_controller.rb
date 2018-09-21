require_dependency "api_auth/application_controller"

module ApiAuth
  class ApisController < ApplicationController
    before_action :set_api, only: [:show, :edit, :update, :destroy]

    # GET /apis
    def index
      @apis = Api.all
    end

    # GET /apis/1
    def show
    end

    # GET /apis/new
    def new
      @api = Api.new
    end

    # GET /apis/1/edit
    def edit
    end

    # POST /apis
    def create
      @api = Api.new(api_params)

      if @api.save
        redirect_to @api, notice: 'Api was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /apis/1
    def update
      if @api.update(api_params)
        redirect_to apis_url, notice: 'Api was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /apis/1
    def destroy
      @api.destroy
      redirect_to apis_url, notice: 'Api was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_api
        @api = Api.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def api_params
        params.require(:api).permit(:path, :GET, :POST, :PUT, :DELETE)
      end
  end
end
