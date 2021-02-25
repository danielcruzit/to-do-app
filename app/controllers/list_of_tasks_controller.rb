# frozen_string_literal: true

class ListOfTasksController < ApplicationController
  before_action :set_list_of_tasks, only: %i[edit update]

  def index
    @lists = ListOfTasks.all
  end

  def new
    @list = ListOfTasks.new
  end

  def create
    @list = ListOfTasks.new(list_of_tasks_params)
    if @list.save
      flash[:success] = 'List created whit great success!'
      redirect_to @list
    else
      flash[:danger] = 'List got errors!'
      render 'new'
    end
  end

  def edit; end

  def update
    if @list.update(list_of_tasks_params)
      flash[:success] = 'List of Tasks modified whit success!'
      redirect_to @list
    else
      flash[:danger] = 'Modification got errors!'
      render 'edit'
    end
  end

  def destroy
    ListOfTasks.find(params[:id]).destroy
    flash[:success] = 'List of Tasks deleted'
    redirect_to 'index'
  end

  private

  def set_list_of_tasks
    @list = ListOfTasks.find(params[:id])
  end

  def list_of_tasks_params
    params.require(:user).permit(:name, :description)
  end
end
