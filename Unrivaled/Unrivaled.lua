--- STEAMODDED HEADER
--- MOD_NAME: Unrivaled
--- MOD_ID: Unrivaled
--- MOD_AUTHOR: [StormySky16]
--- MOD_DESCRIPTION: Marvel Rivals Jokers Mod
--- MOD_VERSION: 0.3.0-alpha
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

SMODS.Atlas {
	key = "tag_heroic",
	path = "heroic_tag.png",
	px = 34,
	py = 34,
}

SMODS.Tag {
    key = "heroic_tag",
    loc_txt = {
        name = 'Heroic Tag',
        text = {"Shop has a free {C:yellow}Heroic Joker{}"}
    },
    atlas = "tag_heroic",
    pos = { x = 0, y = 0 },
    config = { type = "store_joker_create" },
    apply = function(self, tag, context)
        if context.type == "store_joker_create" then
            local rares_in_posession = { 0 }
            for k, v in ipairs(G.jokers.cards) do
                if v.config.center.rarity == "Unrivaled_heroic" and not rares_in_posession[v.config.center.key] then
                    rares_in_posession[1] = rares_in_posession[1] + 1
                    rares_in_posession[v.config.center.key] = true
                end
            end
            local card
            if #G.P_JOKER_RARITY_POOLS.Unrivaled_heroic > rares_in_posession[1] then
                card = create_card("Joker", context.area, nil, "Unrivaled_heroic", nil, nil, nil, "j_Unrivaled")
                create_shop_card_ui(card, "Joker", context.area)
                card.states.visible = false
                tag:yep("+", G.C.RARITY.Unrivaled_heroic, function()
                    card:start_materialize()
                    --print(card.cost)
                    card.cost = 0
                    --print(card.cost)
                    --card:set_cost()
                    --print(card.cost)
                    return true
                end)
            else
                tag:nope()
            end
            tag.triggered = true
            return card
        end
    end,
}

SMODS.Rarity {
    key = 'heroic',
    loc_txt = { name = 'Heroic' },
    badge_colour = HEX('f4d12b'),
    
    -- default_weight = 0.15, --Target weight
    default_weight = 0.05, --Temp weight to offset the low pool size
    pools = {
        ["Joker"] = true
    },
    
    get_weight = function(self, weight, object_type)
        return weight
    end
}

--Target weights
-- SMODS.ObjectTypes["Joker"].rarities[1].weight = 0.60
-- SMODS.ObjectTypes["Joker"].rarities[2].weight = 0.20
-- SMODS.ObjectTypes["Joker"].rarities[3].weight = 0.05

--Temp weights
SMODS.ObjectTypes["Joker"].rarities[1].weight = 0.70
SMODS.ObjectTypes["Joker"].rarities[2].weight = 0.20
SMODS.ObjectTypes["Joker"].rarities[3].weight = 0.05

--Winter Soldier Lines
SMODS.Sound ({
    key = "again", path = "again.ogg"
})  
SMODS.Sound ({
    key = "outofenergy", path = "outofenergy.ogg",
})
SMODS.Sound ({
    key = "armedanddangerous", path = "armedanddangerous.ogg"
})

--Black Panther Lines
SMODS.Sound ({
    key = "tremblebeforebast", path = "tremblebeforebast.ogg"
})

--Hela Lines
hela_lines = {"mycrowshunger", "theirsoulsaremine", "anothersoulfallsintomyrealm"}

SMODS.Sound ({
    key = "mycrowshunger", path = "mycrowshunger.ogg"
})

SMODS.Sound ({
    key = "theirsoulsaremine", path = "theirsoulsaremine.ogg"
})

SMODS.Sound ({
    key = "anothersoulfallsintomyrealm", path = "anothersoulfallsintomyrealm.ogg"
})

--Loki Lines

SMODS.Sound ({
    key = "yourpowersaremine", path = "yourpowersaremine.ogg"
})

SMODS.Sound ({
    key = "iamlokiorami", path = "iamlokiorami.ogg"
})

--The Thing Lines

thing_lines = {"nottooshabby", "littleextraclobber", "thoughtIwasstrongenough"}

SMODS.Sound ({
    key = "nottooshabby", path = "nottooshabby.ogg"
})

SMODS.Sound ({
    key = "littleextraclobber", path = "littleextraclobber.ogg"
})

SMODS.Sound ({
    key = "thoughtIwasstrongenough", path = "thoughtIwasstrongenough.ogg"
})

--Human Torch Lines

torch_lines = {"flameonrivals", "isithotinhere", "turneduptheheatjustforyou"}


SMODS.Sound ({
    key = "flameonrivals", path = "flameonrivals.ogg"
})

SMODS.Sound ({
    key = "isithotinhere", path = "isithotinhere.ogg"
})

SMODS.Sound ({
    key = "turneduptheheatjustforyou", path = "turneduptheheatjustforyou.ogg"
})

--Invisible Woman Lines

SMODS.Sound ({
    key = "disappear", path = "disappear.ogg"
})

--Mister Fantastic

fantastic_lines = {"fantastic", "nowforsomethingtrulyfantastic"}

SMODS.Sound ({
    key = "fantastic", path = "fantastic.ogg"
})

SMODS.Sound ({
    key = "nowforsomethingtrulyfantastic", path = "nowforsomethingtrulyfantastic.ogg"
})

--The Fantastic Four

f4_lines = {"feelingfantastic", "ifeelfantastic", "torchfeelfantastic", "thingfeelfantastic"}

SMODS.Sound ({
    key = "shieldsup", path = "shieldsup.ogg"
})

SMODS.Sound ({
    key = "supernova", path = "supernova.ogg"
})


SMODS.Sound ({
    key = "feelingfantastic", path = "feelingfantastic.ogg"
})

SMODS.Sound ({
    key = "ifeelfantastic", path = "ifeelfantastic.ogg"
})

SMODS.Sound ({
    key = "torchfeelfantastic", path = "torchfeelfantastic.ogg"
})

SMODS.Sound ({
    key = "thingfeelfantastic", path = "thingfeelfantastic.ogg"
})

--Adam Warlock Lines

SMODS.Sound ({
    key = "bornagain", path = "bornagain.ogg"
})

SMODS.Sound ({
    key = "unlimitedcosmicmight", path = "unlimitedcosmicmight.ogg"
})

--Moon Knight Lines

SMODS.Sound ({
    key = "themoo", path = "themoo.ogg"
})

--Cloak Lines

cloak_fail_lines = {"nah", "nope"}

cloak_success_lines = {"welcome", "obscure"}

