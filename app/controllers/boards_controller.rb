class BoardsController < ApplicationController
  before_action :get_ten_boards, only: [:create, :new]

  def new
    @board = Board.new    
  end

  def create
    @board = Board.new(board_params)
    @board.generate_board
    if @board.save
      flash[:notice] = "Board successfully created!"
      redirect_to @board
    else
      flash[:alert] = "There was an error creating the board."      
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def index   
    
    # Tìm kiếm theo tên
    if params[:name].present?
      @boards = Board.where("name LIKE ?", "%#{params[:name]}%")
    else
      @boards = Board.all
    end

    # Phân trang
    @boards = @boards.page(params[:page]).per(10)
  end

  private

  def board_params
    params.require(:board).permit(:name, :email, :width, :height, :mines)
  end

  def get_ten_boards
    @boards = Board.order(created_at: :desc).limit(10)
  end
end
