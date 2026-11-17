local M = {}

function M.setup()
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "aeternal"

  local p = require("jp.theme.aeternal.palette")

  local highlights = {
    -- Editor UI
    Normal       = { fg = p.fg, bg = p.bg },
    NormalFloat  = { fg = p.fg, bg = p.bg_lt },
    FloatBorder  = { fg = p.acc, bg = p.bg_lt },
    FloatTitle   = { fg = p.cyan, bg = p.bg_lt, bold = true },
    Cursor       = { fg = p.bg, bg = p.cur },
    lCursor      = { link = "Cursor" },
    CursorIM     = { link = "Cursor" },
    CursorLine   = { bg = p.bg_lt },
    CursorColumn = { bg = p.bg_lt },
    ColorColumn  = { bg = p.bg_lt },
    CursorLineNr = { fg = p.b_green, bold = true },
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
    Search       = { fg = p.bg, bg = p.b_yellow },
    IncSearch    = { fg = p.bg, bg = p.cyan },
    CurSearch    = { link = "IncSearch" },
    Substitute   = { fg = p.bg, bg = p.b_red },
    MatchParen   = { fg = p.b_fg, bg = p.sel, bold = true },
    QuickFixLine = { bg = p.sel, bold = true },
    Directory    = { fg = p.b_blue },
    Title        = { fg = p.cyan, bold = true },
    ErrorMsg     = { fg = p.red },
    WarningMsg   = { fg = p.b_yellow },
    ModeMsg      = { fg = p.b_green, bold = true },
    MoreMsg      = { fg = p.green },
    Question     = { fg = p.green },
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
    Constant       = { fg = p.magenta },
    String         = { fg = p.b_green },
    Character      = { link = "String" },
    Number         = { fg = p.orange },
    Boolean        = { fg = p.orange },
    Float          = { link = "Number" },
    Identifier     = { fg = p.b_blue },
    Function       = { fg = p.cyan },
    Statement      = { fg = p.blue },
    Conditional    = { link = "Statement" },
    Repeat         = { link = "Statement" },
    Label          = { fg = p.yellow },
    Operator       = { fg = p.b_cyan },
    Keyword        = { fg = p.blue },
    Exception      = { fg = p.b_red },
    PreProc        = { fg = p.b_magenta },
    Include        = { link = "PreProc" },
    Define         = { link = "PreProc" },
    Macro          = { link = "PreProc" },
    PreCondit      = { link = "PreProc" },
    Type           = { fg = p.b_yellow },
    StorageClass   = { link = "Type" },
    Structure      = { link = "Type" },
    Typedef        = { link = "Type" },
    Special        = { fg = p.b_cyan },
    SpecialChar    = { link = "Special" },
    Tag            = { link = "Special" },
    SpecialComment = { link = "Special" },
    Debug          = { link = "Special" },
    Delimiter      = { fg = p.mute },
    Underlined     = { fg = p.b_blue, underline = true },
    Todo           = { fg = p.bg, bg = p.b_yellow, bold = true },
    Error          = { fg = p.red },

    -- Treesitter
    ["@variable"]           = { fg = p.fg },
    ["@variable.builtin"]   = { fg = p.b_red },
    ["@variable.parameter"] = { fg = p.fg_dk },
    ["@variable.member"]    = { fg = p.b_blue },
    ["@property"]           = { fg = p.b_blue },
    ["@module"]             = { fg = p.b_cyan },
    ["@constant"]           = { link = "Constant" },
    ["@constant.builtin"]   = { fg = p.b_magenta },
    ["@type.builtin"]       = { link = "Type" },
    ["@constructor"]        = { fg = p.b_yellow },
    ["@function.builtin"]   = { fg = p.cyan, italic = true },
    ["@function.call"]      = { link = "Function" },
    ["@keyword.import"]     = { fg = p.b_magenta },
    ["@string.escape"]      = { fg = p.b_cyan },
    ["@string.regexp"]      = { fg = p.cyan },
    ["@punctuation"]        = { fg = p.mute },
    ["@tag"]                = { fg = p.yellow },
    ["@tag.attribute"]      = { fg = p.b_yellow },
    ["@tag.delimiter"]      = { fg = p.mute },

    -- Treesitter: markup (Markdown etc.)
    ["@markup.heading"]       = { fg = p.cyan, bold = true },
    ["@markup.strong"]        = { bold = true },
    ["@markup.italic"]        = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"]     = { underline = true },
    ["@markup.link"]          = { fg = p.b_blue },
    ["@markup.link.url"]      = { fg = p.b_blue, underline = true },
    ["@markup.link.label"]    = { fg = p.b_cyan },
    ["@markup.raw"]           = { fg = p.b_green },
    ["@markup.list"]          = { fg = p.b_cyan },
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
    DiagnosticWarn             = { fg = p.b_yellow },
    DiagnosticInfo             = { fg = p.cyan },
    DiagnosticHint             = { fg = p.b_magenta },
    DiagnosticOk               = { fg = p.b_green },
    DiagnosticUnnecessary      = { link = "Comment" },
    DiagnosticUnderlineError   = { undercurl = true, sp = p.red },
    DiagnosticUnderlineWarn    = { undercurl = true, sp = p.b_yellow },
    DiagnosticUnderlineInfo    = { undercurl = true, sp = p.cyan },
    DiagnosticUnderlineHint    = { undercurl = true, sp = p.b_magenta },
    DiagnosticUnderlineOk      = { undercurl = true, sp = p.b_green },
    DiagnosticVirtualTextError = { fg = p.red, bg = p.bg_dk },
    DiagnosticVirtualTextWarn  = { fg = p.b_yellow, bg = p.bg_dk },
    DiagnosticVirtualTextInfo  = { fg = p.cyan, bg = p.bg_dk },
    DiagnosticVirtualTextHint  = { fg = p.b_magenta, bg = p.bg_dk },
    DiagnosticVirtualTextOk    = { fg = p.b_green, bg = p.bg_dk },

    -- Diff
    DiffAdd    = { fg = p.green, bg = p.bg_lt },
    DiffChange = { bg = p.brown },
    DiffDelete = { fg = p.red, bg = p.bg_dk },
    DiffText   = { fg = p.b_yellow, bg = p.brown, bold = true },
    Added      = { fg = p.green },
    Changed    = { fg = p.b_yellow },
    Removed    = { fg = p.red },

    -- Spelling
    SpellBad   = { undercurl = true, sp = p.red },
    SpellCap   = { undercurl = true, sp = p.b_yellow },
    SpellLocal = { undercurl = true, sp = p.cyan },
    SpellRare  = { undercurl = true, sp = p.b_magenta },
  }


  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Terminal colors (color0-15)
  vim.g.terminal_color_0 = p.black
  vim.g.terminal_color_1 = p.red
  vim.g.terminal_color_2 = p.green
  vim.g.terminal_color_3 = p.yellow
  vim.g.terminal_color_4 = p.blue
  vim.g.terminal_color_5 = p.magenta
  vim.g.terminal_color_6 = p.cyan
  vim.g.terminal_color_7 = p.white
  vim.g.terminal_color_8 = p.b_black
  vim.g.terminal_color_9 = p.b_red
  vim.g.terminal_color_10 = p.b_green
  vim.g.terminal_color_11 = p.b_yellow
  vim.g.terminal_color_12 = p.b_blue
  vim.g.terminal_color_13 = p.b_magenta
  vim.g.terminal_color_14 = p.b_cyan
  vim.g.terminal_color_15 = p.b_white
end

return M
