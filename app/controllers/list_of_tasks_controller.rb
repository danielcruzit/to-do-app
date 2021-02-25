
class ListOfTasksController < ApplicationController
    
    before_action :set_list_of_tasks , only:[:edit, :update]

    def index
        @lists = ListOfTasks.all
    end

    def new
        @list = ListOfTasks.new
    end

    def create
        @list = ListOfTasks.new(params)
        flash[:success] ="List created whit great success!"
        #redirect_to algo
    end

    def edit
    end

    def update
        if @list.update(params)
            flash[:success] = "List of Tasks modified whit success!"
        else
            flash[:danger] = "Modification got errors!"
        end
    end

    def destroy
        ListOfTasks.find(params[:id]).destroy
        flash[:success] = "List of Tasks deleted"
        #redirect_to algo
    end

    private

    def set_list_of_tasks
        @list = ListOfTasks.find(params[:id])
    end

    def list_of_tasks_params
         params.require(:user).permit(:name, :description)
    end

end
