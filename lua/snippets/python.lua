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


local snippets = {
  snip({
    trig = "ic",
    name = "icecream call",
    dscr = "Call ic() and ignore the type error",
  },
    {
      text({'ic('}),
      insert(1, "expression"),
      text({') # type: ignore'}),
      insert(0, '')
    }
  ),

}

return snippets
