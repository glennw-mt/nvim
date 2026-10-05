return {
  "voldikss/vim-floaterm",
  init = function()
    vim.g.floaterm_height = 0.9
    vim.g.floaterm_width = 0.9
  end,
  config = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "FloatermOpen",
      callback = function()
        vim.api.nvim_win_set_config(0, {
          border = "solid",
        })
      end,
    })
  end,
  keys = {
    {
      "<C-/>",
      "<cmd>FloatermToggle<cr>",
      mode = { "n", "t" },
    },
  },
}
