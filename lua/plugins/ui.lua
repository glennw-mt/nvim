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
              icon = "📂 ",
              key = "f",
              desc = "File Manager (Yazi)",
              action = function()
                vim.cmd("Yazi")
              end,
            },
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
            text = [[ _____ _     _       _                    _           _ _                             
|_   _| |   (_)     | |                  | |         | | |                            
  | | | |__  _ ___  | |_ ___   ___    ___| |__   __ _| | |  _ __   __ _ ___ ___       
  | | | '_ \| / __| | __/ _ \ / _ \  / __| '_ \ / _` | | | | '_ \ / _` / __/ __|      
  | | | | | | \__ \ | || (_) | (_) | \__ \ | | | (_| | | | | |_) | (_| \__ \__ \_ _ _ 
  \_/ |_| |_|_|___/  \__\___/ \___/  |___/_| |_|\__,_|_|_| | .__/ \__,_|___/___(_|_|_)
                                                           | |                        
                                                           |_|                        ]],
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