SMODS.Sound ({
    key = "nah", path = "cloaknah.ogg"
})

SMODS.Sound ({
    key = "nope", path = "cloaknope.ogg"
})

SMODS.Sound ({
    key = "welcome", path = "cloakwelcome.ogg"
})

SMODS.Sound ({
    key = "obscure", path = "cloakobscure.ogg"
})

--Dagger Lines

dagger_lines = {"mytimetoshine", "embracethelight"}

SMODS.Sound ({
    key = "mytimetoshine", path = "mytimetoshine.ogg"
})

SMODS.Sound ({
    key = "embracethelight", path = "embracethelight.ogg"
})

--Cloak & Dagger Lines
c_d_ult_lines = {"usagainsttheworlddagger", "usagainsttheworldcloak"}

SMODS.Sound ({
    key = "usagainsttheworlddagger", path = "usagainsttheworlddagger.ogg"
})

SMODS.Sound ({
    key = "usagainsttheworldcloak", path = "usagainsttheworldcloak.ogg"
})

-- you can have shared helper functions
-- function shakecard(self) --visually shake a card
--     G.E_MANAGER:add_event(Event({
--         func = function()
--             self:juice_up(0.5, 0.5)
--             return true
--         end
--     }))
-- end

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

fantastic_eval = function(card, context) 
    -- print(next(SMODS.find_card("j_Unrivaled_the_thing"))~= nil)
    -- print(next(SMODS.find_card("j_Unrivaled_invisible_woman"))~= nil)
    -- print(next(SMODS.find_card("j_Unrivaled_mister_fantastic"))~= nil)
    -- print(next(SMODS.find_card("j_Unrivaled_human_torch"))~= nil)
    
    
    -- print("fantastic eval")
    local invisible_woman = false
    local the_thing = false
    local human_torch = false
    local mister_fantastic = false

    -- Probably more efficient, but doesn't detect debuffed Jokers. If that's an ok consideration for future balance, use this instead for efficiency & ignoring debuffed Jokers.
    -- if next(SMODS.find_card("j_Unrivaled_invisible_woman"))  then
    --     invisible_woman = true
    -- end
    -- if next(SMODS.find_card("j_Unrivaled_human_torch"))  then
    --     human_torch = true
    -- end
    -- if next(SMODS.find_card("j_Unrivaled_mister_fantastic"))  then
    --     mister_fantastic = true
    -- end
    -- if next(SMODS.find_card("j_Unrivaled_the_thing"))  then
    --     the_thing = true
    -- end
    for i=1, #G.jokers.cards do 
        if G.jokers.cards[i].config.center.key == "j_Unrivaled_invisible_woman" then
            invisible_woman = true
            --print("invis")
        end
        if G.jokers.cards[i].config.center.key == "j_Unrivaled_the_thing" then
            the_thing = true
            --print("thing")
        end
        if G.jokers.cards[i].config.center.key == "j_Unrivaled_mister_fantastic" then
            mister_fantastic = true
            --print("fantastic")
        end
        if G.jokers.cards[i].config.center.key == "j_Unrivaled_human_torch" then
            human_torch = true
            --print("torch")
        end
    end
    -- print(invisible_woman)
    -- print(the_thing)
    -- print(human_torch)
    -- print(mister_fantastic)
    if invisible_woman and
       the_thing and
       human_torch and 
       mister_fantastic then
        -- print("f4 present")
        local iw = false
        local ht = false
        local tt = false
        local mf = false
        for i=1, #G.jokers.cards do 
            if G.jokers.cards[i].config.center.key == "j_Unrivaled_invisible_woman" and not iw then
                play_sound('tarot1')
                G.jokers.cards[i]:start_dissolve()
                iw = true
            end
            if G.jokers.cards[i].config.center.key == "j_Unrivaled_human_torch" and not ht then
                play_sound('tarot1')
                G.jokers.cards[i]:start_dissolve()
                ht = true
            end
            if G.jokers.cards[i].config.center.key == "j_Unrivaled_the_thing" and not tt then
                play_sound('tarot1')
                G.jokers.cards[i]:start_dissolve()
                tt = true
            end
            if G.jokers.cards[i].config.center.key == "j_Unrivaled_mister_fantastic" and not mf then
                play_sound('tarot1')
                G.jokers.cards[i]:start_dissolve()
                mf = true
            end
        end
        if iw and ht and tt and mf and not card.ability.extra.flag then
            card.ability.extra.flag = true
            SMODS.add_card({set = 'Joker', area = G.jokers, key = "j_Unrivaled_fantastic_four"})
        end
    end
end

c_d_eval = function(card, context) 
    -- print(next(SMODS.find_card("j_Unrivaled_the_thing"))~= nil)
    -- print(next(SMODS.find_card("j_Unrivaled_invisible_woman"))~= nil)
    -- print(next(SMODS.find_card("j_Unrivaled_mister_fantastic"))~= nil)
    -- print(next(SMODS.find_card("j_Unrivaled_human_torch"))~= nil)
    
    
    -- print("fantastic eval")
    local cloak = false
    local dagger = false

    -- Probably more efficient, but doesn't detect debuffed Jokers. If that's an ok consideration for future balance, use this instead for efficiency & ignoring debuffed Jokers.
    -- if next(SMODS.find_card("j_Unrivaled_invisible_woman"))  then
    --     invisible_woman = true
    -- end
    -- if next(SMODS.find_card("j_Unrivaled_human_torch"))  then
    --     human_torch = true
    -- end
    -- if next(SMODS.find_card("j_Unrivaled_mister_fantastic"))  then
    --     mister_fantastic = true
    -- end
    -- if next(SMODS.find_card("j_Unrivaled_the_thing"))  then
    --     the_thing = true
    -- end
    for i=1, #G.jokers.cards do 
        if G.jokers.cards[i].config.center.key == "j_Unrivaled_cloak" then
            cloak = true
            --print("invis")
        end
        if G.jokers.cards[i].config.center.key == "j_Unrivaled_dagger" then
            dagger = true
            --print("thing")
        end
    end
    -- print(invisible_woman)
    -- print(the_thing)
    -- print(human_torch)
    -- print(mister_fantastic)
    if cloak and dagger then
        -- print("f4 present")
        local c = false
        local d = false
        for i=1, #G.jokers.cards do 
            if G.jokers.cards[i].config.center.key == "j_Unrivaled_cloak" and not c then
                play_sound('tarot1')
                G.jokers.cards[i]:start_dissolve()
                c = true
            end
            if G.jokers.cards[i].config.center.key == "j_Unrivaled_dagger" and not d then
                play_sound('tarot1')
                G.jokers.cards[i]:start_dissolve()
                d = true
            end
        end
        if c and d and not card.ability.extra.flag then
            card.ability.extra.flag = true
            SMODS.add_card({set = 'Joker', area = G.jokers, key = "j_Unrivaled_cloak_and_dagger"})
        end
    end
