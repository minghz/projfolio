class AddPostIdToPages < ActiveRecord::Migration
  def change
    change_table :pages do |t|
      t.references :post
    end
    add_index :pages, :post_id
  end
end
