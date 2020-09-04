class ServicesController < ApplicationController
  before_action :set_service, only: %I[show update destroy]

  def index
    @services = Service.all
    json_response(@services)
  end

  def create
    return unless @current_user.admin

    @service = Service.create!(service_params)
    json_response(@service, :created)
  end

  def show
    set_service
    json_response(@service)
  end

  def update
    return unless @current_user.admin

    @service.update(service_params)
    head :no_content
  end

  def destroy
    return unless @current_user.admin

    @service.destroy
    head :no_content
  end

  private

  def service_params
    params.permit(:title, :description, :price, :image_url)
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