end

--Winter Soldier
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
            "of the required chips"
        }
    },
    config = { extra = { repetitions = 0, extra_repetitions = 1, threshold = 80, most_recent_hand = 0 } },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 0, y = 0 },
    cost = 10,
    blueprint_compat = false, --potentially false for future balancing
    eternal_compat = true,
    --unlocked = true,

    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.repetitions, card.ability.extra.extra_repetitions,
                        card.ability.extra.threshold, card.ability.extra.most_recent_hand} }
    end,
    
    calculate = function(self, card, context)
        -- local eval = function(card) return (card.ability.extra.repetitions >= 1 and context.hand_drawn) end
        -- juice_card_until(card, eval, true)
        if not context.blueprint then
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

            if context.after and not context.individual then
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
    end
}

--Black Panther
SMODS.Joker {
    key = 'black_panther',
    loc_txt = {
        name = "Black Panther",
        text = {
            "Played {C:attention}Kings{} of {C:spades}Spades{}",
            "each give {X:mult,C:white}x#1#{} mult when scored"
        }
    },
    config = { extra = { x_mult = 2 , king_of_spades = false} },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 2, y = 0 },
    cost = 8,
    blueprint_compat = true, 
    eternal_compat = true,
    --unlocked = true,
    
    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.x_mult, card.ability.extra.king_of_spades} }
    end,
    
    calculate = function(self, card, context)
        if context.before and not context.individual and not context.blueprint then
            --print("context: ")
            --print(context)
            print('context before, BP')
            for i = 1, #context.scoring_hand do
                print('i: ' .. i)
                --These lines can crash game on debuff boss blinds due to nil
                --print('card i == king: '.. tostring(context.scoring_hand[i]:get_id() == 13))
                --print('card i == spades: '.. tostring(context.scoring_hand[i]:is_suit("Spades"))) 
                if context.scoring_hand[i]:get_id() == 13 and context.scoring_hand[i]:is_suit("Spades") then
                    print(card.ability.extra.king_of_spades)
                    card.ability.extra.king_of_spades = true
                end
            end
            if card.ability.extra.king_of_spades then
                print("returning bast")
                card.ability.extra.king_of_spades = false
                --play_sound("Unrivaled_tremblebeforebast", 1, 2.5)
                return{
                    message_card = card,
                    message =  "Tremble before Bast!",
                    pitch = 1,
                    volume = 2.5,
                    sound = "Unrivaled_tremblebeforebast"
                }
            end
        end
        if context.cardarea == G.play and context.individual and context.other_card:get_id() == 13 and context.other_card:is_suit("Spades") then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end

        if context.after then
            card.ability.extra.king_of_spades = false
        end
    end
}

--Hela
SMODS.Joker {
    key = 'hela',
    loc_txt = {
        name = "Hela",
        text = {
            "When {C:attention}Blind{} is selected,",
            "destroy Joker to the right and permanently",
            "add {C:attention}#3#{} times its sell value to {C:chips}chips{}.",
            "This joker also gains {X:mult,C:white}x#4#{} Mult",
            "when a {C:attention}playing card{} is destroyed",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {X:mult,C:white}x#2# {C:inactive} mult)"
        }
    },
    config = { extra = { chips = 0, Xmult = 1, chip_gain = 4, Xmult_mod = 0.25} },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 3, y = 0 },
    cost = 7,
    blueprint_compat = true, 
    eternal_compat = true,
    --unlocked = true,
    
    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, card.ability.extra.Xmult, card.ability.extra.chip_gain, card.ability.extra.Xmult_mod} }
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then my_pos = i; break end
                end
                if my_pos and G.jokers.cards[my_pos+1] and not card.getting_sliced 
                and not G.jokers.cards[my_pos+1].ability.eternal and not G.jokers.cards[my_pos+1].getting_sliced then 
                    local sliced_card = G.jokers.cards[my_pos+1]
                    local voice_line = "Unrivaled_" .. pseudorandom_element(hela_lines, pseudoseed('helunleashed'))
                    --print(voice_line)
                    sliced_card.getting_sliced = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    G.E_MANAGER:add_event(Event({func = function()
                                            G.GAME.joker_buffer = 0
                                            card.ability.extra.chips = card.ability.extra.chips + sliced_card.sell_cost*card.ability.extra.chip_gain
                                            card:juice_up(0.8, 0.8)
                                            sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                                            play_sound('slice1', 0.96+math.random()*0.08)
                                            play_sound(voice_line, 1, 3)
                                            return true end }))
                    card_eval_status_text(card, 'extra', nil, nil, nil,
                                            {message = localize{type = 'variable', key = 'a_chips', 
                                            vars = {card.ability.extra.chips+card.ability.extra.chip_gain*sliced_card.sell_cost}}.. ' chips', 
                                            colour = G.C.BLUE, no_juice = true})
                end
        end
        if context.remove_playing_cards and not context.blueprint then
            for k, val in ipairs(context.removed) do
                    card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod       
            end
            card_eval_status_text(card, 'extra', nil, nil, nil, 
                                 {message = "Upgraded!",
                                 colour = G.C.FILTER})
            local voice_line = "Unrivaled_" .. pseudorandom_element(hela_lines, pseudoseed('helunleashed'))
            --print(voice_line)
            play_sound(voice_line, 1, 3)
        end

        if context.cardarea == G.jokers and context.joker_main and (card.ability.extra.Xmult > 1 or card.ability.extra.chips > 0) then
            return{
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}}.. "chips, " ..
                localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}},
                Xmult_mod = card.ability.extra.Xmult,
                chip_mod = card.ability.extra.chips
            }
        end
    end
}

