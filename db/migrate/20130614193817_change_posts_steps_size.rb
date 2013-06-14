class ChangePostsStepsSize < ActiveRecord::Migration
  def up
      change_column :posts, :steps, :text
  end

  def down
      #strings longer than 255 characters not allowed
      change_column :posts, :steps, :string
  end
end
