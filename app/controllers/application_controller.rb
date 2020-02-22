class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    flash[:alert] = 'Record not found'
    redirect_to root_path
  end
end
