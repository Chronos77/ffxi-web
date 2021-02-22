
module ApplicationHelper


    def get_dmg_type(dmgTypeId)
        @dmgTypes = {
            0 => 'NONE',
            1 => 'PIERCING',
            2 => 'SLASHING',
            3 => 'IMPACT',
            4 => 'HTH',
            5 => 'ELEMENTAL',
            6 => 'FIRE',
            7 => 'ICE',
            8 => 'WIND',
            9 => 'EARTH',
            10 => 'LIGHTNING',
            11 => 'WATER',
            12 => 'LIGHT',
            13 => 'DARK'
        }
        @dmgTypes[dmgTypeId]
    end

    def get_valid_targets(targetId)
        @validTargets = {
            1 => 'TARGET_SELF',
            2 => 'TARGET_PLAYER_PARTY',
            4 => 'TARGET_ENEMY',
            8 => 'TARGET_PLAYER_ALLIANCE',
            16 => 'TARGET_PLAYER',
            32 => 'TARGET_PLAYER_DEAD',
            64 => 'TARGET_NPC',
            128 => 'TARGET_PLAYER_PARTY_PIANISSIMO',
            256 => 'TARGET_PET'
        }
        @validTargets[targetId]
    end

    def get_skill(skillId)
        @skills = JSON.parse(REDIS_CLIENT.get('SKILL'))
        @skills[skillId.to_s]
    end

    def get_mod(modId)
        @mods = JSON.parse(REDIS_CLIENT.get('MOD'))
        @mods[modId.to_s]
    end

    def get_zone(zoneId)
        @zones = JSON.parse(REDIS_CLIENT.get('ZONE'))
        @zones[zoneId.to_s]
    end
end
