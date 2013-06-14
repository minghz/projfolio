class AddStepsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :steps, :string
  end
end