--Loki
SMODS.Joker {
    key = 'loki',
    loc_txt = {
        name = "Loki",
        text = {
            "After defeating {C:attention}#1#{} {C:attention}Boss Blinds{},",
            "sell this card to {C:attention}Duplicate{} a",
            "{C:dark_edition}Negative{} copy of a random Joker",
            "{C:inactive}(Currently {C:attention}#2#{}{C:inactive}/#1# {C:attention}Boss Blinds{}{C:inactive})"
        }
    },
    config = { extra = { boss_requirement = 2, cleared_bosses = 0} },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 4, y = 0 },
    cost = 10,
    blueprint_compat = false, 
    eternal_compat = false,
    --unlocked = true,
    
    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.boss_requirement, card.ability.extra.cleared_bosses} }
    end,
    
    calculate = function(self, card, context)
        local eval = function(card) return (card.ability.extra.cleared_bosses >= 2) end
        if context.end_of_round and not context.blueprint and context.main_eval then
            juice_card_until(card, eval, true)
            if G.GAME.blind.boss then
                print('plus 1 boss clear')
                card.ability.extra.cleared_bosses = card.ability.extra.cleared_bosses + 1
            end
            if (card.ability.extra.boss_requirement <= card.ability.extra.cleared_bosses) then
                return {
                    message = localize('k_active_ex'),
                    colour = G.C.FILTER,
                    pitch = 1,
                    volume = 2,
                    sound = "Unrivaled_iamlokiorami"
                }
            else 
                return {
                    message = (card.ability.extra.cleared_bosses..'/'..card.ability.extra.boss_requirement),
                    colour = G.C.FILTER,
                }
            end
        end
        if context.selling_self and (card.ability.extra.cleared_bosses >= card.ability.extra.boss_requirement) and not context.blueprint then
            juice_card_until(card, eval, true)
            local jokers = {}
            for i=1, #G.jokers.cards do 
                if G.jokers.cards[i] ~= card then
                    jokers[#jokers+1] = G.jokers.cards[i]
                end
            end
            if #jokers > 0 then 
                play_sound("Unrivaled_yourpowersaremine", 1, 2.5)
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex')})
                local chosen_joker = pseudorandom_element(jokers, pseudoseed('yourpowersaremine'))
                local copied = copy_card(chosen_joker, nil, nil, nil, chosen_joker.edition and chosen_joker.edition.negative)
                if card.ability.extra.cleared_bosses then card.ability.extra.cleared_bosses = 0 end
                copied:set_edition("e_negative", true, true)
                copied:add_to_deck()
                G.jokers:emplace(copied)
                copied:juice_up()
            else
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_no_other_jokers')})
            end
        end
    end
}

--Fantastic Four Jokers need to be updated to address edge case of debuffed Jokers and Duplicated Jokers--
--Tentatively Complete!

--The Thing 
SMODS.Joker {
    key = 'the_thing',
    loc_txt = {
        name = "The Thing",
        text = {
            "This Joker gains {C:chips}+#2#{} Chips",
            "if played hand has exactly {C:attention}#3#{} cards",
            "and contains a {C:attention}Four of a Kind{}",
            "{C:inactive}(Currently {C:chips}+#1# Chips{}{C:inactive})"
        }
    },
    config = { extra = { chips = 0, chip_gain = 50, played_hand_size_threshold = 4, flag = false} },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 5, y = 0 },
    no_pool_flag = "fantastic_four",
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    --unlocked = true,
    
    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, card.ability.extra.chip_gain, card.ability.extra.played_hand_size_threshold, card.ability.extra.flag} }
    end,
    
    calculate = function(self, card, context)
        if context.card_added and not context.blueprint then
            if context.card.config.center.rarity == "Unrivaled_heroic" then
                -- print("card is joker")
                -- print(context.card.config.center.key)
                if context.card.config.center.key ~= "j_Unrivaled_fantastic_four" then
                    --print("eval call")
                    G.E_MANAGER:add_event(Event({
                        trigger = "after", 
                        --delay = 0.1, 
                        func = function()
                            fantastic_eval(context.card, context)
                            return true
                        end
                    }))
                end
            end
        end
        if context.before and next(context.poker_hands['Four of a Kind']) and 
        #context.full_hand == card.ability.extra.played_hand_size_threshold and not context.blueprint then
            local voice_line = "Unrivaled_" .. pseudorandom_element(thing_lines, pseudoseed('itsclobberintime'))
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                card = card,
                pitch = 1,
                volume = 2,
                sound = voice_line
            }
        end
        if context.cardarea == G.jokers and context.joker_main and card.ability.extra.chips > 0 then
            return{
                message = localize{type='variable',key='a_chips', vars={card.ability.extra.chips}},
                chip_mod = card.ability.extra.chips
            }
        end
    end
}

--Human Torch
SMODS.Joker {
    key = 'human_torch',
    loc_txt = {
        name = "Human Torch",
        text = {
            "If {C:attention}first discard{} of round",
            "has exactly {C:attention}#1# cards{}, destroy them,",
            "then upgrade the level",
            "of the corresponding hand"
        }
    },
    config = { extra = {discarded_hand_size_threshold = 4, flag = false} },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 0, y = 1 },
    no_pool_flag = "fantastic_four",
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    --unlocked = true,
    
    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.discarded_hand_size_threshold, card.ability.extra.flag} }
    end,
    
    calculate = function(self, card, context)
        if context.card_added and not context.blueprint then
            if context.card.config.center.rarity == "Unrivaled_heroic" then
                -- print("card is joker")
                -- print(context.card.config.center.key)
                if context.card.config.center.key ~= "j_Unrivaled_fantastic_four" then
                    --print("eval call")
                    G.E_MANAGER:add_event(Event({
                        trigger = "after", 
                        --delay = 0.1, 
                        func = function()
                            fantastic_eval(context.card, context)
                            return true
                        end
                    }))
                end
            end
        end
        if not context.blueprint and context.first_hand_drawn then
            local eval = function(card) return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.pre_discard and #context.full_hand == card.ability.extra.discarded_hand_size_threshold 
           and G.GAME.current_round.discards_used <= 0 and not context.hook then
                local text,disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                local voice_line = "Unrivaled_" .. pseudorandom_element(torch_lines, pseudoseed('supernova'))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Incinerated!"})
                if not context.blueprint then
                    play_sound(voice_line, 1, 2)
                end
                update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(text, 'poker_hands'),chips = G.GAME.hands[text].chips, mult = G.GAME.hands[text].mult, level=G.GAME.hands[text].level})
                level_up_hand(context.blueprint_card or card, text, nil, 1)
                update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
        end
        if context.discard and G.GAME.current_round.discards_used <= 0 and #context.full_hand == card.ability.extra.discarded_hand_size_threshold then
                return {
                    delay = 0.45, 
                    remove = true,
                    card = self
                }
        end
    end
}

