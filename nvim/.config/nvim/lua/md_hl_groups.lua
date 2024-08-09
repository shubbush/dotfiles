print("Loading custom hl-groups for Markdown")
local bear_red = '#D24545'
local header_fg = '#424242'
local fg = '#575757'
local grey = '#DBDBDB'

vim.api.nvim_set_hl(0, "@MdHeaderMarker", { fg = grey, bold = true, nocombine = true })
vim.api.nvim_set_hl(0, "@MdHeaderContent", { fg = header_fg, bold = true, nocombine = true })
vim.api.nvim_set_hl(0, "@MdListItemMarker", { fg = bear_red })
vim.api.nvim_set_hl(0, "@MdQuoteHighlight", { fg = bear_red })
vim.api.nvim_set_hl(0, "@MdRenderListBullet", { fg = bear_red })
vim.api.nvim_set_hl(0, "@MdBlockQuote", { fg = '#3b3b3b' })
vim.api.nvim_set_hl(0, "@MdBlockQuoteMarker", { fg = bear_red })
vim.api.nvim_set_hl(0, "@MdLinkText", { fg = bear_red })
vim.api.nvim_set_hl(0, "@MdLink", { fg = grey, nocombine = true })
