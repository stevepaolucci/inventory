class AddDamagedToItAsset < ActiveRecord::Migration[7.1]
  def change
    add_column :it_assets, :damaged, :boolean, default:false
  end
end
