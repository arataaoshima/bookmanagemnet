class AddAvatarToBooks < ActiveRecord::Migration
  def change
    add_column :books, :avator, :binary
    add_column :books, :avator_content_type, :string
  end
end
