class AddPageImageToBooks < ActiveRecord::Migration
  def change
    add_column :books, :page_image, :binary
    add_column :books, :page_image_type, :string
  end
end
