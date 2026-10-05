local palette = {
  bg = "#1e1f29",
  bg_dark = "#191a21",
  bg_float = "#21222c",
  bg_highlight = "#282a36",
  bg_visual = "#343746",
  selection = "#44475a",
  border = "#3a3c4e",
  fg = "#f8f8f2",
  comment = "#6272a4",
  cyan = "#8be9fd",
  green = "#50fa7b",
  orange = "#ffb86c",
  pink = "#ff79c6",
  purple = "#bd93f9",
  red = "#ff5555",
  yellow = "#f1fa8c",
}

local options = {
  transparent = false,
  colors = {},
  on_highlights = nil,
}

local function blend(a, b, alpha)
  local function parse(hex)
    hex = hex:gsub("#", "")
    return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
  end
  local ar, ag, ab = parse(a)
  local br, bg, bb = parse(b)
  local function mix(x, y)
    return math.floor(x * alpha + y * (1 - alpha) + 0.5)
  end
  return string.format("#%02x%02x%02x", mix(ar, br), mix(ag, bg), mix(ab, bb))
end

local function get(c, o)
  local bg = o.transparent and "NONE" or c.bg
  local float = o.transparent and "NONE" or c.bg_float
  local bar = o.transparent and "NONE" or c.bg_dark
  local dim = blend(c.fg, c.bg, 0.75)

  return {
    Normal = { fg = c.fg, bg = bg },
    NormalNC = { fg = c.fg, bg = bg },
    NormalFloat = { fg = c.fg, bg = float },
    FloatBorder = { fg = c.border, bg = float },
    FloatTitle = { fg = c.purple, bg = float, bold = true },
    ColorColumn = { bg = c.bg_highlight },
    Cursor = { fg = c.bg, bg = c.fg },
    lCursor = { link = "Cursor" },
    TermCursor = { link = "Cursor" },
    CursorLine = { bg = c.bg_highlight },
    CursorColumn = { bg = c.bg_highlight },
    CursorLineNr = { fg = c.fg, bold = true },
    LineNr = { fg = c.comment },
    SignColumn = { fg = c.comment, bg = bg },
    FoldColumn = { fg = c.comment, bg = bg },
    Folded = { fg = c.comment, bg = c.bg_highlight },
    WinSeparator = { fg = c.border },
    VertSplit = { link = "WinSeparator" },
    EndOfBuffer = { fg = bg },
    NonText = { fg = c.comment },
    Whitespace = { fg = c.selection },
    SpecialKey = { fg = c.selection },
    Conceal = { fg = c.comment },
    Visual = { bg = c.bg_visual },
    VisualNOS = { bg = c.bg_visual },
    Search = { fg = c.yellow, bg = c.selection },
    CurSearch = { fg = c.bg, bg = c.orange },
    IncSearch = { fg = c.bg, bg = c.orange },
    Substitute = { fg = c.bg, bg = c.red },
    MatchParen = { fg = c.pink, bold = true, underline = true },
    Title = { fg = c.purple, bold = true },
    Directory = { fg = c.purple },
    ErrorMsg = { fg = c.red },
    WarningMsg = { fg = c.orange },
    MoreMsg = { fg = c.green },
    ModeMsg = { fg = c.fg, bold = true },
    Question = { fg = c.cyan },
    WildMenu = { bg = c.selection },
    Pmenu = { fg = c.fg, bg = float },
    PmenuSel = { bg = c.selection },
    PmenuSbar = { bg = c.bg_highlight },
    PmenuThumb = { bg = c.selection },
    StatusLine = { fg = c.fg, bg = bar },
    StatusLineNC = { fg = c.comment, bg = bar },
    TabLine = { fg = c.comment, bg = bar },
    TabLineFill = { bg = bar },
    TabLineSel = { fg = c.fg, bg = bg },
    WinBar = { fg = c.fg, bg = bg },
    WinBarNC = { fg = c.comment, bg = bg },

    DiffAdd = { bg = blend(c.green, c.bg, 0.18) },
    DiffChange = { bg = blend(c.cyan, c.bg, 0.14) },
    DiffDelete = { bg = blend(c.red, c.bg, 0.18) },
    DiffText = { bg = blend(c.cyan, c.bg, 0.3) },
    Added = { fg = c.green },
    Changed = { fg = c.cyan },
    Removed = { fg = c.red },

    SpellBad = { sp = c.red, undercurl = true },
    SpellCap = { sp = c.orange, undercurl = true },
    SpellLocal = { sp = c.cyan, undercurl = true },
    SpellRare = { sp = c.purple, undercurl = true },

    Comment = { fg = c.comment },
    Constant = { fg = c.cyan },
    String = { fg = c.orange },
    Character = { fg = c.orange },
    Number = { fg = c.cyan },
    Boolean = { fg = c.cyan },
    Float = { fg = c.cyan },
    Identifier = { fg = c.fg },
    Function = { fg = c.green },
    Statement = { fg = c.purple },
    Conditional = { fg = c.pink },
    Repeat = { fg = c.pink },
    Label = { fg = c.pink },
    Operator = { fg = c.cyan },
    Keyword = { fg = c.purple },
    Exception = { fg = c.pink },
    PreProc = { fg = c.purple },
    PreCondit = { fg = c.purple },
    Include = { fg = c.purple },
    Define = { fg = c.purple },
    Macro = { fg = c.green, italic = true },
    Type = { fg = c.red },
    StorageClass = { fg = c.purple },
    Structure = { fg = c.purple },
    Typedef = { fg = c.purple },
    Tag = { fg = c.pink },
    Special = { fg = c.pink },
    SpecialChar = { fg = c.pink },
    Delimiter = { fg = dim },
    SpecialComment = { fg = c.comment },
    Underlined = { fg = c.cyan, underline = true },
    Error = { fg = c.red },
    Todo = { fg = c.bg, bg = c.purple, bold = true },

    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.orange },
    DiagnosticInfo = { fg = c.cyan },
    DiagnosticHint = { fg = c.comment },
    DiagnosticOk = { fg = c.green },
    DiagnosticUnderlineError = { sp = c.red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = c.orange, undercurl = true },
    DiagnosticUnderlineInfo = { sp = c.cyan, undercurl = true },
    DiagnosticUnderlineHint = { sp = c.comment, undercurl = true },
    DiagnosticVirtualTextError = { fg = c.red, bg = blend(c.red, c.bg, 0.1) },
    DiagnosticVirtualTextWarn = { fg = c.orange, bg = blend(c.orange, c.bg, 0.1) },
    DiagnosticVirtualTextInfo = { fg = c.cyan, bg = blend(c.cyan, c.bg, 0.1) },
    DiagnosticVirtualTextHint = { fg = c.comment, bg = blend(c.comment, c.bg, 0.1) },

    LspReferenceText = { bg = c.bg_visual },
    LspReferenceRead = { bg = c.bg_visual },
    LspReferenceWrite = { bg = c.bg_visual },
    LspInlayHint = { fg = c.comment, bg = blend(c.comment, c.bg, 0.1) },
    LspCodeLens = { fg = c.comment },

    ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.purple, italic = true },
    ["@variable.parameter"] = { fg = c.orange, italic = true },
    ["@variable.member"] = { fg = c.fg },
    ["@property"] = { fg = c.fg },
    ["@property.json"] = { fg = c.purple },
    ["@property.jsonc"] = { fg = c.purple },
    ["@property.yaml"] = { fg = c.purple },
    ["@property.toml"] = { fg = c.purple },
    ["@property.css"] = { fg = c.purple },
    ["@property.scss"] = { fg = c.purple },
    ["@field"] = { fg = c.fg },
    ["@constant"] = { fg = c.cyan },
    ["@constant.builtin"] = { fg = c.cyan },
    ["@constant.macro"] = { fg = c.cyan },
    ["@module"] = { fg = c.fg },
    ["@label"] = { fg = c.pink },
    ["@string"] = { fg = c.cyan },
    ["@string.escape"] = { fg = c.pink },
    ["@string.regexp"] = { fg = c.orange, italic = true },
    ["@string.special"] = { fg = c.pink },
    ["@string.special.url"] = { fg = c.cyan, underline = true },
    ["@string.special.symbol"] = { fg = c.cyan },
    ["@string.special.path"] = { fg = c.orange },
    ["@character"] = { fg = c.orange },
    ["@character.special"] = { fg = c.pink },
    ["@number"] = { fg = c.cyan },
    ["@boolean"] = { fg = c.cyan },
    ["@function"] = { fg = c.green },
    ["@function.call"] = { fg = c.green },
    ["@function.builtin"] = { fg = c.green, italic = true },
    ["@function.method"] = { fg = c.green },
    ["@function.method.call"] = { fg = c.green },
    ["@function.macro"] = { fg = c.green, italic = true },
    ["@constructor"] = { link = "@type" },
    ["@constructor.lua"] = { fg = dim },
    ["@keyword"] = { fg = c.purple },
    ["@keyword.function"] = { fg = c.purple },
    ["@keyword.type"] = { fg = c.purple },
    ["@keyword.modifier"] = { fg = c.purple },
    ["@keyword.import"] = { fg = c.purple },
    ["@keyword.coroutine"] = { fg = c.purple },
    ["@keyword.directive"] = { fg = c.purple },
    ["@keyword.conditional"] = { fg = c.pink },
    ["@keyword.repeat"] = { fg = c.pink },
    ["@keyword.return"] = { fg = c.pink },
    ["@keyword.exception"] = { fg = c.pink },
    ["@keyword.operator"] = { fg = c.pink },
    ["@operator"] = { fg = c.cyan },
    ["@type"] = { fg = c.red },
    ["@type.builtin"] = { fg = c.red, italic = true },
    ["@type.definition"] = { fg = c.red },
    ["@attribute"] = { fg = dim },
    ["@tag"] = { fg = c.pink },
    ["@tag.attribute"] = { fg = c.green },
    ["@tag.delimiter"] = { fg = dim },
    ["@punctuation"] = { fg = dim },
    ["@punctuation.delimiter"] = { fg = dim },
    ["@punctuation.bracket"] = { fg = dim },
    ["@punctuation.special"] = { fg = dim },
    ["@comment"] = { fg = c.comment },
    ["@comment.error"] = { fg = c.bg, bg = c.red, bold = true },
    ["@comment.warning"] = { fg = c.bg, bg = c.orange, bold = true },
    ["@comment.note"] = { fg = c.bg, bg = c.cyan, bold = true },
    ["@comment.todo"] = { fg = c.bg, bg = c.purple, bold = true },
    ["@markup.heading"] = { fg = c.purple, bold = true },
    ["@markup.strong"] = { fg = c.orange, bold = true },
    ["@markup.italic"] = { fg = c.yellow, italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.link"] = { fg = c.pink },
    ["@markup.link.label"] = { fg = c.pink },
    ["@markup.link.url"] = { fg = c.cyan, underline = true },
    ["@markup.raw"] = { fg = c.green },
    ["@markup.raw.block"] = { fg = c.orange },
    ["@markup.quote"] = { fg = c.yellow, italic = true },
    ["@markup.list"] = { fg = c.cyan },
    ["@markup.list.checked"] = { fg = c.green },
    ["@markup.list.unchecked"] = { fg = c.comment },
    ["@diff.plus"] = { fg = c.green },
    ["@diff.minus"] = { fg = c.red },
    ["@diff.delta"] = { fg = c.orange },

    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.typeParameter"] = { fg = c.yellow, italic = true },
    ["@lsp.type.lifetime"] = { fg = c.yellow, italic = true },
    ["@lsp.type.interface"] = { fg = c.yellow },
    ["@lsp.type.macro"] = { link = "@function.macro" },
    -- ["@lsp.type.derive"] = { link = "@attribute" },
    ["@lsp.type.derive"] = { fg = c.yellow },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },

    GitSignsAdd = { fg = c.green },
    GitSignsChange = { fg = c.cyan },
    GitSignsDelete = { fg = c.red },

    SnacksIndent = { fg = c.bg_visual },
    SnacksIndentScope = { fg = c.purple },
    SnacksDashboardHeader = { fg = c.pink },
    SnacksDashboardKey = { fg = c.orange },
    SnacksDashboardIcon = { fg = c.cyan },
    SnacksDashboardDesc = { fg = c.fg },
    SnacksDashboardFooter = { fg = c.comment },
    SnacksPickerMatch = { fg = c.cyan, bold = true },
    SnacksPickerGitStatusUntracked = { fg = c.green },
    SnacksPickerGitStatusModified = { fg = c.cyan },
    SnacksPickerGitStatusIgnored = { fg = c.comment },
    IblIndent = { fg = c.bg_visual },
    IblScope = { fg = c.purple },

    NeoTreeNormal = { fg = c.fg, bg = bar },
    NeoTreeNormalNC = { fg = c.fg, bg = bar },
    NeoTreeEndOfBuffer = { fg = bar, bg = bar },
    NeoTreeDirectoryName = { fg = c.fg },
    NeoTreeDirectoryIcon = { fg = c.purple },
    NeoTreeRootName = { fg = c.pink, bold = true },
    NeoTreeDotfile = { fg = c.comment },
    NeoTreeGitAdded = { fg = c.green },
    NeoTreeGitUntracked = { fg = c.green },
    NeoTreeGitStaged = { fg = c.green },
    NeoTreeGitModified = { fg = c.cyan },
    NeoTreeGitUnstaged = { fg = c.cyan },
    NeoTreeGitConflict = { fg = c.orange },
    NeoTreeGitIgnored = { fg = c.comment },
    NeoTreeGitDeleted = { fg = c.red },

    TelescopeNormal = { fg = c.fg, bg = float },
    TelescopeBorder = { fg = c.border, bg = float },
    TelescopeSelection = { bg = c.selection },
    TelescopeMatching = { fg = c.cyan, bold = true },
    TelescopePromptPrefix = { fg = c.pink },

    WhichKey = { fg = c.cyan },
    WhichKeyGroup = { fg = c.purple },
    WhichKeyDesc = { fg = c.fg },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyNormal = { bg = float },

    BlinkCmpMenu = { fg = c.fg, bg = float },
    BlinkCmpMenuBorder = { fg = c.border, bg = float },
    BlinkCmpMenuSelection = { bg = c.selection },
    BlinkCmpLabelMatch = { fg = c.cyan, bold = true },
    BlinkCmpLabelDeprecated = { fg = c.comment, strikethrough = true },
    BlinkCmpDoc = { fg = c.fg, bg = float },
    BlinkCmpDocBorder = { fg = c.border, bg = float },

    FlashLabel = { fg = c.bg, bg = c.pink, bold = true },
    FlashMatch = { fg = c.cyan, bg = c.selection },
    FlashCurrent = { fg = c.bg, bg = c.orange },
    FlashBackdrop = { fg = c.comment },

    NoiceCmdlinePopupBorder = { fg = c.purple },
    NoiceCmdlineIcon = { fg = c.purple },
    NotifyBackground = { bg = float },

    TroubleNormal = { fg = c.fg, bg = bar },
    TroubleNormalNC = { fg = c.fg, bg = bar },

    MiniIconsAzure = { fg = c.cyan },
    MiniIconsBlue = { fg = c.purple },
    MiniIconsCyan = { fg = c.cyan },
    MiniIconsGreen = { fg = c.green },
    MiniIconsGrey = { fg = c.fg },
    MiniIconsOrange = { fg = c.orange },
    MiniIconsPurple = { fg = c.pink },
    MiniIconsRed = { fg = c.red },
    MiniIconsYellow = { fg = c.yellow },
  }
end

local function load()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "dracula-dark"

  local c = vim.tbl_extend("force", palette, options.colors)
  local groups = get(c, options)

  if options.on_highlights then
    options.on_highlights(groups, c)
  end

  for name, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, name, spec)
  end

  local term = {
    c.bg_dark,
    c.red,
    c.green,
    c.yellow,
    c.purple,
    c.pink,
    c.cyan,
    c.fg,
    c.comment,
    "#ff6e6e",
    "#69ff94",
    "#ffffa5",
    "#d6acff",
    "#ff92df",
    "#a4ffff",
    "#ffffff",
  }
  for i, color in ipairs(term) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end

  vim.api.nvim_exec_autocmds("ColorScheme", { pattern = "dracula-dark", modeline = false })
end

vim.api.nvim_create_user_command("DraculaDark", load, {})

return {
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = load },
  },
}
