# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

100.times do
  board = Board.create(
    name: "Board #{Faker::Lorem.word}",
    email: Faker::Internet.email,
    width: rand(5..10),  # Kích thước chiều rộng từ 5 đến 10
    height: rand(5..10), # Kích thước chiều cao từ 5 đến 10
    mines: rand(5..15)   # Số lượng mìn ngẫu nhiên từ 5 đến 15
  )
  board.generate_board
  board.save!
end