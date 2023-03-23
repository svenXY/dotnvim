return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufRead",
  config = function()
    local status_ok, ib = pcall(require, "indent_blankline")
    if not status_ok then
      return
    end

    -- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
    vim.wo.colorcolumn = "99999"

    ib.setup({
      show_current_context = true,
      buftype_exclude = { "terminal", "nofile" },
      filetype_exclude = {
        "help",
        "startify",
        "dashboard",
        "packer",
        "neogitstatus",
        "neo-tree",
        "Trouble",
      },
      char = "▏",
      show_trailing_blankline_indent = false,
      show_first_indent_level = true,
      use_treesitter = true,
      context_patterns = {
        "class",
        "return",
        "function",
        "method",
        "^if",
        "^while",
        "jsx_element",
        "^for",
        "^object",
        "^table",
        "block",
        "arguments",
        "if_statement",
        "else_clause",
        "jsx_element",
        "jsx_self_closing_element",
        "try_statement",
        "catch_clause",
        "import_statement",
        "operation_type",
      }
    })
  end
}
