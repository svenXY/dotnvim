return {
  "L3MON4D3/LuaSnip", --snippet engine
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets", -- a bunch of snippets to use
      "avneesh0612/react-nextjs-snippets", -- react snippets
    },
  config = function()

    local ls = require "luasnip"
    local types = require "luasnip.util.types"

    ls.config.set_config ({
      -- This tells LuaSnip to remember to keep around the last snippet.
      -- You can jump back into it even if you move outside of the selection
      history = true,

      -- This one is cool cause if you have dynamic snippets, it updates as you type!
      updateevents = "TextChanged,TextChangedI",

      -- Autosnippets:
      enable_autosnippets = true,

      -- Crazy highlights!!
      -- #vid3
      -- ext_opts = nil,
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { " <- Current Choice", "NonTest" } },
          },
        },
      },
    })

    -- <c-k> is my expansion key
    -- this will expand the current item or jump to the next item within the snippet.
    vim.keymap.set({ "i", "s" }, "<c-k>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    -- <c-j> is my jump backwards key.
    -- this always moves to the previous item within the snippet
    vim.keymap.set({ "i", "s" }, "<c-j>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })

    -- <c-l> is selecting within a list of options.
    -- This is useful for choice nodes (introduced in the forthcoming episode 2)
    vim.keymap.set("i", "<c-l>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end)

    vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")
    vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/user/luasnips.lua<CR>")

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

    ls.add_snippets(nil, {
        all = {
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
          }),
      },
      python = {
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
      },
    })


    require("luasnip/loaders/from_vscode").lazy_load()
    require("luasnip").filetype_extend("vimwiki", {"markdown"})
  end
}
