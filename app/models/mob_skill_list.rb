class MobSkillList < ApplicationRecord
  belongs_to  :mob_skill, :foreign_key => "mob_skill_id"
end
