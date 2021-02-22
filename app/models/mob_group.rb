class MobGroup < ApplicationRecord
    self.primary_key = 'dropid'
    self.table_name = 'mob_groups'
    has_many :mob_droplist, :foreign_key => 'dropId'
end
