return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = vim.tbl_deep_extend("force", opts.dashboard or {}, {
        preset = {
          keys = {
            {
              icon = "🗃 ",
              key = "f",
              desc = "File Manager (Yazi)",
              action = function()
                vim.cmd("Yazi")
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
