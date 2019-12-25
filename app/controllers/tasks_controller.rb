class TasksController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token
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
        @task = @data[1].cards.find(params[:card_id]).tasks.create(task_params)

        respond_to do |format|
          format.html
          format.json  { render :json => @task } # don't do msg.to_json
        end
    end

    def edit
    end

    def update
        @task.update(task_params)

        respond_to do |format|
            format.html
            format.json  { render :json => @task } # don't do msg.to_json
          end
    end

    def destroy
        @task.destroy

        respond_to do |format|
            format.html
            format.json  { render :json => @task, status => :okay } # don't do msg.to_json
          end
    end

    private
    def find_task
        @task = @data[1].cards.find(params[:card_id]).tasks.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :position)
    end
end
