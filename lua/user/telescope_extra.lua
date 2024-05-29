
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

M.live_grep_qflist = function()
  local qflist = vim.fn.getqflist()
	local filetable = {}
	local hashlist = {}

	for _, value in pairs(qflist) do
		local name = vim.api.nvim_buf_get_name(value.bufnr)

		if not hashlist[name] then
			hashlist[name] = true
			table.insert(filetable, name)
		end
	end

	require("telescope.builtin").live_grep({ search_dirs = filetable })
end

return M
