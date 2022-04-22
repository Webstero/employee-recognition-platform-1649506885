# frozen_string_literal: true

module Admins
  class SessionsController < Devise::SessionsController
    include Accessible
    # rubocop:disable LexicallyScopedActionFilter
    skip_before_action :check_resource, only: :destroy
    # rubocop:enable LexicallyScopedActionFilter

    # def after_sign_in_path_for(resource)
    #   admins_root_path
    # end

    # # GET /resource/sign_in
    # def new
    #   super
    # end

    # # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end
