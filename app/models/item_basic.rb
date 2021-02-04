class ItemBasic < ApplicationRecord
    self.primary_key = "itemid"
    self.table_name = "item_basic"
    self.per_page = 50
    has_one :item_equipment, :foreign_key => 'itemId'
    has_one :item_usable, :foreign_key => 'itemid'
    has_many :item_mod, :foreign_key => 'itemId'
end
