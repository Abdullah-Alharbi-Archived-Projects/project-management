class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :get_user_data
    before_action :find_task, except: [:index, :new, :create]


    def index
    end


    def show
    end

    def new
        @task = @data[1].cards.find(params[:card_id]).tasks.new
    end

    def create
        @data[1].cards.find(params[:card_id]).tasks.create(task_params)

        redirect_to org_project_cards_path(params[:org_id], params[:project_id])
    end

    def edit
    end

    def update
        @task.update(task_params)

        redirect_to org_project_cards_path(params[:org_id], params[:project_id])
    end

    def destroy
        @task.destroy

        redirect_to org_project_cards_path(params[:org_id], params[:project_id])
    end

    private
    def find_task
        @task = @data[1].cards.find(params[:card_id]).tasks.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name)
    end
end
