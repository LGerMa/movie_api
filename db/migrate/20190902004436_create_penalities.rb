class CreatePenalities < ActiveRecord::Migration[5.2]
  def change
    create_table :penalities do |t|
      t.references :rental, foreign_key: true
      t.integer :price_per_day, default: 0
      t.integer :extra_day, default: 0

      t.timestamps
    end
  end

  def down
    drop_table :penalities
  end
end
