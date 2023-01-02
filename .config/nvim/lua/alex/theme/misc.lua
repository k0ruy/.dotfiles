--------------
-- Material --
--------------

require 'material' .setup({

    contrast = {
        terminal = false, -- Enable contrast for the built-in terminal
        sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = false, -- Enable contrast for floating windows
        cursor_line = false, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable darker background for non-current windows
        filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
    },

    styles = { -- Give comments style such as bold, italic, underline etc.
        comments = { --[[ italic = true ]] },
        strings = { --[[ bold = true ]] },
        keywords = { --[[ underline = true ]] },
        functions = { --[[ bold = true, undercurl = true ]] },
        variables = {},
        operators = {},
        types = {},
    },

    plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
        "dashboard",
        "gitsigns",
        -- "hop",
        "indent-blankline",
        "lspsaga",
        -- "mini",
        -- "neogit",
        "nvim-cmp",
        -- "nvim-navic",
        "nvim-tree",
        "nvim-web-devicons",
        -- "sneak",
        "telescope",
        "trouble",
        "which-key",
    },

    disable = {
        colored_cursor = false, -- Disable the colored cursor
        borders = false, -- Disable borders between verticaly split windows
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false -- Hide the end-of-buffer lines
    },

    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false -- Enable higher contrast text for darker style
    },

    lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

    custom_colors = nil, -- If you want to everride the default colors, set this to a function

    custom_highlights = {}, -- Overwrite highlights with your own
})

vim.g.material_style = "darker"

----------
-- Edge --
----------

vim.g.edge_style = 'default'
vim.g.edge_dim_foreground = 0
vim.g.edge_better_performance = 1
-- vim.cmd 'colorscheme edge'

----------------
-- LSP colors --
----------------

-- Tries to set missing LSP colors.
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

----------------
-- Catppuccin --
----------------

-- latte, frappe, macchiato, mocha
vim.g.catppuccin_flavour = 'mocha'
require 'catppuccin' .setup {
    integrations = {
        gitsigns = true,
        leap = true,
        telescope = true,
        which_key = true,
        notify = true,
        treesitter_context = true,
    }
}

----------------
-- Everforest --
----------------

vim.g.everforest_background = 'hard'
vim.cmd 'set background =dark'
vim.g.everforest_better_performance = 1
