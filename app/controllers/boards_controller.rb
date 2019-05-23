class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  def index
    #Active Record 
    # @boards = Board.all
    #SQL 
    @boards = Board.all_boards
  end

  def show
  end

  def new
    @board = Board.new 
  end

  def create 
    @board = Board.new(board_params)

    if @board.save 
      redirect_to boards_path 
    else
      render :new 
    end 
  end 

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board)
    else 
      render :edit 
    end 
  end 

  def destroy 
    @board.destroy 
    redirect_to boards_path 
  end 

  private 
  def set_board
    # Active Record 
    # @board = Board.find(params[:id])

    #SQL 
    @board = Board.single_board(params[:id])
  end 

  def board_params
    params.require(:board).permit(:name)
  end 
end
