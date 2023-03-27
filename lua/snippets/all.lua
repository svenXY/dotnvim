local ls = require "luasnip"
local types = require "luasnip.util.types"

-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

local function dates(_,_,format) return {os.date(format)} end

local snippets = {

snip({
  trig = "dts",
  name = "Date",
  dscr = "Date in different formats",
}, {
    choice(1, {
      func(dates, {}, { user_args = {'%Y-%m-%d'}}),
      func(dates, {}, { user_args = {'%Y-%m-%d %H:%M'}}),
      func(dates, {}, { user_args = {'%Y%m%dT%H:%M'}}),
      func(dates, {}, { user_args = {'%d.%m.%Y'}}),
      func(dates, {}, { user_args = {'%d.%m.%Y %H:%M'}}),
    }),
    insert(0, '')
  }),

snip({
  trig = "svh",
  name = "Sven",
  dscr = "Name in different formats",
}, {
    dynamicn(1, function()
      local lines = require('../user/svh-util').lines_from(os.getenv('HOME') .. '/snippets_private.txt')
      local d = {}
      for _, t in ipairs(lines) do
        table.insert(d, text(t))
      end
      return node(nil, {choice(1, d)})
    end),
    insert(0, '')
  })
}

return snippets
