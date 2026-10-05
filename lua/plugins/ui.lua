return {
  {
    "folke/which-key.nvim",
    opts = {
      win = {
        border = "single",
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline_popup", -- or "cmdline_popup"
      },
      views = {
        cmdline_popup = {
          border = {
            style = "single", -- try "none", "single", "double"
          },
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = vim.tbl_deep_extend("force", opts.dashboard or {}, {
        preset = {
          keys = {
            {
              icon = "🐱 ",
              key = "l",
              desc = "LazyVim",
              action = function()
                vim.cmd("Lazy")
              end,
            },
            {
              icon = "😼 ",
              key = "x",
              desc = "LazyVim Extras",
              action = function()
                vim.cmd("LazyExtras")
              end,
            },
            {
              icon = "🔧 ",
              key = "c",
              desc = "Config",
              action = function()
                Snacks.dashboard.pick("files", { cwd = vim.fn.stdpath("config") })
              end,
            },
            {
              icon = "🌘 ",
              key = "q",
              desc = "Quit",
              action = function()
                vim.cmd("qa")
              end,
            },
          },
        },
        sections = {
          {
            type = "text",
            text = [[
  ▄▄▄▄▄▄▄                                                     ▄▄ ▄▄                                       
 █▀▀██▀▀▀▀ █▄               █▄                     █▄          ██ ██                                      
    ██     ██    ▀▀        ▄██▄                    ██          ██ ██                                      
    ██     ████▄ ██ ▄██▀█   ██ ▄███▄ ▄███▄   ▄██▀█ ████▄ ▄▀▀█▄ ██ ██   ████▄ ▄▀▀█▄ ▄██▀█ ▄██▀█            
    ██     ██ ██ ██ ▀███▄   ██ ██ ██ ██ ██   ▀███▄ ██ ██ ▄█▀██ ██ ██   ██ ██ ▄█▀██ ▀███▄ ▀███▄            
    ▀██▄  ▄██ ██▄███▄▄██▀  ▄██▄▀███▀▄▀███▀  █▄▄██▀▄██ ██▄▀█▄██▄██▄██  ▄████▀▄▀█▄███▄▄██▀█▄▄██▀ ██  ██  ██ 
                                                                       ██                                 
                                                                       ▀                                  
]],
            hl = "Comment",
            padding = 1,
          },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      })

      return opts
    end,
  },
}
