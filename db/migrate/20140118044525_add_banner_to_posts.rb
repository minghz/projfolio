class AddBannerToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :banner, :string
  end
end