--Invisible Woman
SMODS.Joker {
    key = 'invisible_woman',
    loc_txt = {
        name = "Invisible Woman",
        text = {
            "If played hand contains",
            "exactly {C:attention}#1#{} cards,",
            "scored cards become {C:attention}Glass Cards{}"
        }
    },
    config = { extra = {played_hand_size_threshold = 4, flag = false} },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 1, y = 1 },
    no_pool_flag = "fantastic_four",
    cost = 8,
    blueprint_compat = false,
    eternal_compat = true,
    --unlocked = true,
    
    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.played_hand_size_threshold, card.ability.extra.flag} }
    end,
    
    calculate = function(self, card, context)
        if context.card_added and not context.blueprint then
            if context.card.config.center.rarity == "Unrivaled_heroic" then
                -- print("card is joker")
                -- print(context.card.config.center.key)
                if context.card.config.center.key ~= "j_Unrivaled_fantastic_four" then
                    --print("eval call")
                    G.E_MANAGER:add_event(Event({
                        trigger = "after", 
                        --delay = 0.1, 
                        func = function()
                            fantastic_eval(context.card, context)
                            return true
                        end
                    }))
                end
            end
        end
        if context.before and #context.full_hand == card.ability.extra.played_hand_size_threshold and not context.blueprint then
            --local voice_line = "Unrivaled_" .. pseudorandom_element(invisible_lines, pseudoseed('disappear'))
            local cards = {}
            for k, v in ipairs(context.scoring_hand) do
                    cards[#cards+1] = v
                    v:set_ability(G.P_CENTERS.m_glass, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    })) 
                end
            return {
                message = "Disappear!",
                colour = G.C.CHIPS,
                card = card,
                pitch = 1,
                volume = 2,
                sound = "Unrivaled_disappear"
            }
        end
    end
}

--Mister Fantastic
SMODS.Joker {
    key = 'mister_fantastic',
    loc_txt = {
        name = "Mister Fantastic",
        text = {
            "If played hand contains exactly",
            "{C:attention}#3#{} cards, this Joker gains {X:mult,C:white} x#2#{} mult",
            "for every {C:attention}#4#{} scored, resets",
            "when {C:attention}Boss Blind{} is defeated", 
            "{C:inactive}(Currently {X:mult,C:white}x#1#{}{C:inactive})"
        }
    },
    config = { extra = { Xmult = 1, Xmult_mod = 1, played_hand_size_threshold = 4, target_card_id = 4, default_Xmult = 1, 
               four = false, flag = false} },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 2, y = 1 },
    no_pool_flag = "fantastic_four",
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    --unlocked = true,
    
    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.Xmult, card.ability.extra.Xmult_mod, 
        card.ability.extra.played_hand_size_threshold, card.ability.extra.target_card_id,
        card.ability.extra.default_Xmult, card.ability.extra.four, card.ability.extra.flag} }
    end,
    
    calculate = function(self, card, context)
        if context.card_added and not context.blueprint then
            if context.card.config.center.rarity == "Unrivaled_heroic" then
                -- print("card is joker")
                -- print(context.card.config.center.key)
                if context.card.config.center.key ~= "j_Unrivaled_fantastic_four" then
                    --print("eval call")
                    G.E_MANAGER:add_event(Event({
                        trigger = "after", 
                        --delay = 0.1, 
                        func = function()
                            fantastic_eval(context.card, context)
                            return true
                        end
                    }))
                end
            end
        end
        if context.before and not context.individual and not context.blueprint 
        and #context.full_hand == card.ability.extra.played_hand_size_threshold then
            --print("context: ")
            --print(context)
            --print('context before, Reed')
            for i = 1, #context.scoring_hand do
                --These lines can crash game on debuff boss blinds due to nil
                --print('card i == king: '.. tostring(context.scoring_hand[i]:get_id() == 13))
                --print('card i == spades: '.. tostring(context.scoring_hand[i]:is_suit("Spades"))) 
                if context.scoring_hand[i]:get_id() == 4 then
                    print(card.ability.extra.four)
                    card.ability.extra.four = true
                end
            end
            if card.ability.extra.four then
                local voice_line = "Unrivaled_" .. pseudorandom_element(fantastic_lines, pseudoseed('fantastic'))
                --print("returning fantastic")
                card.ability.extra.four = false
                --play_sound("Unrivaled_tremblebeforebast", 1, 2.5)
                return{
                    message_card = card,
                    message =  "Fantastic!",
                    pitch = 1,
                    volume = 2,
                    sound = voice_line
                }
            end
        end
        if context.cardarea == G.play and context.individual and #context.full_hand == card.ability.extra.played_hand_size_threshold 
        and context.other_card:get_id() == card.ability.extra.target_card_id and not context.blueprint then
            --local voice_line = "Unrivaled_" .. pseudorandom_element(invisible_lines, pseudoseed('disappear'))
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
            return {
                extra = {focus = card, message = localize('k_upgrade_ex')},
                card = card,
                colour = G.C.MULT
            }
        end
        if context.end_of_round and G.GAME.blind.boss and card.ability.extra.Xmult > 1 then
            card.ability.extra.Xmult = card.ability.extra.default_Xmult
            return {    
                message = localize('k_reset'),
                colour = G.C.RED,
                Xmult_mod = card.ability.extra.Xmult
            }
        end
        if context.cardarea == G.jokers and context.joker_main and card.ability.extra.Xmult > 1 then
            return{
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}},
                Xmult_mod = card.ability.extra.Xmult
            }
        end
    end
}

