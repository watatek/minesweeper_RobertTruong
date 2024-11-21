require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new board and redirects to the show page" do
        valid_attributes = attributes_for(:board)

        expect {
          post :create, params: { board: valid_attributes }
        }.to change(Board, :count).by(1)

        expect(response).to redirect_to(board_path(Board.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a board and re-renders the new template" do
        invalid_attributes = attributes_for(:board, email: nil)

        expect {
          post :create, params: { board: invalid_attributes }
        }.not_to change(Board, :count)

        expect(response).to render_template(:new)
      end
    end
  end
end
