class ListsController < ApplicationController
  before_action :set_board, except: [:update, :destroy]
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    #Action Record
    @lists = @board.lists.all 

    #SQL 
    # @lists = List.all_lists(@board.id)
  end

  def show
    @task = @lists.tasks
  end

  def new
    @list = @board.lists.new 
  end

  def create 
    @list = @board.lists.new(list_params)
    @list.board
    if @list.save
      redirect_to board_path(@board)
    else 
      # render :new 
      redirect_to @board
    end 
  end 

  def edit
  end

  def update
    if @list.update(name: list_params[:name])
      redirect_to @list.board
    else
      render :edit
    end 
  end 

  def destroy
    @list.board 
    @list.destroy
    redirect_to @list.board

  end 

  private 
  def set_board
    #Active Record 
    @board = Board.find(params[:board_id])
    #SQL 
    # @board = Board.single_board(params[:board_id])
  end 

  def set_list 
    # Active Record 
    @list = List.find(params[:id])

    #SQL 
    # @list = List.single_list(@board.id, params[:id])
  end 

  def list_params 
    params.require(:list).permit(:name)
  end 
end