--The Fantastic Four
SMODS.Joker {
    key = 'fantastic_four',
    loc_txt = {
        name = "The Fantastic Four",
        text = {
            "If played hand contains exactly",
            "{C:attention}#5#{} cards and is a {C:attention}Four of a Kind{} of {C:attention}#6#{}s,", 
            "this Joker gains {C:chips}+#2#{} Chips and {X:mult,C:white} x#4#{} Mult,",
            "and played {C:attention}Glass Cards{} will not break.",
            "If the played hand clears the {C:attention}Blind's{}",
            "required chips, level up the corresponding hand by {C:attention}#11#{}",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {X:mult,C:white}x#3# {C:inactive} mult)"
        }
    },
    config = { extra = { chips = 0, chip_mod = 400, Xmult = 1, Xmult_mod = 4, played_hand_size_threshold = 4, 
                        target_card_id = 4, four = true, shielded = false, threshold = 100, most_recent_hand = 0, hand_level_mod = 2} },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 3, y = 1 },
    cost = 16,
    blueprint_compat = true,
    eternal_compat = true,
    --unlocked = true,
    
    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, card.ability.extra.chip_mod, card.ability.extra.Xmult, 
        card.ability.extra.Xmult_mod, card.ability.extra.played_hand_size_threshold, 
        card.ability.extra.target_card_id, card.ability.extra.four, card.ability.extra.shielded,
        card.ability.extra.threshold, card.ability.extra.most_recent_hand, card.ability.extra.hand_level_mod} }
    end,
    
    calculate = function(self, card, context)
        if context.buying_card and not context.blueprint then
            print("in buying card context")
            if next(SMODS.find_card("j_Unrivaled_fantastic_four")) then
                G.GAME.pool_flags.fantastic_four = true
            end
        end
        if context.setting_blind then
            --print('in context setting blind')
            local current_hand = 0
            card.ability.extra.most_recent_hand = current_hand
            --print('most_recent_hand: '.. card.ability.extra.most_recent_hand)
            return {
                most_recent_hand = current_hand,
                card = card
            }
        end
        if context.before and not context.individual and not context.blueprint 
        and #context.full_hand == card.ability.extra.played_hand_size_threshold then
            card.ability.extra.four = true
            card.ability.extra.shielded = false
            --card.ability.extra.shielded = false
            --print("context.before")
            --print(context)
            --print('context before, Reed')
            for i = 1, #context.scoring_hand do
                --These lines can crash game on debuff boss blinds due to nil
                --print('card i == king: '.. tostring(context.scoring_hand[i]:get_id() == 13))
                --print('card i == spades: '.. tostring(context.scoring_hand[i]:is_suit("Spades"))) 
                if context.scoring_hand[i]:get_id() ~= 4 then
                    card.ability.extra.four = false
                end
            end
            if card.ability.extra.four then
                local voice_line = "Unrivaled_" .. pseudorandom_element(f4_lines, pseudoseed('fantasticfamily'))
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
                --print("returning fantastic")
                card.ability.extra.four = false
                --play_sound("Unrivaled_tremblebeforebast", 1, 2.5)
                return{
                    message_card = card,
                    message =  "Fantastic!",
                    pitch = 1,
                    volume = 2,
                    sound = voice_line
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main and (card.ability.extra.Xmult > 1 or card.ability.extra.chips > 0) then
            return{
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}}.. "chips, " ..
                localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}},
                Xmult_mod = card.ability.extra.Xmult,
                chip_mod = card.ability.extra.chips
            }
        end
        if context.final_scoring_step and #context.full_hand == card.ability.extra.played_hand_size_threshold then
            if G.GAME.selected_back.name == 'Plasma Deck' then
                local current_hand = ((hand_chips + mult) / 2) ^ 2
                --print('in final scoring')
                --print('current_hand: ' .. current_hand)
                --print('blind chips: ' .. G.GAME.blind.chips)
                card.ability.extra.most_recent_hand = current_hand
                return {
                    most_recent_hand = current_hand,
                    card = card
                }
            else
                local current_hand = hand_chips * mult
                --print('in final scoring')
                --print('current_hand: ' .. current_hand)
                --print('blind chips: ' .. G.GAME.blind.chips)
                card.ability.extra.most_recent_hand = current_hand
                return {
                    most_recent_hand = current_hand,
                    card = card
                }
            end
        end
        if context.debuffed_hand and #context.full_hand == card.ability.extra.played_hand_size_threshold then
            --print('in context debuffed hand')
            local current_hand = 0
            card.ability.extra.most_recent_hand = current_hand
            --print('most_recent_hand: '.. card.ability.extra.most_recent_hand)
            return {
                most_recent_hand = current_hand,
                card = card
            }
        end
        if context.Unrivaled_protected then
            print("protected!")
            if not card.ability.extra.shielded then
                card.ability.extra.shielded = true
                return {
                    message = "Shields up!",
                    colour = G.C.CHIPS,
                    pitch = 1,
                    volume = 2,
                    sound = "Unrivaled_shieldsup"
                }
            end
        end
        if context.after and not context.individual and #context.full_hand == card.ability.extra.played_hand_size_threshold then
            local current_hand = card.ability.extra.most_recent_hand
            if current_hand ~= nil then
                print('in context.after, current hand: ' .. current_hand)
            else 
                print('in context.after, current_hand == nil')
            end
            -- TODO: add nil check for naneinf safety
            if card.ability.extra.most_recent_hand ~= nil then
                --print('threshold/100: ' .. (card.ability.extra.threshold/100))
                if card.ability.extra.most_recent_hand / G.GAME.blind.chips > (card.ability.extra.threshold/100) then
                    print("in supernova")
                    local text =  'Four of a Kind'
                    --card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Supernova!"})
                    
                    update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 1}, {handname=localize(text, 'poker_hands'),chips = G.GAME.hands[text].chips, mult = G.GAME.hands[text].mult, level=G.GAME.hands[text].level})
                    level_up_hand(context.blueprint_card or card, text, nil, 2)
                    update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
                    if not context.blueprint then
                        return {
                            card = card,
                            message = "Supernova!",
                            pitch = 1,
                            volume = 2,
                            sound = "Unrivaled_supernova"
                        }
                    end
                end
            end
        end
        if context.selling_self and not context.blueprint then
            G.GAME.pool_flags.fantastic_four = false
            print("flag unchecked")
        end
        if context.getting_sliced and not context.blueprint then
            G.GAME.pool_flags.fantastic_four = false
            print("flag unchecked")
        end
    end,
    in_pool = function(self, card)
        return false
    end
}

--Adam Warlock
SMODS.Joker { 
    key = 'adam_warlock',
    loc_txt = {
        name = "Adam Warlock",
        text = {
            "Prevents Death if at least",
            "{C:attention}#2# {}{C:tarot}Tarot {}cards are used",
            "after obtaining this Joker",
            "{C:red}self destructs{}", 
            "{C:inactive}(Currently {C:attention}#1#{}{C:inactive} Tarot cards used)"
        }
    },
    config = { extra = { tarot_count = 0, tarot_requirement = 5, juiced = false} },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 4, y = 1 },
    cost = 6,
    blueprint_compat = false,
    eternal_compat = false,
    --unlocked = true,
    
    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.tarot_count, card.ability.extra.tarot_requirement, card.ability.extra.juiced} }
    end,
    
    calculate = function(self, card, context)
        local eval = function(card) return (card.ability.extra.tarot_count >= card.ability.extra.tarot_requirement) end
        if context.using_consumeable and context.consumeable.ability.set == "Tarot" and not context.blueprint then
            card.ability.extra.tarot_count = card.ability.extra.tarot_count + 1
            G.E_MANAGER:add_event(Event({
                func = function() card_eval_status_text(card, 'extra', nil, nil, nil, 
                {message = card.ability.extra.tarot_count.."/"..card.ability.extra.tarot_requirement}); return true
                end}))
            if not card.ability.extra.juiced then 
                juice_card_until(card, eval, true)
                card.ability.extra.juiced = eval(card)
            end
            if (card.ability.extra.tarot_count >= card.ability.extra.tarot_requirement) then
                if card.ability.extra.juiced and card.ability.extra.tarot_count > card.ability.extra.tarot_requirement then
                    return {
                        message = localize('k_active_ex'),
                        colour = G.C.FILTER
                    }
                else
                    return {
                        message = localize('k_active_ex'),
                        colour = G.C.FILTER,
                        pitch = 1,
                        volume = 2,
                        sound = "Unrivaled_unlimitedcosmicmight"
                    }
                end
            end
        end
        if context.game_over and card.ability.extra.tarot_count >= card.ability.extra.tarot_requirement and not context.blueprint then
            G.GAME.current_round.usesavedtext = true
			G.GAME.current_round.savedtext = "Saved by Adam Warlock"
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()
                    play_sound('tarot1')
                    card:start_dissolve()
                    return true
                end
            }))         
            return { 
                saved = true,
                message = "Born Again!",
                pitch = 1,
                volume = 2,
                sound = "Unrivaled_bornagain"
        }
        end
    end
}

