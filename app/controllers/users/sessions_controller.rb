# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    layout 'application_without_nav'

    def respond_to_on_destroy
      respond_to do |format|
        format.all { head :no_content }
        format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name), status: :see_other }
      end
    end
  end
end
