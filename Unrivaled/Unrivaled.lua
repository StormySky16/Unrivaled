--- STEAMODDED HEADER
--- MOD_NAME: Unrivaled
--- MOD_ID: Unrivaled
--- MOD_AUTHOR: [StormySky16]
--- MOD_DESCRIPTION: Marvel Rivals Jokers Mod
--- MOD_VERSION: 0.2.0
--- PREFIX: Unrivaled

--Creates an atlas for cards to use
SMODS.Atlas {
	-- Key for code to find it with
	key = "Unrivaled",
	-- The name of the file, for the code to pull the atlas from
	path = "Unrivaled.png",
	-- Width of each sprite in 1x size
	px = 71,
	-- Height of each sprite in 1x size
	py = 95
}
SMODS.Rarity {
    key = 'heroic',
    loc_txt = { name = 'Heroic' },
    badge_colour = HEX('f4d12b'),
    
    default_weight = 0.15,
    
    pools = {
        ["Joker"] = true
    },
    
    get_weight = function(self, weight, object_type)
        return 0.15
    end
}

SMODS.ObjectTypes["Joker"].rarities[1].weight = 0.60
SMODS.ObjectTypes["Joker"].rarities[2].weight = 0.20
SMODS.ObjectTypes["Joker"].rarities[3].weight = 0.05

