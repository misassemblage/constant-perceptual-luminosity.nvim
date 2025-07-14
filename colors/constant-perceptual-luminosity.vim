" Constant Perceptual Luminosity (dark) colorscheme for Vim - Soft Edition
" Based on kitty theme by Aaron Hall
" Extended with softer, less contrasty colors while maintaining constant perceptual luminosity

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "constant_perceptual_luminosity_dark"

" Base colors from the original theme
let s:black       = "#000000"
let s:red         = "#b10b00"
let s:green       = "#007232"
let s:yellow      = "#745b00"
let s:blue        = "#3123ff"
let s:magenta     = "#9b0097"
let s:cyan        = "#006a78"
let s:white       = "#777777"
let s:bright_black   = "#464646"
let s:bright_red     = "#ff3d2b"
let s:bright_green   = "#00ae50"
let s:bright_yellow  = "#b18c00"
let s:bright_blue    = "#6786ff"
let s:bright_magenta = "#eb00e4"
let s:bright_cyan    = "#00a3b7"
let s:bright_white   = "#ababab"

" New softer intermediate colors - maintaining constant perceptual luminosity
" Darker variants (luminosity ~0.25)
let s:soft_red       = "#801e1a"
let s:soft_green     = "#1a5c3a"
let s:soft_yellow    = "#5c4a1a"
let s:soft_blue      = "#2a3a8a"
let s:soft_magenta   = "#6a1a65"
let s:soft_cyan      = "#1a525a"
let s:soft_white     = "#555555"

" Medium variants (luminosity ~0.35)
let s:med_red        = "#a0362f"
let s:med_green      = "#2f7a4a"
let s:med_yellow     = "#7a652f"
let s:med_blue       = "#4a52aa"
let s:med_magenta    = "#8a2f85"
let s:med_cyan       = "#2f6a72"
let s:med_white      = "#666666"

" Lighter variants (luminosity ~0.55)
let s:light_red      = "#d45545"
let s:light_green    = "#45a665"
let s:light_yellow   = "#a68545"
let s:light_blue     = "#6575d4"
let s:light_magenta  = "#b545b0"
let s:light_cyan     = "#4595a2"
let s:light_white    = "#999999"

" Very light variants (luminosity ~0.65)
let s:vlight_red     = "#f47a6a"
let s:vlight_green   = "#6ac285"
let s:vlight_yellow  = "#c2a56a"
let s:vlight_blue    = "#8a9af4"
let s:vlight_magenta = "#d66ad1"
let s:vlight_cyan    = "#6ab5c2"
let s:vlight_white   = "#bbbbbb"

" Background variants for less harsh contrast
let s:bg = s:black
let s:bg_soft = "#111111"
let s:bg_med = "#1a1a1a"
let s:bg_light = "#222222"
let s:fg = s:med_white
let s:fg_soft = s:soft_white
let s:fg_bright = s:light_white

" Helper function to set highlight groups
function! s:hi(group, fg, bg, attr)
  let l:cmd = "hi " . a:group
  if a:fg != ""
    let l:cmd .= " guifg=" . a:fg . " ctermfg=" . s:cterm_color(a:fg)
  endif
  if a:bg != ""
    let l:cmd .= " guibg=" . a:bg . " ctermbg=" . s:cterm_color(a:bg)
  endif
  if a:attr != ""
    let l:cmd .= " gui=" . a:attr . " cterm=" . a:attr
  endif
  exec l:cmd
endfunction

" Enhanced color to cterm mapping
function! s:cterm_color(hex)
  if a:hex == s:black       | return "0"
  elseif a:hex == s:red     | return "1"
  elseif a:hex == s:green   | return "2"
  elseif a:hex == s:yellow  | return "3"
  elseif a:hex == s:blue    | return "4"
  elseif a:hex == s:magenta | return "5"
  elseif a:hex == s:cyan    | return "6"
  elseif a:hex == s:white   | return "7"
  elseif a:hex == s:bright_black   | return "8"
  elseif a:hex == s:bright_red     | return "9"
  elseif a:hex == s:bright_green   | return "10"
  elseif a:hex == s:bright_yellow  | return "11"
  elseif a:hex == s:bright_blue    | return "12"
  elseif a:hex == s:bright_magenta | return "13"
  elseif a:hex == s:bright_cyan    | return "14"
  elseif a:hex == s:bright_white   | return "15"
  else | return "NONE"
  endif
endfunction

