# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :set_list, only: %i[edit update]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = 'List created whit great success!'
      redirect_to lists_url
    else
      flash[:danger] = 'List got errors!'
      render 'new'
    end
  end

  def edit; end

  def update
    if @list.update(list_params)
      flash[:success] = 'List of Tasks modified whit success!'
      redirect_to lists_url
    else
      flash[:danger] = 'Modification got errors!'
      render 'edit'
    end
  end

  def destroy
    List.find(params[:id]).destroy
    flash[:success] = 'List of Tasks deleted'
    redirect_to 'index'
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :description)
  end
end
