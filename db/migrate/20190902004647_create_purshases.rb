class CreatePurshases < ActiveRecord::Migration[5.2]
  def change
    create_table :purshases do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.integer :qty, default: 0
      t.integer :movie_price, default: 0
      t.integer :subtotal, default: 0
      t.integer :total, default: 0

      t.timestamps
    end
  end

  def down
    drop_table :purshases
  end
end
