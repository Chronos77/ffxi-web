class MobSpawnPoint < ApplicationRecord
    self.table_name = "mob_spawn_points"
    self.primary_key = "mobid"
    self.per_page = 20
    has_many :nm_spawn_point, :foreign_key => 'mobid'

    def self.ransackable_attributes(auth_object = nil)
        ["groupid", "mobid", "mobname", "polutils_name", "pos_rot", "pos_x", "pos_y", "pos_z"]
    end
end