--Moon Knight
SMODS.Joker {
    key = 'moon_knight',
    loc_txt = {
        name = "Moon Knight",
        text = {
            "If played hand contains exactly",
            "{C:attention}#1#{} cards, contains a {C:attention}Three of a Kind{},",
            "and only contains {C:clubs}Clubs{},",
            "retrigger each card {C:attention}#2#{} times"
        }
    },
    config = { extra = { played_hand_size_threshold = 3 , repetitions = 3, only_clubs = true} },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 5, y = 1 },
    cost = 6,
    blueprint_compat = true, 
    eternal_compat = true,
    --unlocked = true,
    
    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.played_hand_size_threshold, card.ability.extra.repetitions, card.ability.extra.only_clubs} }
    end,
    
    calculate = function(self, card, context)
        if context.before and not context.individual and not context.blueprint then
            card.ability.extra.only_clubs = true
            --print("context: ")
            --print(context)
            print('context before, MK')
            for i = 1, #context.scoring_hand do
                if not context.scoring_hand[i]:is_suit("Clubs") then
                    print("not clubs")
                    card.ability.extra.only_clubs = false
                end
            end
        end
        if context.before and next(context.poker_hands['Three of a Kind']) and 
        #context.full_hand == card.ability.extra.played_hand_size_threshold and card.ability.extra.only_clubs then
            print("returning the moo")
            --play_sound("Unrivaled_tremblebeforebast", 1, 2.5)
            return{
                message_card = card,
                message =  "The Moon haunts you!",
                pitch = 1,
                volume = 2,
                sound = "Unrivaled_themoo"
            }
        end
        -- if context.cardarea == G.play then
        --     print(context.scoring_name)
        --     print("played hand size: ".. #context.full_hand)
        --     print(card.ability.extra.only_clubs)
        -- end
        if context.scoring_name == "Three of a Kind" and 
           #context.full_hand == card.ability.extra.played_hand_size_threshold and 
           context.cardarea == G.play and context.repetition and not context.repetition_only 
           and card.ability.extra.only_clubs then

            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.extra.repetitions,
                card = card
            }
        end
    end
}

--TODO: Playtesting
--Cloak
SMODS.Joker {
    key = 'cloak',
    loc_txt = {
        name = "Cloak",
        text = {
            "{C:green} #3# in #1#{} chance to add",
            "{C:dark_edition}Negative{} to a random joker",
            "upon playing a hand that",
            "only contains {C:spades}Spades{}",
            "{C:red}(not including self){}"
        }
    },
    config = { extra = { neg_prob_denominator = 18 , only_spades = true, flag = false} },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 0, y = 2 },
    cost = 8,
    blueprint_compat = false, 
    eternal_compat = true,
    --unlocked = true,
    
    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.neg_prob_denominator, card.ability.extra.only_spades, G.GAME.probabilities.normal, card.ability.extra.flag} }
    end,
    
    calculate = function(self, card, context)
        if context.card_added and not context.blueprint then
            if context.card.config.center.rarity == "Unrivaled_heroic" then
                -- print("card is joker")
                -- print(context.card.config.center.key)
                if context.card.config.center.key ~= "j_Unrivaled_cloak_and_dagger" then
                    --print("eval call")
                    G.E_MANAGER:add_event(Event({
                        trigger = "after", 
                        --delay = 0.1, 
                        func = function()
                            c_d_eval(context.card, context)
                            return true
                        end
                    }))
                end
            end
        end
        if context.before and not context.individual and not context.blueprint then
            card.ability.extra.only_spades = true
            --print("context: ")
            --print(context)
            print('context before, Cloak')
            for i = 1, #context.scoring_hand do
                if not context.scoring_hand[i]:is_suit("Spades") then
                    print("not spades")
                    card.ability.extra.only_spades = false
                end
            end
        end
        if context.after and card.ability.extra.only_spades then
            local eligible_strength_jokers = {}
            print("check jokers")
            --play_sound("Unrivaled_tremblebeforebast", 1, 2.5)
            for k, v in pairs(G.jokers.cards) do
                if v.ability.set == 'Joker' and (not v.edition) and v ~= card then
                    table.insert(eligible_strength_jokers, v)
                end
            end
            if next(eligible_strength_jokers) then 
                print("check prob")
                local eligible_card = pseudorandom_element(eligible_strength_jokers, pseudoseed("darkforce"))
                if pseudorandom("darkforce") <= (G.GAME.probabilities.normal / card.ability.extra.neg_prob_denominator) then 
                    local voice_line = "Unrivaled_"..pseudorandom_element(cloak_success_lines, pseudoseed("darkfoce"))
                    G.E_MANAGER:add_event(Event({
                        trigger = "after", 
                        --delay = 0.1, 
                        func = function()
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Hidden!"})
                            card:juice_up(0.3, 0.5)
                            play_sound(voice_line, 1, 2)
                            eligible_card:set_edition({negative = true}, true)
                            return true end 
                    }))
                else 
                    local voice_line = "Unrivaled_"..pseudorandom_element(cloak_fail_lines, pseudoseed("darkfoce"))
                    return{
                        message_card = card,
                        message =  "Nope!",
                        pitch = 1,
                        volume = 2,
                        sound = voice_line
                    }
                end
            end
        end
        -- if context.cardarea == G.play then
        --     print(context.scoring_name)
        --     print("played hand size: ".. #context.full_hand)
        --     print(card.ability.extra.only_clubs)
        -- end
    end
}

