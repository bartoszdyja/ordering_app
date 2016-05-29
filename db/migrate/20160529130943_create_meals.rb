class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.decimal :price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
