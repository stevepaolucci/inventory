class CreateScans < ActiveRecord::Migration[7.1]
  def change
    create_table :scans do |t|
      t.datetime :scanned_at
      # t.belongs_to :it_asset, null: false, foreign_key: true
      t.string :barcode
      t.timestamps
    end
  end
end
