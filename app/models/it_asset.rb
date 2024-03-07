class ItAsset < ApplicationRecord
    def scanned_at
        scan = Scan.where(barcode: self.barcode).last
        scan.scanned_at if scan.present?
    end
end