--TODO: Playtesting 
--Dagger
SMODS.Joker {
    key = 'dagger',
    loc_txt = {
        name = "Dagger",
        text = {
            "{C:green}#2# in #1#{} chance for",
            "scored cards with {C:clubs}Club{} suit to", 
            "become {C:dark_edition}Polychrome{}"
        }
    },
    config = { extra = { poly_prob_denominator = 4 , flag = false} },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 1, y = 2 },
    cost = 8,
    blueprint_compat = false, 
    eternal_compat = true,
    --unlocked = true,
    
    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.poly_prob_denominator, G.GAME.probabilities.normal, card.ability.extra.flag} }
    end,
    
    calculate = function(self, card, context)
        if context.card_added and not context.blueprint then
            if context.card.config.center.rarity == "Unrivaled_heroic" then
                -- print("card is joker")
                -- print(context.card.config.center.key)
                if context.card.config.center.key ~= "j_Unrivaled_cloak_and_dagger" then
                    --print("eval call")
                    G.E_MANAGER:add_event(Event({
                        trigger = "after", 
                        --delay = 0.1, 
                        func = function()
                            c_d_eval(context.card, context)
                            return true
                        end
                    }))
                end
            end
        end
        if context.before and not context.individual and not context.blueprint then
            local proc = false
            --print("context: ")
            --print(context)
            print('context before, Dagger')
            local cards = {}
            for k, v in ipairs(context.scoring_hand) do
                if v:is_suit("Clubs") and pseudorandom("lightforce") <= (G.GAME.probabilities.normal / card.ability.extra.poly_prob_denominator) then
                    proc = true
                    cards[#cards+1] = v
                    v:set_edition('e_polychrome', true, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    })) 
                end
            end
            if proc then
                local voice_line = "Unrivaled_" .. pseudorandom_element(dagger_lines, pseudoseed('lightforce'))
                return {
                    message = "Shine!",
                    colour = G.C.CHIPS,
                    card = card,
                    pitch = 1,
                    volume = 2,
                    sound = voice_line
                }
            end
        end
    end
}

--TODO: Playtesting
--Cloak & Dagger
SMODS.Joker {
    key = 'cloak_and_dagger',
    loc_txt = {
        name = "Cloak & Dagger",
        text = {
            "If played hand contains a",
            "{C:attention}Full House{} and only contains {C:clubs}Clubs{}",
            "or {C:spades}Spades{}, {C:green}#3# in #1#{} chance to",
            "add {C:dark_edition}Negative{} to a random joker and",
            "scored cards with {C:clubs}Club{} suit have",
            "a {C:green}#3# in #2#{} chance to become {C:dark_edition}Polychrome{}"
        }
    },
    config = { extra = { neg_prob_denominator = 9, poly_prob_denominator = 2 , flag = false, only_s_and_c = true, contains_hand = false} },
    rarity = "Unrivaled_heroic",
    atlas = 'Unrivaled',
    pos = { x = 2, y = 2 },
    cost = 16,
    blueprint_compat = false, 
    eternal_compat = true,
    --unlocked = true,
    
    loc_vars =  function(self, info_queue, card)
        return { vars = {card.ability.extra.neg_prob_denominator, card.ability.extra.poly_prob_denominator, G.GAME.probabilities.normal, card.ability.extra.flag, card.ability.extra.only_s_and_c, card.ability.extra.contains_hand} }
    end,
    
    calculate = function(self, card, context)
        if context.before and not context.individual and not context.blueprint then
            card.ability.extra.only_s_and_c = true
            card.ability.extra.contains_hand = false
            --print("context: ")
            --print(context)
            print('context before, Cloak')
            for i = 1, #context.scoring_hand do
                if not context.scoring_hand[i]:is_suit("Spades") or not context.scoring_hand[i]:is_suit("Clubs") then
                    print("not spades/clubs")
                    card.ability.extra.only_s_and_c = false
                end
            end
            if next(context.poker_hands['Full House']) then
                card.ability.extra.contains_hand = true
                local proc = false
                --print("context: ")
                --print(context)
                print('context before, C&D')
                local cards = {}
                for k, v in ipairs(context.scoring_hand) do
                    if (v:is_suit("Clubs") or v:is_suit("Spades")) and pseudorandom("lightforce") <= (G.GAME.probabilities.normal / card.ability.extra.poly_prob_denominator) then
                        proc = true
                        cards[#cards+1] = v
                        v:set_edition('e_polychrome', true, true)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                v:juice_up()
                                return true
                            end
                        })) 
                    end
                end
                if proc then
                    local voice_line = "Unrivaled_" .. pseudorandom_element(dagger_lines, pseudoseed('lightforce'))
                    return {
                        message = "Shine!",
                        colour = G.C.CHIPS,
                        card = card,
                        pitch = 1,
                        volume = 2,
                        sound = voice_line
                    }
                end
            end    
        end
        if context.after and card.ability.extra.only_s_and_c and card.ability.extra.contains_hand then
            local eligible_strength_jokers = {}
            print("check jokers")
            --play_sound("Unrivaled_tremblebeforebast", 1, 2.5)
            for k, v in pairs(G.jokers.cards) do
                if v.ability.set == 'Joker' and (not v.edition) and v ~= card then
                    table.insert(eligible_strength_jokers, v)
                end
            end
            if next(eligible_strength_jokers) then 
                print("check prob")
                local eligible_card = pseudorandom_element(eligible_strength_jokers, pseudoseed("darkforce"))
                if pseudorandom("darkforce") <= (G.GAME.probabilities.normal / card.ability.extra.neg_prob_denominator) then 
                    local voice_line = "Unrivaled_"..pseudorandom_element(cloak_success_lines, pseudoseed("darkfoce"))
                    G.E_MANAGER:add_event(Event({
                        trigger = "after", 
                        --delay = 0.1, 
                        func = function()
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Hidden!"})
                            card:juice_up(0.3, 0.5)
                            play_sound(voice_line, 1, 2)
                            eligible_card:set_edition({negative = true}, true)
                            return true end 
                    }))
                else 
                    local voice_line = "Unrivaled_"..pseudorandom_element(cloak_fail_lines, pseudoseed("darkfoce"))
                    return{
                        message_card = card,
                        message =  "Nope!",
                        pitch = 1,
                        volume = 2,
                        sound = voice_line
                    }
                end
            end
        end
    end,
    in_pool = function(self, card)
        return false
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