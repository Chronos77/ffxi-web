class ItemBasic < ApplicationRecord
    self.primary_key = "itemid"
    self.table_name = "item_basic"
    self.per_page = 20
    has_one :item_equipment, :foreign_key => 'itemId'
    has_one :item_usable, :foreign_key => 'itemid'
    has_one :item_weapon, :foreign_key => 'itemId'
    has_many :mob_droplist, :foreign_key => 'itemId'
    has_many :item_mod, :foreign_key => 'itemId'

    def self.ransackable_attributes(auth_object = nil)
        ["BaseSell", "NoSale", "aH", "flags", "itemid", "name", "sortname", "stackSize", "subid"]
    end
end
