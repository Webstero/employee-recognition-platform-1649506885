# frozen_string_literal: true

module Admins
  class SessionsController < Devise::SessionsController
    include Accessible
    # rubocop:disable LexicallyScopedActionFilter
    skip_before_action :check_resource, only: :destroy
    # rubocop:enable LexicallyScopedActionFilter
  end
end
