return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = import.config(function(use)
    local ok, alpha, dashboard = use({ "alpha", "alpha.themes.dashboard" })

    if ok then
      dashboard.section.header.val = {
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[       ████████╗███████╗ ██████╗██╗  ██╗██╗   ██╗██╗███╗   ███╗        ]],
        [[       ╚══██╔══╝██╔════╝██╔════╝██║  ██║██║   ██║██║████╗ ████║        ]],
        [[          ██║   █████╗  ██║     ███████║██║   ██║██║██╔████╔██║        ]],
        [[          ██║   ██╔══╝  ██║     ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║        ]],
        [[          ██║   ███████╗╚██████╗██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║        ]],
        [[          ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝        ]],
        [[                                                                       ]],
      }

      dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)
    end
  end),
}