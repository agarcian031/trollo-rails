class Board < ApplicationRecord
  has_many :lists, dependent: :destroy 

  # #Class method for all_boards 
  # def self.all_boards
  #    Board.find_by_sql("
  #     SELECT * 
  #     FROM boards 
  #    ")
  # end 

  # #Class method for single_board 
  # def self.single_board(id)
  #   Board.find_by_sql("
  #     SELECT * 
  #     FROM boards
  #     WHERE id = #{id}
  #   ").first 
    
  # end 
end
