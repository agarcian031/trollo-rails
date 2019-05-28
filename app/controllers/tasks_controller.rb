class TasksController < ApplicationController
  before_action :set_board
  before_action :set_list_task
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    #Action Record
    # @tasks = @list.tasks
    @tasks = @list.tasks.all
    #SQL 
    # @tasks = Task.all_tasks(@list.id)
  end

  def show
  end

  def new
    @task = @list.tasks.new 
  end

  def create 
    @task = @list.tasks.new(task_params)
    @task.list
    if @task.save
      redirect_to @board
    else 
      # render :new 
      redirect_to @board
    end 
  end 

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to list_task_path(@list, @task)
    else
      render :edit
    end 
  end 

  def destroy
    @task.destroy
    redirect_to @board

  end 

  private 
  def set_list_task
    #Active Record 
    @list = List.find(params[:list_id])
    #SQL 
    # @list = List.single_list_task(params[:list_id])
  end 

  def set_task 
    # Active Record 
    @task = Task.find(params[:id])

    #SQL 
    # @task = Task.single_task(@list.id, params[:id])
  end 

  def set_board
    @board = Board.find(params[:board_id])
  end 

  def task_params 
    params.require(:task).permit(:description)
  end 
end
