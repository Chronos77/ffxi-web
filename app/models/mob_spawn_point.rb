class MobSpawnPoint < ApplicationRecord
    self.table_name = "mob_spawn_points"
    self.primary_key = "mobid"
    self.per_page = 20
    has_many :nm_spawn_point, :foreign_key => 'mobid'
end
