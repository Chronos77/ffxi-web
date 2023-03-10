class CharInventory < ApplicationRecord
    self.primary_key = "charid"
    self.table_name = "char_inventory"
end
