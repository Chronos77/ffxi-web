class MobDroplist < ApplicationRecord
    self.primary_key = 'dropId'
    self.table_name = 'mob_droplist'
    has_many :mob_group, :foreign_key => 'dropid'
    
    def get_item_name
        ItemBasic.find(self.itemId).name
    end
end