SMODS.Sound ({
    key = "again", path = "again.ogg"
})  
SMODS.Sound ({
    key = "outofenergy", path = "outofenergy.ogg",
})
SMODS.Sound ({
    key = "armedanddangerous", path = "armedanddangerous.ogg"
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

-- SMODS.Joker {
-- 	-- How the code refers to the joker.
-- 	key = 'joker2',
-- 	-- loc_text is the actual name and description that show in-game for the card.
-- 	loc_txt = {
-- 		name = 'Joker 2',
-- 		text = {
-- 			--[[
-- 			The #1# is a variable that's stored in config, and is put into loc_vars.
-- 			The {C:} is a color modifier, and uses the color "mult" for the "+#1# " part, and then the empty {} is to reset all formatting, so that Mult remains uncolored.
-- 				There's {X:}, which sets the background, usually used for XMult.
-- 				There's {s:}, which is scale, and multiplies the text size by the value, like 0.8
-- 				There's one more, {V:1}, but is more advanced, and is used in Castle and Ancient Jokers. It allows for a variable to dynamically change the color. You can find an example in the Castle joker if needed.
-- 				Multiple variables can be used in one space, as long as you separate them with a comma. {C:attention, X:chips, s:1.3} would be the yellow attention color, with a blue chips-colored background,, and 1.3 times the scale of other text.
-- 				You can find the vanilla joker descriptions and names as well as several other things in the localization files.
-- 				]]
-- 			"{C:mult}+#1# {} Mult"
-- 		}
-- 	},
-- 	--[[
-- 		Config sets all the variables for your card, you want to put all numbers here.
-- 		This is really useful for scaling numbers, but should be done with static numbers -
-- 		If you want to change the static value, you'd only change this number, instead
-- 		of going through all your code to change each instance individually.
-- 		]]
-- 	config = { extra = { mult = 4 } },
-- 	-- loc_vars gives your loc_text variables to work with, in the format of #n#, n being the variable in order.
-- 	-- #1# is the first variable in vars, #2# the second, #3# the third, and so on.
-- 	-- It's also where you'd add to the info_queue, which is where things like the negative tooltip are.
-- 	loc_vars = function(self, info_queue, card)
-- 		return { vars = { card.ability.extra.mult } }
-- 	end,
-- 	-- Sets rarity. 1 common, 2 uncommon, 3 rare, 4 legendary.
-- 	rarity = 1,
-- 	-- Which atlas key to pull from.
-- 	--atlas = 'ModdedVanilla',
-- 	-- This card's position on the atlas, starting at {x=0,y=0} for the very top left.
-- 	pos = { x = 0, y = 0 },
-- 	-- Cost of card in shop.
-- 	cost = 2,
-- 	-- The functioning part of the joker, looks at context to decide what step of scoring the game is on, and then gives a 'return' value if something activates.
-- 	calculate = function(self, card, context)
-- 		-- Tests if context.joker_main == true.
-- 		-- joker_main is a SMODS specific thing, and is where the effects of jokers that just give +stuff in the joker area area triggered, like Joker giving +Mult, Cavendish giving XMult, and Bull giving +Chips.
-- 		if context.joker_main then
-- 			-- Tells the joker what to do. In this case, it pulls the value of mult from the config, and tells the joker to use that variable as the "mult_mod".
-- 			return {
-- 				mult_mod = card.ability.extra.mult,
-- 				-- This is a localize function. Localize looks through the localization files, and translates it. It ensures your mod is able to be translated. I've left it out in most cases for clarity reasons, but this one is required, because it has a variable.
-- 				-- This specifically looks in the localization table for the 'variable' category, specifically under 'v_dictionary' in 'localization/en-us.lua', and searches that table for 'a_mult', which is short for add mult.
-- 				-- In the localization file, a_mult = "+#1#". Like with loc_vars, the vars in this message variable replace the #1#.
-- 				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
-- 				-- Without this, the mult will stil be added, but it'll just show as a blank red square that doesn't have any text.
-- 			}
-- 		end
-- 	end
-- }

-- SMODS.Joker {
-- 	key = 'runner2',
-- 	loc_txt = {
-- 		name = 'Runner 2',
-- 		text = {
-- 			"Gains {C:chips}+#2#{} Chips",
-- 			"if played hand",
-- 			"contains a {C:attention}Straight{}",
-- 			"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
-- 		}
-- 	},
-- 	config = { extra = { chips = 0, chip_gain = 15 } },
-- 	rarity = 1,
-- 	--atlas = 'ModdedVanilla',
-- 	pos = { x = 1, y = 0 },
-- 	cost = 5,
-- 	loc_vars = function(self, info_queue, card)
-- 		return { vars = { card.ability.extra.chips, card.ability.extra.chip_gain } }
-- 	end,
-- 	calculate = function(self, card, context)
-- 		if context.joker_main then
-- 			return {
-- 				chip_mod = card.ability.extra.chips,
-- 				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
-- 			}
-- 		end

-- 		-- context.before checks if context.before == true, and context.before is true when it's before the current hand is scored.
-- 		-- (context.poker_hands['Straight']) checks if the current hand is a 'Straight'.
-- 		-- The 'next()' part makes sure it goes over every option in the table, which the table is context.poker_hands.
-- 		-- context.poker_hands contains every valid hand type in a played hand.
-- 		-- not context.blueprint ensures that Blueprint or Brainstorm don't copy this upgrading part of the joker, but that it'll still copy the added chips.
-- 		if context.before and next(context.poker_hands['Straight']) and not context.blueprint then
-- 			-- Updated variable is equal to current variable, plus the amount of chips in chip gain.
-- 			-- 15 = 0+15, 30 = 15+15, 75 = 60+15.
-- 			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
-- 			return {
-- 				message = 'Upgraded!',
-- 				colour = G.C.CHIPS,
-- 				-- The return value, "card", is set to the variable "card", which is the joker.
-- 				-- Basically, this tells the return value what it's affecting, which if it's the joker itself, it's usually card.
-- 				-- It can be things like card = context.other_card in some cases, so specifying card (return value) = card (variable from function) is required.
-- 				card = card
-- 			}
-- 		end
-- 	end
-- }

SMODS.Joker { --TODO: See if the sprite change timing issue can be fixed
    key = 'winter_soldier',
    loc_txt = {
        name = "Winter Soldier",
        text = {
            "Retrigger all scoring cards",
            "in played hand {C:blue}#1#{} time(s)",
            "This Joker gains {C:attention}#2#{} retrigger",
            "for every {C:attention}Boss Blind{} defeated.",
            "Retrigger amount resets upon",
            "playing a hand that does not",
            "score at least {C:attention}#3#%{}",
            "of the required chips."
        }
    },
    config = { extra = { repetitions = 0, extra_repetitions = 1, threshold = 80, most_recent_hand = 0 } },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 0, y = 0 },
    cost = 10,
    blueprint_compat = true, --potentially false for future balancing
    eternal_compat = true,
    --unlocked = true,

    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.repetitions, card.ability.extra.extra_repetitions, card.ability.extra.threshold, card.ability.extra.most_recent_hand} }
    end,
    
    calculate = function(self, card, context)
        -- local eval = function(card) return (card.ability.extra.repetitions >= 1 and context.hand_drawn) end
        -- juice_card_until(card, eval, true)
        local spriteCheck = function()
            if card.ability.extra.repetitions > 0 then 
                card.children.center:set_sprite_pos({x = 1, y = 0})
            else 
                card.children.center:set_sprite_pos({x = 0, y = 0})
            end
        end
        spriteCheck()
        if context.setting_blind then
            print('in context setting blind')
            local current_hand = 0
            card.ability.extra.most_recent_hand = current_hand
            print('most_recent_hand: '.. card.ability.extra.most_recent_hand)
            return {
                most_recent_hand = current_hand,
                card = card
            }
        end
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
            -- local current_hand = G.GAME.current_round.current_hand.chip_total
            -- G.GAME.chips
            -- if current_hand ~= nil then
            --     print('in cardarea, most_recent_hand: ' .. current_hand)
            -- else 
            --     print('current_hand == nil')
            -- end
            -- print('retriggering')
            return {
                message = localize{'k_again_ex'},
                repetitions = card.ability.extra.repetitions,
                card = card
            }
        end
        if context.final_scoring_step then
            if G.GAME.selected_back.name == 'Plasma Deck' then
                local current_hand = ((hand_chips + mult) / 2) ^ 2
                print('in final scoring')
                print('current_hand: ' .. current_hand)
                print('blind chips: ' .. G.GAME.blind.chips)
                card.ability.extra.most_recent_hand = current_hand
                return {
                    most_recent_hand = current_hand,
                    card = card
                }
            else
                local current_hand = hand_chips * mult
                print('in final scoring')
                print('current_hand: ' .. current_hand)
                print('blind chips: ' .. G.GAME.blind.chips)
                card.ability.extra.most_recent_hand = current_hand
                return {
                    most_recent_hand = current_hand,
                    card = card
                }
            end
        end
        if context.debuffed_hand then
            print('in context debuffed hand')
            local current_hand = 0
            card.ability.extra.most_recent_hand = current_hand
            print('most_recent_hand: '.. card.ability.extra.most_recent_hand)
            return {
                most_recent_hand = current_hand,
                card = card
            }
        end
        -- if context.after then print('context.after is true') end
        -- if reset then print('reset is true') end
        -- if not reset then print('reset is false') end
        --if self.ability.extra.repetitions > 0 then print('repetitions:', self.ability.extra.repetitions) end

        if context.after and not context.individual and not context.blueprint then
            --card.ability.extra.repetitions = 0
            local current_hand = card.ability.extra.most_recent_hand
            if current_hand ~= nil then
                print('in context.after, current hand: ' .. current_hand)
            else 
                print('in context.after, current_hand == nil')
            end
            -- TODO: add nil check for naneinf safety
            if card.ability.extra.most_recent_hand ~= nil then
                print('threshold/100: ' .. (card.ability.extra.threshold/100))
                if card.ability.extra.most_recent_hand / G.GAME.blind.chips < (card.ability.extra.threshold/100) then
                    print('less than threshold')
                    if card.ability.extra.repetitions >= 1 then
                        card.ability.extra.repetitions = 0
                        return {
                            card = card,
                            message = localize('k_reset'),
                            pitch = 1,
                            volume = 2.5,
                            sound = 'Unrivaled_outofenergy'
                        }
                    end
                elseif G.GAME.blind.boss then
                    card.ability.extra.repetitions = card.ability.extra.repetitions + card.ability.extra.extra_repetitions
                    if card.ability.extra.repetitions <= 1 then
                        print('Armed and Dangerous!')
                        return {
                            message_card = card,
                            message = 'Armed and Dangerous!',
                            pitch = 1,
                            volume = 2.5,
                            sound = 'Unrivaled_armedanddangerous'
                        }
                    end
                        print('again!')
                        return {
                            message_card = card,
                            message = 'Again!',
                            pitch = 1,
                            volume = 2.5,
                            sound = 'Unrivaled_again'
                        }
                end
            else
                print('most_recent_hand == nil')
            end
            --print('in context after, reset true')

        end
    end
}


