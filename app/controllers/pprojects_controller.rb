class PprojectsController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token
    before_action :get_user_projects
    before_action :find_project, except: [:index, :new, :create]

    def index
    end

    def show
        redirect_to org_project_cards_path(params[:org_id], @project)
    end

    def new
        @project = Pproject.new
    end

    def create
        @project = @org.pprojects.create(project_params)

        redirect_to org_project_path(params[:org_id], @project)
    end

    def edit
    end

    def update
        @project.update(project_params)

        redirect_to org_project_path(params[:org_id], @project)
    end

    def destroy
        @project.destroy
        # redirect_to org_path(params[:org_id])
        respond_to do |format|
            format.html
            format.json  { render :json => @task, status => :okay } # don't do msg.to_json
          end
    end

    private
    def find_project
        @project = @org.pprojects.find(params[:id])
    end

    def get_user_projects
        @org = current_user.orgs.find(params[:org_id])
    end

    def project_params
        params.require(:project).permit(:name, :wallpaper)
    end


end
