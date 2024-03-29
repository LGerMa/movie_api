class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
