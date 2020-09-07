class ServicesController < ApplicationController
  before_action :set_service, only: %I[show update destroy]
  before_action :check_admin, only: %i[create update destroy]

  def index
    @services = Service.all
    json_response(@services)
  end

  def create
    @service = Service.create!(service_params)
    json_response(@service, :created)
  end

  def show
    set_service
    json_response(@service)
  end

  def update
    @service.update(service_params)
    head :no_content
  end

  def destroy
    @service.destroy
    head :no_content
  end

  private

  def check_admin
    raise(ExceptionHandler::AuthenticationError, Message.notallowed) unless current_user.admin
  end

  def service_params
    params.permit(:title, :description, :price, :image_url)
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
