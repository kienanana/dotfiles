return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
        require('kanagawa').setup({
            compile = false,
            undercurl = true,
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = true,
            dimInactive = false,
            terminalColors = true,
            colors = {
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    -- Transparency
                    Normal = { bg = "none" },
                    NormalFloat = { bg = "none" },
                    NormalNC = { bg = "none" },
                    SignColumn = { bg = "none" },
                    LineNr = { bg = "none" },
                    
                    -- Custom cursor line number - set both fg and bg explicitly
                    CursorLineNr = { fg = "#00cc66", bg = "none", bold = true },
                }
            end,
            theme = "wave",
            background = {
                dark = "wave",
                light = "lotus"
            },
        })
        
        vim.cmd("colorscheme kanagawa")
        
        -- Force the highlight after colorscheme loads
        vim.cmd([[highlight CursorLineNr guifg=#00cc66 guibg=none gui=bold]])
    end,
}