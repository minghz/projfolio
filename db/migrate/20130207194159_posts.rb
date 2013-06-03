class Posts < ActiveRecord::Migration
  
  def change
    add_column :posts, :description, :string
    add_column :posts, :images, :string
  end

end
