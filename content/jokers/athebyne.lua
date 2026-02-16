SMODS.Joker {
  key = "athebyne",
  atlas = "jokers",
  pos = { x = 0, y = 7 },
  rarity = 3,
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "it_its",

  calculate = function(self, card, context)
    if context.before and next(context.poker_hands["Two Pair"]) then
      return { level_up = true, message = localize('k_level_up_ex') }
    end
  end
}