" Editor colors - using softer variants
call s:hi("Normal", s:fg, s:bg, "")
call s:hi("Cursor", s:bg, s:light_white, "")
call s:hi("CursorLine", "", s:bg_soft, "")
call s:hi("CursorColumn", "", s:bg_soft, "")
call s:hi("ColorColumn", "", s:bg_soft, "")
call s:hi("LineNr", s:soft_white, "", "")
call s:hi("CursorLineNr", s:light_yellow, "", "bold")
call s:hi("VertSplit", s:bg_light, s:bg_light, "")
call s:hi("MatchParen", s:vlight_yellow, s:soft_yellow, "bold")
call s:hi("StatusLine", s:bg, s:med_white, "")
call s:hi("StatusLineNC", s:soft_white, s:bg_med, "")
call s:hi("Pmenu", s:fg, s:bg_med, "")
call s:hi("PmenuSel", s:bg, s:med_yellow, "")
call s:hi("PmenuSbar", "", s:bg_light, "")
call s:hi("PmenuThumb", "", s:med_white, "")
call s:hi("TabLine", s:soft_white, s:bg_med, "")
call s:hi("TabLineSel", s:bg, s:med_white, "")
call s:hi("TabLineFill", s:bg_light, s:bg_light, "")
call s:hi("WildMenu", s:bg, s:med_yellow, "")

" Search - softer highlighting
call s:hi("Search", s:bg, s:med_yellow, "")
call s:hi("IncSearch", s:bg, s:light_red, "")

" Messages - using medium intensity colors
call s:hi("ErrorMsg", s:light_red, "", "")
call s:hi("WarningMsg", s:light_yellow, "", "")
call s:hi("ModeMsg", s:light_green, "", "")
call s:hi("MoreMsg", s:light_green, "", "")
call s:hi("Question", s:light_green, "", "")

" Visual mode - softer selection
call s:hi("Visual", s:bg, s:med_white, "")
call s:hi("VisualNOS", s:bg, s:med_white, "")

" Diff - using layered colors for better distinction
call s:hi("DiffAdd", s:light_green, s:soft_green, "")
call s:hi("DiffChange", s:light_yellow, s:soft_yellow, "")
call s:hi("DiffDelete", s:light_red, s:soft_red, "")
call s:hi("DiffText", s:vlight_blue, s:med_blue, "bold")

" Folding - subtle but visible
call s:hi("Folded", s:med_white, s:bg_soft, "")
call s:hi("FoldColumn", s:soft_white, s:bg, "")

" Syntax highlighting - using the extended color palette
call s:hi("Comment", s:soft_white, "", "italic")
call s:hi("Constant", s:light_red, "", "")
call s:hi("String", s:med_green, "", "")
call s:hi("Character", s:light_green, "", "")
call s:hi("Number", s:med_red, "", "")
call s:hi("Boolean", s:light_red, "", "")
call s:hi("Float", s:med_red, "", "")
call s:hi("Identifier", s:med_blue, "", "")
call s:hi("Function", s:light_blue, "", "")
call s:hi("Statement", s:med_magenta, "", "")
call s:hi("Conditional", s:light_magenta, "", "")
call s:hi("Repeat", s:med_magenta, "", "")
call s:hi("Label", s:light_magenta, "", "")
call s:hi("Operator", s:med_cyan, "", "")
call s:hi("Keyword", s:light_magenta, "", "")
call s:hi("Exception", s:vlight_magenta, "", "")
call s:hi("PreProc", s:med_yellow, "", "")
call s:hi("Include", s:light_yellow, "", "")
call s:hi("Define", s:med_yellow, "", "")
call s:hi("Macro", s:light_yellow, "", "")
call s:hi("PreCondit", s:med_yellow, "", "")
call s:hi("Type", s:light_cyan, "", "")
call s:hi("StorageClass", s:med_cyan, "", "")
call s:hi("Structure", s:light_cyan, "", "")
call s:hi("Typedef", s:med_cyan, "", "")
call s:hi("Special", s:light_yellow, "", "")
call s:hi("SpecialChar", s:vlight_yellow, "", "")
call s:hi("Tag", s:med_yellow, "", "")
call s:hi("Delimiter", s:med_white, "", "")
call s:hi("SpecialComment", s:med_white, "", "")
call s:hi("Debug", s:light_red, "", "")
call s:hi("Underlined", s:light_blue, "", "underline")
call s:hi("Ignore", s:soft_white, "", "")
call s:hi("Error", s:vlight_red, s:soft_red, "")
call s:hi("Todo", s:vlight_yellow, s:soft_yellow, "bold")

" Spell checking - softer underlines
call s:hi("SpellBad", s:light_red, "", "undercurl")
call s:hi("SpellCap", s:light_blue, "", "undercurl")
call s:hi("SpellLocal", s:light_cyan, "", "undercurl")
call s:hi("SpellRare", s:light_magenta, "", "undercurl")

" Git - using medium intensity for subtlety
call s:hi("GitGutterAdd", s:med_green, "", "")
call s:hi("GitGutterChange", s:med_yellow, "", "")
call s:hi("GitGutterDelete", s:med_red, "", "")
call s:hi("GitGutterChangeDelete", s:light_red, "", "")

