class MobSpellList < ApplicationRecord
  belongs_to  :spell_list, :foreign_key => "spell_id"
end
