require 'rails_helper'

RSpec.describe Board, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      board = build(:board)
      expect(board).to be_valid
    end

    it "is invalid without an email" do
      board = build(:board, email: nil)
      expect(board).not_to be_valid
      expect(board.errors[:email]).to include("can't be blank")
    end

    it "is invalid with an incorrect email format" do
      board = build(:board, email: "invalid_email")
      expect(board).not_to be_valid
      expect(board.errors[:email]).to include("is invalid")
    end
  end
end
