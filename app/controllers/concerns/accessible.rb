module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_resource
  end

  protected

  def check_resource
    if admin_signed_in?
      flash.clear
      redirect_to(admins_root_path) and return
    elsif employee_signed_in?
      flash.clear
      redirect_to(kudos_path) and return
    end
  end
end
