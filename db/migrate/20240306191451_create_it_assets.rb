class CreateItAssets < ActiveRecord::Migration[7.1]
  def change
    create_table :it_assets do |t|
      t.string :username
      t.integer :barcode
      t.string :asset_name
      t.text :notes
      t.string :password
      t.date :distributed_at
      t.date :returned_at
      t.string :asset_type
      t.string :asset_subtype
      t.string :location

      t.timestamps
    end
  end
end
