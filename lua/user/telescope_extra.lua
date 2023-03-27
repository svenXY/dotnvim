
local M = {}
M.grep_buffer = function()
  require("telescope.builtin").current_buffer_fuzzy_find(
    require('telescope.themes').get_dropdown(
      {
        --[[ previewer = false, ]]
        prompt_title = "< GrepCurrentBuffer >",
        layout_config={width=0.8, height=0.5},
      }
    )
  )
end

M.grep_wiki = function()
  require("telescope.builtin").live_grep({
    prompt_title = "< VimWiki >",
    cwd = '~/vimwiki',
    hidden = true,
  })
end
--
-- M.git_branches = function()
--     require("telescope.builtin").git_branches({
--         attach_mappings = function(_, map)
--             map("i", "<c-d>", actions.git_delete_branch)
--             map("n", "<c-d>", actions.git_delete_branch)
--             return true
--         end,
--     })
-- end
--
--
return M
