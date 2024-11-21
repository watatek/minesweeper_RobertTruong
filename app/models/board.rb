class Board < ApplicationRecord
  validates :name, presence: true
  
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  
  validates :width, :height, :mines, presence: true
  validates :width, :height, numericality: { only_integer: true, greater_than: 0 }
  validates :mines, numericality: { only_integer: true, greater_than: 0 }
  validate :mines_within_bounds  

  # Function create Minesweeper board
  def generate_board    
    # create table 2D with all blank
    grid = Array.new(height) { Array.new(width) }

    # Generate random mines 
    mine_positions = []
    while mine_positions.size < mines
      pos = [rand(height), rand(width)]
      mine_positions << pos unless mine_positions.include?(pos)
    end

    # Placed mines onto table
    mine_positions.each do |row, col|
      grid[row][col] = "M"
    end

    self.board_data = grid # Save board into db
  end

  # def generate_board
  #   grid = Array.new(height) { Array.new(width, 0) }
  #   mines_count = 0

  #   while mines_count < mines
  #     row, col = rand(height), rand(width)
  #     next if grid[row][col] == 'M'

  #     grid[row][col] = 'M'
  #     mines_count += 1

  #     # Update adjacent cells
  #     neighbors(row, col).each do |r, c|
  #       grid[r][c] += 1 if grid[r][c].is_a?(Integer)
  #     end
  #   end

  #   self.board_data = grid
  # end

  private

  def mines_within_bounds
    if mines > width * height
      errors.add(:mines, "cannot be greater than the total number of cells")
    end
  end

  def neighbors(row, col)
    [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]].map do |dr, dc|
      [row + dr, col + dc]
    end.select { |r, c| r.between?(0, height - 1) && c.between?(0, width - 1) }
  end
end
