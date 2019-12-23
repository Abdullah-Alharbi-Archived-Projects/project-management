class OrgsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_org, except: [:index, :new, :create]

    def index
        @orgs = current_user.orgs
    end

    def show
        @projects = @org.pprojects
    end

    def new
        @org = current_user.orgs.new
    end

    def create
        @org = current_user.orgs.create(org_params)
        redirect_to @org
    end

    def edit
    end

    def update
        @org.update(org_params)
        redirect_to @org
    end

    def destroy
        @org.destroy

        redirect_to orgs_path
    end

    private
    def find_org
        @org = current_user.orgs.find(params[:id])
    end

    def org_params
        params.require(:org).permit(:name, :icon)
    end
end
