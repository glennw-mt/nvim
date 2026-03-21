return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = false,
        virtual_lines = true,
      })
    end,
  },
}
