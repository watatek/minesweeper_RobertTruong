require 'rails_helper'

RSpec.describe "Boards", type: :request do
  describe "GET /new" do
    it "renders the new form" do
      get new_board_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Generate Board")
    end
  end

  describe "POST /boards" do
    context "with valid parameters" do
      it "creates a board and redirects to show" do
        valid_attributes = attributes_for(:board)

        post boards_path, params: { board: valid_attributes }
        expect(response).to redirect_to(board_path(Board.last))
        follow_redirect!

        expect(response.body).to include(Board.last.board_name)
      end
    end

    context "with invalid parameters" do
      it "renders the new form with errors" do
        invalid_attributes = attributes_for(:board, email: nil)

        post boards_path, params: { board: invalid_attributes }
        expect(response.body).to include("Email can't be blank")
      end
    end
  end
end
