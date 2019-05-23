class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    #Action Record
    # @lists = @board.lists
    #SQL 
    # @lists = List.all_lists(@board.id)
    @lists = @board.lists.all_lists
  end

  def show
  end

  def new
  end

  def edit
  end

  private 
  def set_board
    #Active Record 
    # @board = Board.find(params[:board_it])
    #SQL 
    @board = Board.single_board(params[:board_id])
  end 

  def set_list 
    # Active Record 
    # @list = List.find(params[:id])

    #SQL 
    @list = List.single_list(@board.id, params[:id])
  end 

  def list_params 
    params.require(:list).permit(:name)
  end 
end
