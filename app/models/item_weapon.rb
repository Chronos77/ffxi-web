class ItemWeapon < ApplicationRecord
    self.primary_key = "itemId"
    self.table_name = "item_weapon"
    attribute :hit, ActiveRecord::Type::Integer.new

    def nbHit
        return self.hit
    end
end
