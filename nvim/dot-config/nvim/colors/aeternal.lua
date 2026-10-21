vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "aeternal"

-- Osaka Jade (Omarchy) palette. Comments give the original names.
-- b_ = bright, dk = dark, dkr = darker, lt = lighter/light.
local p = {
  -- Core
  bg     = "#111C18", -- background / color0
  fg     = "#C1C497", -- foreground / color7
  acc    = "#509475", -- accent (same value as blue)
  sel    = "#32473B", -- selection background
  mute   = "#53685B", -- muted / color8

  -- Colours
  red    = "#FF5345", -- red / color1
  org    = "#A2734B", -- orange
  yel    = "#459451", -- yellow / color3
  grn    = "#549E6A", -- green / color2
  cyn    = "#2DD5B7", -- cyan / color6
  blu    = "#509475", -- blue / color4
  mag    = "#D2689C", -- magenta / color5
  brn    = "#513925", -- brown

  -- Bright colours
  b_red  = "#DB9F9C", -- bright red / color9
  b_yel  = "#E5C736", -- bright yellow / color11
  b_grn  = "#63B07A", -- bright green / color10
  b_cyn  = "#8CD3CB", -- bright cyan / color14
  b_blu  = "#ACD4CF", -- bright blue / color12
  b_mag  = "#75BBB3", -- bright magenta / color13

  -- Background and foreground variants
  bg_dkr = "#090F0D", -- darker background
  bg_dk  = "#0C1512", -- dark background
  bg_lt  = "#23372B", -- lighter background
  fg_dk  = "#81B8A8", -- dark foreground
  fg_lt  = "#D6D5BC", -- light foreground
  b_fg   = "#F7E8B2", -- bright foreground / color15, cursor
}

