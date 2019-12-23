class PprojectsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_user_projects
    before_action :find_project, except: [:index, :new, :create]


    def index
    end

    def show
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

        redirect_to org_project_path(@project)
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
