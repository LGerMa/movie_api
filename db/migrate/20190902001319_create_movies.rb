class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies, id: :uuid do |t|
      t.string :title, default: ''
      t.text :description, default: ''
      t.string :images, array: true, default: []
      t.integer :stock, default: 0
      t.integer :rental_price, default: 0
      t.integer :sale_price, default: 0
      t.boolean :availability, default: false
      t.integer :status, default: 1

      t.timestamps
    end
  end

  def down
    drop_table :movies
  end
end
