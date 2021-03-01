# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update change_completed]

  def index; end

  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.build
  end

  def create
    @list = List.find(params[:task][:list_id])
    @task = @list.tasks.build(task_params)
    if @task.save
      flash[:success] = 'Task added !'
      redirect_to list_url(@list.id)
    else
      flash[:danger] = 'Task got errors!'
      render 'new'
    end
  end

  def edit; end

  def change_completed
    @list = @task.list
    if @task.update(completed: !@task.completed)
      respond_to do |format|
        format.html { redirect_to @list }
        format.js
      end
    else
      flash[:danger] = 'Task update on complete went wrong!'
      render @list
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = 'Task updated !'
      redirect_to list_url(@task.list_id)
    else
      flash[:danger] = 'Task got errors!'
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @list = @task.list
    @task.destroy
    flash[:success] = 'List of Tasks deleted'
    respond_to do |format|
      format.html { redirect_to @list }
      format.js
    end
    # redirect_to list_url(@list.id)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :completed, :list_id)
  end
end
