# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update]

  def index; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'Task added !'
      redirect_to lists_url
    else
      flash[:danger] = 'Task got errors!'
      render 'new'
    end
  end

  def edit; end

  def update; end

  def destroy
    List.find(params[:id]).destroy
    flash[:success] = 'List of Tasks deleted'
    redirect_to lists_url
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
