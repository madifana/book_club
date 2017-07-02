class AddQuantityToLibraryBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :library_books, :quantity, :integer
  end
end
