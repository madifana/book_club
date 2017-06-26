class AddQuantityToRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :recipe_ingredients, :quantity, :integer
  end
end
