require("kienanana")

vim.opt.cursorline = true

-- local palette = {
--   bright = "#f9e2af", -- general high-contrast UI color
--   cursor = "#00cc66", -- current line number
-- }

-- local function apply_overrides()
--   -- Comments
--   vim.api.nvim_set_hl(0, "Comment", { fg = palette.bright, italic = true })
--   vim.api.nvim_set_hl(0, "@comment", { fg = palette.bright, italic = true })

--   -- Line numbers
--   vim.api.nvim_set_hl(0, "LineNr", { fg = palette.bright })
--   vim.api.nvim_set_hl(0, "LineNrAbove", { fg = palette.bright })
--   vim.api.nvim_set_hl(0, "LineNrBelow", { fg = palette.bright })

--   -- Current cursor line number (distinct + pops)
--   vim.api.nvim_set_hl(0, "CursorLineNr", {
--     fg = palette.cursor,
--     bold = true,
--   })

--   -- Splits / separators
--   vim.api.nvim_set_hl(0, "VertSplit", { fg = palette.bright })
--   vim.api.nvim_set_hl(0, "WinSeparator", { fg = palette.bright })

--   -- Snacks indent / scope guides
--   vim.api.nvim_set_hl(0, "SnacksIndent", {
--     fg = palette.bright,
--     nocombine = true,
--   })

--   vim.api.nvim_set_hl(0, "SnacksIndentScope", {
--     fg = palette.bright,
--     bold = true,
--     nocombine = true,
--   })
-- end

-- -- Apply immediately
-- apply_overrides()

-- -- Re-apply on colorscheme reload
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = apply_overrides,
-- })

