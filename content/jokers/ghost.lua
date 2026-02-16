SMODS.Joker {
  key = "ghost",
  atlas = "jokers",
  pos = { x = 1, y = 4 },

  draw = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
    end
  end,

  config = { extra = { current_xmult = 1, added_xmult = 0.1, sold_this_round = false } },
  rarity = 3,
  cost = 10,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "she_her",

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.current_xmult, card.ability.extra.added_xmult } }
  end,

  calculate = function(self, card, context)
    if context.other_consumeable and context.other_consumeable.ability.set == "Tarot" and card.ability.extra.current_xmult > 1 then
      return { xmult = card.ability.extra.current_xmult }
    end

    if context.selling_card and context.card.config.center.set == "Tarot" and card.ability.extra.current_xmult > 1 and not context.blueprint then
      card.ability.extra.current_xmult = 1
      card.ability.extra.sold_this_round = true
      return { message = localize("k_reset"), colour = G.C.RED }
    end

    if context.end_of_round and not context.individual and not context.repetition and not context.game_over and not context.blueprint then
      if card.ability.extra.sold_this_round then
        card.ability.extra.sold_this_round = false
      else
        card.ability.extra.current_xmult = card.ability.extra.current_xmult + card.ability.extra.added_xmult
        return { message = localize("k_upgrade_ex") }
      end
    end
  end
}
