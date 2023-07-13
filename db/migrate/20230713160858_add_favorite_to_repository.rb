class AddFavoriteToRepository < ActiveRecord::Migration[7.0]
  def change
    add_column :repositories, :favorite, :boolean, default: false
  end
end