SMODS.Joker { --TODO: See if the sprite change timing issue can be fixed
    key = 'black_panther',
    loc_txt = {
        name = "Black Panther",
        text = {
            "Played Kings of {C:Spades}Spades{}",
            "each give {C:Mult}x#1#{} mult when scored"
        }
    },
    config = { extra = { x_mult = 2 } },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 2, y = 0 },
    cost = 8,
    blueprint_compat = true, 
    eternal_compat = true,
    --unlocked = true,
    
    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.x_mult} }
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and context.other_card:get_id() == 13 and context.other_card:is_suit("Spades")then
            return {
                x_mult = card.ability.extra.x_mult,
                card = card
            }
        end
    end
}
-- function return_JokerValues() -- not used, just here to demonstrate how you could return values from a joker
--     if context.joker_main and context.cardarea == G.jokers then
--         return {
--             chips = self.ability.extra.chips,       -- these are the 3 possible scoring effects any joker can return.
--             mult = self.ability.extra.mult,         -- adds mult (+)
--             x_mult = self.ability.extra.x_mult,     -- multiplies existing mult (*)
--             card = self,                            -- under which card to show the message
--             colour = G.C.CHIPS,                     -- colour of the message, Balatro has some predefined colours, (Balatro/globals.lua)
--             message = localize('k_upgrade_ex'),     -- this is the message that will be shown under the card when it triggers.
--             extra = { focus = self, message = localize('k_upgrade_ex') }, -- another way to show messages, not sure what's the difference.
--         }
--     end
-- end

