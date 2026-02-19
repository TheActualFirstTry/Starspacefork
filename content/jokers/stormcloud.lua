SMODS.Joker {
  key = "stormcloud",
  atlas = "jokers",
  pos = { x = 7, y = 2 },
  config = { extra = { xchips = 2, triggered = false } },
  rarity = 2,
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xchips } }
  end,

  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands["star_flash"]) and not card.ability.extra.triggered then
      card.ability.extra.triggered = true
      return { xchips = card.ability.extra.xchips }
    end

    if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
      card.ability.extra.triggered = false
    end
  end
}
