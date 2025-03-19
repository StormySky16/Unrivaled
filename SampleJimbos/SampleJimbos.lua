--- STEAMODDED HEADER
--- MOD_NAME: Again!
--- MOD_ID: Again!
--- MOD_AUTHOR: [StormySky16, BaseFrom: Rare_K]
--- MOD_DESCRIPTION: Winter Joker (Soldier) Retrigger Mod
--- MOD_VERSION: 1.0.0
--- PREFIX: Again!

SMODS.Sound ({
    key = "again", path = "again.ogg"
})

-- you can have shared helper functions
function shakecard(self) --visually shake a card
    G.E_MANAGER:add_event(Event({
        func = function()
            self:juice_up(0.5, 0.5)
            return true
        end
    }))
end

function return_JokerValues() -- not used, just here to demonstrate how you could return values from a joker
    if context.joker_main and context.cardarea == G.jokers then
        return {
            chips = self.ability.extra.chips,       -- these are the 3 possible scoring effects any joker can return.
            mult = self.ability.extra.mult,         -- adds mult (+)
            x_mult = self.ability.extra.x_mult,     -- multiplies existing mult (*)
            card = self,                            -- under which card to show the message
            colour = G.C.CHIPS,                     -- colour of the message, Balatro has some predefined colours, (Balatro/globals.lua)
            message = localize('k_upgrade_ex'),     -- this is the message that will be shown under the card when it triggers.
            extra = { focus = self, message = localize('k_upgrade_ex') }, -- another way to show messages, not sure what's the difference.
        }
    end
end

local msg_dictionary={
    -- do note that when using messages such as: 
    -- message = localize{type='variable',key='a_xmult',vars={current_xmult}},
    -- that the key 'a_xmult' will use provided values from vars={} in that order to replace #1#, #2# etc... in the localization file.

    a_chips="+#1#",
    a_chips_minus="-#1#",
    a_hands="+#1# Hands",
    a_handsize="+#1# Hand Size",
    a_handsize_minus="-#1# Hand Size",
    a_mult="+#1# Mult",
    a_mult_minus="-#1# Mult",
    a_remaining="#1# Remaining",
    a_sold_tally="#1#/#2# Sold",
    a_xmult="X#1# Mult",
    a_xmult_minus="-X#1# Mult",
}    

local mod_name = 'Again!' -- Put your mod name here!