local highlights = {
  -- Editor UI
  Normal       = { fg = p.fg, bg = p.bg },
  NormalFloat  = { fg = p.fg, bg = p.bg_lt },
  FloatBorder  = { fg = p.acc, bg = p.bg_lt },
  FloatTitle   = { fg = p.cyn, bg = p.bg_lt, bold = true },
  Cursor       = { fg = p.bg, bg = p.b_fg },
  lCursor      = { link = "Cursor" },
  CursorIM     = { link = "Cursor" },
  CursorLine   = { bg = p.bg_lt },
  CursorColumn = { bg = p.bg_lt },
  ColorColumn  = { bg = p.bg_lt },
  CursorLineNr = { fg = p.b_grn, bold = true },
  LineNr       = { fg = p.mute },
  SignColumn   = { bg = p.bg },
  FoldColumn   = { fg = p.mute, bg = p.bg },
  Folded       = { fg = p.mute, bg = p.bg_lt },
  EndOfBuffer  = { fg = p.bg },
  NonText      = { fg = p.mute },
  Whitespace   = { fg = p.sel },
  SpecialKey   = { fg = p.mute },
  Conceal      = { fg = p.mute },
  WinSeparator = { fg = p.mute },
  Visual       = { fg = p.b_fg, bg = p.sel },
  VisualNOS    = { bg = p.sel },
  Search       = { fg = p.bg, bg = p.b_yel },
  IncSearch    = { fg = p.bg, bg = p.cyn },
  CurSearch    = { link = "IncSearch" },
  Substitute   = { fg = p.bg, bg = p.b_red },
  MatchParen   = { fg = p.b_fg, bg = p.sel, bold = true },
  QuickFixLine = { bg = p.sel, bold = true },
  Directory    = { fg = p.b_blu },
  Title        = { fg = p.cyn, bold = true },
  ErrorMsg     = { fg = p.red },
  WarningMsg   = { fg = p.b_yel },
  ModeMsg      = { fg = p.b_grn, bold = true },
  MoreMsg      = { fg = p.grn },
  Question     = { fg = p.grn },
  StatusLine   = { fg = p.fg_lt, bg = p.sel },
  StatusLineNC = { fg = p.fg_dk, bg = p.bg_dk },
  TabLine      = { fg = p.fg_dk, bg = p.bg_dk },
  TabLineSel   = { fg = p.fg_lt, bg = p.bg, bold = true },
  TabLineFill  = { bg = p.bg_dkr },
  Pmenu        = { fg = p.fg, bg = p.bg_lt },
  PmenuSel     = { fg = p.b_fg, bg = p.sel },
  PmenuSbar    = { bg = p.sel },
  PmenuThumb   = { bg = p.acc },
  WildMenu     = { link = "PmenuSel" },

  -- Syntax
  Comment        = { fg = p.mute, italic = true },
  Constant       = { fg = p.mag },
  String         = { fg = p.b_grn },
  Character      = { link = "String" },
  Number         = { fg = p.org },
  Boolean        = { fg = p.org },
  Float          = { link = "Number" },
  Identifier     = { fg = p.fg },
  Function       = { fg = p.cyn },
  Statement      = { fg = p.blu },
  Conditional    = { link = "Statement" },
  Repeat         = { link = "Statement" },
  Label          = { fg = p.yel },
  Operator       = { fg = p.b_cyn },
  Keyword        = { fg = p.blu },
  Exception      = { fg = p.b_red },
  PreProc        = { fg = p.b_mag },
  Include        = { link = "PreProc" },
  Define         = { link = "PreProc" },
  Macro          = { link = "PreProc" },
  PreCondit      = { link = "PreProc" },
  Type           = { fg = p.b_yel },
  StorageClass   = { link = "Type" },
  Structure      = { link = "Type" },
  Typedef        = { link = "Type" },
  Special        = { fg = p.b_cyn },
  SpecialChar    = { link = "Special" },
  Tag            = { link = "Special" },
  SpecialComment = { link = "Special" },
  Debug          = { link = "Special" },
  Delimiter      = { fg = p.mute },
  Underlined     = { fg = p.b_blu, underline = true },
  Todo           = { fg = p.bg, bg = p.b_yel, bold = true },
  Error          = { fg = p.red },

  -- Treesitter
  ["@variable"]           = { fg = p.fg },
  ["@variable.builtin"]   = { fg = p.b_red },
  ["@variable.parameter"] = { fg = p.fg_dk },
  ["@variable.member"]    = { fg = p.b_blu },
  ["@property"]           = { fg = p.b_blu },
  ["@module"]             = { fg = p.b_cyn },
  ["@constant"]           = { link = "Constant" },
  ["@constant.builtin"]   = { fg = p.b_mag },
  ["@type.builtin"]       = { link = "Type" },
  ["@constructor"]        = { fg = p.b_yel },
  ["@function.builtin"]   = { fg = p.cyn, italic = true },
  ["@function.call"]      = { link = "Function" },
  ["@keyword.import"]     = { fg = p.b_mag },
  ["@string.escape"]      = { fg = p.b_cyn },
  ["@string.regexp"]      = { fg = p.cyn },
  ["@punctuation"]        = { fg = p.mute },
  ["@tag"]                = { fg = p.yel },
  ["@tag.attribute"]      = { fg = p.b_yel },
  ["@tag.delimiter"]      = { fg = p.mute },

  -- Treesitter: markup (Markdown etc.)
  ["@markup.heading"]       = { fg = p.cyn, bold = true },
  ["@markup.strong"]        = { bold = true },
  ["@markup.italic"]        = { italic = true },
  ["@markup.strikethrough"] = { strikethrough = true },
  ["@markup.underline"]     = { underline = true },
  ["@markup.link"]          = { fg = p.b_blu },
  ["@markup.link.url"]      = { fg = p.b_blu, underline = true },
  ["@markup.link.label"]    = { fg = p.b_cyn },
  ["@markup.raw"]           = { fg = p.b_grn },
  ["@markup.list"]          = { fg = p.b_cyn },
  ["@markup.quote"]         = { fg = p.fg_dk, italic = true },

  -- Treesitter: diff
  ["@diff.plus"]  = { link = "Added" },
  ["@diff.minus"] = { link = "Removed" },
  ["@diff.delta"] = { link = "Changed" },

  -- LSP
  LspReferenceText  = { bg = p.sel },
  LspReferenceRead  = { bg = p.sel },
  LspReferenceWrite = { bg = p.sel, bold = true },
  LspInlayHint      = { fg = p.mute, bg = p.bg_lt },
  LspCodeLens       = { fg = p.mute },

  -- Diagnostics
  DiagnosticError            = { fg = p.red },
  DiagnosticWarn             = { fg = p.b_yel },
  DiagnosticInfo             = { fg = p.cyn },
  DiagnosticHint             = { fg = p.b_mag },
  DiagnosticOk               = { fg = p.b_grn },
  DiagnosticUnnecessary      = { link = "Comment" },
  DiagnosticUnderlineError   = { undercurl = true, sp = p.red },
  DiagnosticUnderlineWarn    = { undercurl = true, sp = p.b_yel },
  DiagnosticUnderlineInfo    = { undercurl = true, sp = p.cyn },
  DiagnosticUnderlineHint    = { undercurl = true, sp = p.b_mag },
  DiagnosticUnderlineOk      = { undercurl = true, sp = p.b_grn },
  DiagnosticVirtualTextError = { fg = p.red, bg = p.bg_dk },
  DiagnosticVirtualTextWarn  = { fg = p.b_yel, bg = p.bg_dk },
  DiagnosticVirtualTextInfo  = { fg = p.cyn, bg = p.bg_dk },
  DiagnosticVirtualTextHint  = { fg = p.b_mag, bg = p.bg_dk },
  DiagnosticVirtualTextOk    = { fg = p.b_grn, bg = p.bg_dk },

  -- Diff
  DiffAdd    = { fg = p.grn, bg = p.bg_lt },
  DiffChange = { bg = p.brn },
  DiffDelete = { fg = p.red, bg = p.bg_dk },
  DiffText   = { fg = p.b_yel, bg = p.brn, bold = true },
  Added      = { fg = p.grn },
  Changed    = { fg = p.b_yel },
  Removed    = { fg = p.red },

  -- Spelling
  SpellBad   = { undercurl = true, sp = p.red },
  SpellCap   = { undercurl = true, sp = p.b_yel },
  SpellLocal = { undercurl = true, sp = p.cyn },
  SpellRare  = { undercurl = true, sp = p.b_mag },
}


for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

-- Terminal colors (color0-15)
vim.g.terminal_color_0 = p.bg
vim.g.terminal_color_1 = p.red
vim.g.terminal_color_2 = p.grn
vim.g.terminal_color_3 = p.yel
vim.g.terminal_color_4 = p.blu
vim.g.terminal_color_5 = p.mag
vim.g.terminal_color_6 = p.cyn
vim.g.terminal_color_7 = p.fg
vim.g.terminal_color_8 = p.mute
vim.g.terminal_color_9 = p.b_red
vim.g.terminal_color_10 = p.b_grn
vim.g.terminal_color_11 = p.b_yel
vim.g.terminal_color_12 = p.b_blu
vim.g.terminal_color_13 = p.b_mag
vim.g.terminal_color_14 = p.b_cyn
vim.g.terminal_color_15 = p.b_fg
