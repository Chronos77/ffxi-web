class StatusEffect < ApplicationRecord
  belongs_to :negative
  belongs_to :block
  belongs_to :remove
end
