class CreateLibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :libraries do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end
  end
end
