class MobDroplist < ApplicationRecord
    self.primary_key = 'dropId'
    self.table_name = 'mob_droplist'
    has_many :mob_group, :foreign_key => 'dropid'
end