-- local msg_dictionary={
--     -- do note that when using messages such as: 
--     -- message = localize{type='variable',key='a_xmult',vars={current_xmult}},
--     -- that the key 'a_xmult' will use provided values from vars={} in that order to replace #1#, #2# etc... in the localization file.

--     a_chips="+#1#",
--     a_chips_minus="-#1#",
--     a_hands="+#1# Hands",
--     a_handsize="+#1# Hand Size",
--     a_handsize_minus="-#1# Hand Size",
--     a_mult="+#1# Mult",
--     a_mult_minus="-#1# Mult",
--     a_remaining="#1# Remaining",
--     a_sold_tally="#1#/#2# Sold",
--     a_xmult="X#1# Mult",
--     a_xmult_minus="-X#1# Mult",
-- }    

-- local mod_name = 'Unrivaled' -- Put your mod name here!

-- local jokers = {
--     sample_obelisk = {
--         name = "sample_obelisk",
--         text = {
--             "This Joker gives {X:mult,C:white} X#1# {} Mult",
--             "for each time you've played this {C:attention}hand",
--         },
--         config = { extra = { x_mult = 0.1 } },
--         pos = { x = 0, y = 0 },
--         rarity = 3,
--         cost = 6,
--         blueprint_compat = true,
--         eternal_compat = true,
--         unlocked = true,
--         discovered = true,
--         effect = nil,
--         atlas = nil,
--         soul_pos = nil,

--         calculate = function(self, context)
--             if self.debuff then return nil end
--             if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
--                 local current_hand_times = (G.GAME.hands[context.scoring_name].played or 0) -- how many times has the player played the current type of hand. (pair, two pair. etc..)
--                 local current_xmult = 1 + (current_hand_times * self.ability.extra.x_mult)

--                 return {
--                     message = localize{type='variable',key='a_xmult',vars={current_xmult}},
--                     colour = G.C.RED,
--                     x_mult = current_xmult
--                 }

--                 -- you could also apply it to the joker, to do it like the sample wee, but then you'd have to reset the card and text every time the previewed hand changes.
--             end
--         end,

--         loc_def = function(self)
--             return { self.ability.extra.x_mult }
--         end
--     },
--     sample_hackerman = {
--         name = "sample_hackerman",
--         text = {
--             "Retrigger",
--             "each played",
--             "{C:attention}6{}, {C:attention}7{}, {C:attention}8{}, or {C:attention}9{}",
--         },
--         config = { repetitions = 1 },
--         pos = { x = 0, y = 0 },
--         rarity = 2,
--         cost = 4,
--         blueprint_compat = true,
--         eternal_compat = false,
--         unlocked = true,
--         discovered = true,
--         effect = nil,
--         atlas = nil,
--         soul_pos = nil,

--         calculate = function(self, context)
--             if self.debuff then return nil end
--             if context.cardarea == G.play and context.repetition and (
--                 context.other_card:get_id() == 6 or 
--                 context.other_card:get_id() == 7 or 
--                 context.other_card:get_id() == 8 or 
--                 context.other_card:get_id() == 9) then
--                 return {
--                     message = localize('k_again_ex'),
--                     repetitions = self.ability.repetitions,
--                     card = self
--                 }
--             end
--         end,

--         loc_def = function(self)
--             return { }
--         end
--     },

-- }