" LSP/CoC - clear but not harsh
call s:hi("LspDiagnosticsDefaultError", s:light_red, "", "")
call s:hi("LspDiagnosticsDefaultWarning", s:light_yellow, "", "")
call s:hi("LspDiagnosticsDefaultInformation", s:light_blue, "", "")
call s:hi("LspDiagnosticsDefaultHint", s:light_cyan, "", "")

" CoC specific
call s:hi("CocErrorSign", s:light_red, "", "")
call s:hi("CocWarningSign", s:light_yellow, "", "")
call s:hi("CocInfoSign", s:light_blue, "", "")
call s:hi("CocHintSign", s:light_cyan, "", "")

" Telescope - enhanced with softer backgrounds
call s:hi("TelescopeSelection", s:bg, s:med_yellow, "")
call s:hi("TelescopeMultiSelection", s:bg, s:med_green, "")
call s:hi("TelescopeNormal", s:fg, s:bg_soft, "")
call s:hi("TelescopeBorder", s:med_white, s:bg_soft, "")
call s:hi("TelescopePromptBorder", s:light_cyan, s:bg_soft, "")
call s:hi("TelescopeResultsBorder", s:med_blue, s:bg_soft, "")
call s:hi("TelescopePreviewBorder", s:med_magenta, s:bg_soft, "")
call s:hi("TelescopePromptTitle", s:vlight_cyan, s:bg_soft, "bold")
call s:hi("TelescopeResultsTitle", s:vlight_blue, s:bg_soft, "bold")
call s:hi("TelescopePreviewTitle", s:vlight_magenta, s:bg_soft, "bold")
call s:hi("TelescopeMatching", s:vlight_yellow, "", "bold")

" NERDTree - using varied intensities for hierarchy
call s:hi("NERDTreeDir", s:light_blue, "", "")
call s:hi("NERDTreeDirSlash", s:med_blue, "", "")
call s:hi("NERDTreeOpenable", s:med_green, "", "")
call s:hi("NERDTreeClosable", s:light_green, "", "")
call s:hi("NERDTreeFile", s:med_white, "", "")
call s:hi("NERDTreeExecFile", s:light_green, "", "")
call s:hi("NERDTreeUp", s:soft_white, "", "")
call s:hi("NERDTreeCWD", s:light_magenta, "", "")
call s:hi("NERDTreeHelp", s:soft_white, "", "")
call s:hi("NERDTreeToggleOn", s:light_green, "", "")
call s:hi("NERDTreeToggleOff", s:light_red, "", "")

" Additional syntax groups for better language support
call s:hi("htmlTag", s:med_cyan, "", "")
call s:hi("htmlEndTag", s:med_cyan, "", "")
call s:hi("htmlTagName", s:light_cyan, "", "")
call s:hi("htmlArg", s:med_yellow, "", "")
call s:hi("htmlString", s:med_green, "", "")

call s:hi("cssClassName", s:light_yellow, "", "")
call s:hi("cssIdentifier", s:light_blue, "", "")
call s:hi("cssProperty", s:med_cyan, "", "")
call s:hi("cssValue", s:med_green, "", "")

call s:hi("jsFunction", s:light_magenta, "", "")
call s:hi("jsThis", s:light_red, "", "")
call s:hi("jsArrowFunction", s:med_magenta, "", "")
call s:hi("jsTemplateString", s:light_green, "", "")

call s:hi("pythonFunction", s:light_blue, "", "")
call s:hi("pythonBuiltin", s:light_cyan, "", "")
call s:hi("pythonDecorator", s:med_yellow, "", "")
call s:hi("pythonString", s:med_green, "", "")

call s:hi("rustKeyword", s:light_magenta, "", "")
call s:hi("rustLifetime", s:med_cyan, "", "")
call s:hi("rustMacro", s:light_yellow, "", "")
call s:hi("rustType", s:light_cyan, "", "")

" Terminal colors (for :terminal) - maintaining original palette
if has('nvim')
  let g:terminal_color_0  = s:black
  let g:terminal_color_1  = s:red
  let g:terminal_color_2  = s:green
  let g:terminal_color_3  = s:yellow
  let g:terminal_color_4  = s:blue
  let g:terminal_color_5  = s:magenta
  let g:terminal_color_6  = s:cyan
  let g:terminal_color_7  = s:white
  let g:terminal_color_8  = s:bright_black
  let g:terminal_color_9  = s:bright_red
  let g:terminal_color_10 = s:bright_green
  let g:terminal_color_11 = s:bright_yellow
  let g:terminal_color_12 = s:bright_blue
  let g:terminal_color_13 = s:bright_magenta
  let g:terminal_color_14 = s:bright_cyan
  let g:terminal_color_15 = s:bright_white
endif
