class FixColumnName < ActiveRecord::Migration
    def change
        remove_column :posts, :description
        rename_column :posts, :content, :description
    end

end
