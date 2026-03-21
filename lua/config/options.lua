vim.opt.winborder = "single"

vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.diagnostic.config({
      virtual_text = false,
      signs = false,
      underline = true,
      virtual_lines = true,
    })
  end,
})
