class SupportRequestsController < ApplicationController
  before_action :find_support_request, only: [:edit, :update]

  def index
    @support_requests = SupportRequest.search(params[:search])
                .paginate(page: params[:page], per_page: 10)
  end

  def new
    @support_request = SupportRequest.new
  end

  def create
    @support_request = SupportRequest.new(support_request_params)
    if @support_request.save
      redirect_to support_requests_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @support_request.update_attributes(support_request_params)
      redirect_to support_requests_path
    else
      render :edit
    end
  end

  private

  def support_request_params
    params.require(:support_request).permit(:title, :description, 
                              :department, :email, :done)

  end

  def find_support_request
    @support_request = SupportRequest.find(params[:id])
  end

end