local jokers = {
    sample_obelisk = {
        name = "sample_obelisk",
        text = {
            "This Joker gives {X:mult,C:white} X#1# {} Mult",
            "for each time you've played this {C:attention}hand",
        },
        config = { extra = { x_mult = 0.1 } },
        pos = { x = 0, y = 0 },
        rarity = 3,
        cost = 6,
        blueprint_compat = true,
        eternal_compat = true,
        unlocked = true,
        discovered = true,
        effect = nil,
        atlas = nil,
        soul_pos = nil,

        calculate = function(self, context)
            if self.debuff then return nil end
            if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
                local current_hand_times = (G.GAME.hands[context.scoring_name].played or 0) -- how many times has the player played the current type of hand. (pair, two pair. etc..)
                local current_xmult = 1 + (current_hand_times * self.ability.extra.x_mult)
                
                return {
                    message = localize{type='variable',key='a_xmult',vars={current_xmult}},
                    colour = G.C.RED,
                    x_mult = current_xmult
                }

                -- you could also apply it to the joker, to do it like the sample wee, but then you'd have to reset the card and text every time the previewed hand changes.
            end
        end,

        loc_def = function(self)
            return { self.ability.extra.x_mult }
        end
    },
    sample_hackerman = {
        name = "sample_hackerman",
        text = {
            "Retrigger",
            "each played",
            "{C:attention}6{}, {C:attention}7{}, {C:attention}8{}, or {C:attention}9{}",
        },
        config = { repetitions = 1 },
        pos = { x = 0, y = 0 },
        rarity = 2,
        cost = 4,
        blueprint_compat = true,
        eternal_compat = false,
        unlocked = true,
        discovered = true,
        effect = nil,
        atlas = nil,
        soul_pos = nil,

        calculate = function(self, context)
            if self.debuff then return nil end
            if context.cardarea == G.play and context.repetition and (
                context.other_card:get_id() == 6 or 
                context.other_card:get_id() == 7 or 
                context.other_card:get_id() == 8 or 
                context.other_card:get_id() == 9) then
                return {
                    message = localize('k_again_ex'),
                    repetitions = self.ability.repetitions,
                    card = self
                }
            end
        end,

        loc_def = function(self)
            return { }
        end
    },
    winter_joker = {
        name = "winter_joker",
        text = {
            "This Joker gains {C:attention}1{} retrigger",
            "for all cards played per consecutive hand",
            "that scores at least {C:attention}80%{}",
            "of the required chips.",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Retrigger(s))"
        },
        config = { extra = { repetitions = 0, most_recent_hand = 0 } },
        pos = { x = 0, y = 0 },
        rarity = 3,
        cost = 10,
        blueprint_compat = true,
        eternal_compat = true,
        unlocked = true,
        discovered = true,
        effect = nil,
        atlas = nil,
        soul_pos = nil,

        calculate = function(self, context)
            if self.debuff then return nil end
            local current_reps = self.ability.extra.repetitions
            local current_hand = self.ability.extra.most_recent_hand
            if context.cardarea == G.play and context.repetition and not context.repetition_only then
                --local current_hand = G.GAME.current_round.current_hand.chip_total
                -- G.GAME.chips
                print('in cardarea, most_recent_hand: ' .. current_hand)
                print('retriggering')
                return {
                    play_sound('again'),
                    message = localize{'k_again_ex'},
                    repetitions = self.ability.extra.repetitions,
                    card = self
                }
            end
            if context.final_scoring_step then
                local current_hand = hand_chips * mult
                print('in final scoring')
                print('current_hand: ' .. current_hand)
                print('blind chips: ' .. G.GAME.blind.chips)
                return {
                    most_recent_hand = current_hand,
                    card = self
                }
            end
             
            -- if context.after then print('context.after is true') end
            -- if reset then print('reset is true') end
            -- if not reset then print('reset is false') end
            --if self.ability.extra.repetitions > 0 then print('repetitions:', self.ability.extra.repetitions) end

            -- if context.after and not context.individual then
            --     self.ability.extra.repetitions = 0
            --     if current_hand / G.GAME.blind.chips <= 0.80 then
            --         self.ability.extra.repetitions = 0
            --         return {
            --             card = self,
            --             message = localize('k_reset')
            --         }  
            --     else 
            --         print('again!')
            --         self.ability.extra.repetitions = self.ability.extra.repetitions + 1
            --         return {
            --             card = self,
            --             message = localize{'k_again_ex'},
            --         }  
            --     end
            --     print('in context after, reset true')
                
            -- end
        end,

        loc_def = function(self)
            return { self.ability.extra.repetitions, self.ability.extra.most_recent_hand }
        end
    },
}

function SMODS.INIT.SampleJimbos()
    --localization for the info queue key
    G.localization.descriptions.Other["your_key"] = {
        name = "Example",
        text = {
            "TEXT L1",
            "TEXT L2",
            "TEXT L3"
        }
    }
    init_localization()

    --Create and register jokers
    for k, v in pairs(jokers) do --for every joker in 'jokers'
        local joker = SMODS.Joker:new(v.name, k, v.config, v.pos, { name = v.name, text = v.text }, v.rarity, v.cost,
        v.unlocked, v.discovered, v.blueprint_compat, v.eternal_compat, v.effect, v.atlas, v.soul_pos)
        joker:register()

        if not v.atlas then --if atlas=nil then use single sprites. In this case you have to save your sprite as slug.png (for example j_sample_wee.png)
            SMODS.Sprite:new("j_" .. k, SMODS.findModByID(mod_name).path, "j_" .. k .. ".png", 71, 95, "asset_atli")
                :register()
        end

        SMODS.Jokers[joker.slug].calculate = v.calculate
        SMODS.Jokers[joker.slug].loc_def = v.loc_def

        --if tooltip is present, add jokers tooltip
        if (v.tooltip ~= nil) then
            SMODS.Jokers[joker.slug].tooltip = v.tooltip
        end
    end
    --Create sprite atlas
    SMODS.Sprite:new("youratlasname", SMODS.findModByID(mod_name).path, "example.png", 71, 95, "asset_atli")
        :register()
end