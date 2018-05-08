class Admin::AdminController < ApplicationController
  layout "admin/layouts/application"
  before_action :logged_in_user, :verify_admin!

  private

  def verify_admin!
    return if current_user.admin?
    flash[:error] = t "controller.admin.base.error"
    redirect_to root_path
  end
end
