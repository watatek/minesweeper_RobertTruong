class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :email
      t.integer :width
      t.integer :height
      t.integer :mines
      t.jsonb :board_data

      t.timestamps
    end
  end
end
