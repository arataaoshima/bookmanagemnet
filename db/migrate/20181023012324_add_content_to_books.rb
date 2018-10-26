class AddContentToBooks < ActiveRecord::Migration
  def change
    add_column :books, :content, :text
    add_column :books, :book_image, :string
  end
end
