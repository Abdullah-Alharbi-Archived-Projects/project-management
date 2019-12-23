class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?, only: [:create]
    before_action :configure_permitted_update_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
    end

    def configure_permitted_update_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
    end
end
