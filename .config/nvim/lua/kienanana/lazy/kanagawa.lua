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
            transparent = true,  -- Changed to true!
            dimInactive = false,
            terminalColors = true,
            colors = {
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides = function(colors)
                return {
                    -- Keep your custom cursor line number color
                    CursorLineNr = { fg = "#00cc66", bold = true },
                    -- Make these transparent too
                    Normal = { bg = "none" },
                    NormalFloat = { bg = "none" },
                    NormalNC = { bg = "none" },
                    SignColumn = { bg = "none" },
                    LineNr = { bg = "none" },
                }
            end,
            theme = "wave",
            background = {
                dark = "wave",
                light = "lotus"
            },
        })
        
        vim.cmd("colorscheme kanagawa")
    end,
}