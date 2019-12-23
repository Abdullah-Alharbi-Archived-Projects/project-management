class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?, only: [:create]
    before_action :configure_permitted_update_parameters, if: :devise_controller?
    before_action :save_back, except: [:create, :new]


    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
    end

    def configure_permitted_update_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
    end


    def save_back
        session[:return_to] = request.referer
    end

    def back
        redirect_to session.delete(:return_to)
    end

    def get_user_data
        org = current_user.orgs.find(params[:org_id])
        project = org.pprojects.find(params[:project_id])
        @data = [org, project]
    end
end
