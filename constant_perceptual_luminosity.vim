" Constant Perceptual Luminosity (dark) colorscheme for Vim
" Based on kitty theme by Aaron Hall
" Colors optimized for constant perceptual luminosity

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "constant_perceptual_luminosity_dark"

" Base colors from the theme
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

let s:bg = s:black
let s:fg = s:white

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

" Simple color to cterm mapping
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

" Editor colors
call s:hi("Normal", s:fg, s:bg, "")
call s:hi("Cursor", s:bg, s:fg, "")
call s:hi("CursorLine", "", s:bright_black, "")
call s:hi("CursorColumn", "", s:bright_black, "")
call s:hi("ColorColumn", "", s:bright_black, "")
call s:hi("LineNr", s:bright_black, "", "")
call s:hi("CursorLineNr", s:bright_yellow, "", "bold")
call s:hi("VertSplit", s:bright_black, s:bright_black, "")
call s:hi("MatchParen", s:bright_yellow, s:yellow, "bold")
call s:hi("StatusLine", s:bg, s:fg, "")
call s:hi("StatusLineNC", s:bright_black, s:bright_black, "")
call s:hi("Pmenu", s:fg, s:bright_black, "")
call s:hi("PmenuSel", s:bg, s:bright_yellow, "")
call s:hi("PmenuSbar", "", s:bright_black, "")
call s:hi("PmenuThumb", "", s:fg, "")
call s:hi("TabLine", s:bright_black, s:bright_black, "")
call s:hi("TabLineSel", s:bg, s:fg, "")
call s:hi("TabLineFill", s:bright_black, s:bright_black, "")
call s:hi("WildMenu", s:bg, s:bright_yellow, "")

" Search
call s:hi("Search", s:bg, s:bright_yellow, "")
call s:hi("IncSearch", s:bg, s:bright_red, "")

" Messages
call s:hi("ErrorMsg", s:bright_red, "", "")
call s:hi("WarningMsg", s:bright_yellow, "", "")
call s:hi("ModeMsg", s:bright_green, "", "")
call s:hi("MoreMsg", s:bright_green, "", "")
call s:hi("Question", s:bright_green, "", "")

" Visual mode
call s:hi("Visual", s:bg, s:fg, "")
call s:hi("VisualNOS", s:bg, s:fg, "")

" Diff
call s:hi("DiffAdd", s:bright_green, s:green, "")
call s:hi("DiffChange", s:bright_yellow, s:yellow, "")
call s:hi("DiffDelete", s:bright_red, s:red, "")
call s:hi("DiffText", s:bright_blue, s:blue, "bold")

" Folding
call s:hi("Folded", s:bright_black, s:black, "")
call s:hi("FoldColumn", s:bright_black, s:black, "")

" Syntax highlighting
call s:hi("Comment", s:bright_black, "", "italic")
call s:hi("Constant", s:bright_red, "", "")
call s:hi("String", s:bright_green, "", "")
call s:hi("Character", s:bright_green, "", "")
call s:hi("Number", s:bright_red, "", "")
call s:hi("Boolean", s:bright_red, "", "")
call s:hi("Float", s:bright_red, "", "")
call s:hi("Identifier", s:bright_blue, "", "")
call s:hi("Function", s:bright_blue, "", "")
call s:hi("Statement", s:bright_magenta, "", "")
call s:hi("Conditional", s:bright_magenta, "", "")
call s:hi("Repeat", s:bright_magenta, "", "")
call s:hi("Label", s:bright_magenta, "", "")
call s:hi("Operator", s:bright_cyan, "", "")
call s:hi("Keyword", s:bright_magenta, "", "")
call s:hi("Exception", s:bright_magenta, "", "")
call s:hi("PreProc", s:bright_yellow, "", "")
call s:hi("Include", s:bright_yellow, "", "")
call s:hi("Define", s:bright_yellow, "", "")
call s:hi("Macro", s:bright_yellow, "", "")
call s:hi("PreCondit", s:bright_yellow, "", "")
call s:hi("Type", s:bright_cyan, "", "")
call s:hi("StorageClass", s:bright_cyan, "", "")
call s:hi("Structure", s:bright_cyan, "", "")
call s:hi("Typedef", s:bright_cyan, "", "")
call s:hi("Special", s:bright_yellow, "", "")
call s:hi("SpecialChar", s:bright_yellow, "", "")
call s:hi("Tag", s:bright_yellow, "", "")
call s:hi("Delimiter", s:fg, "", "")
call s:hi("SpecialComment", s:bright_black, "", "")
call s:hi("Debug", s:bright_red, "", "")
call s:hi("Underlined", s:bright_blue, "", "underline")
call s:hi("Ignore", s:bright_black, "", "")
call s:hi("Error", s:bright_red, s:red, "")
call s:hi("Todo", s:bright_yellow, s:yellow, "bold")

" Spell checking
call s:hi("SpellBad", s:bright_red, "", "undercurl")
call s:hi("SpellCap", s:bright_blue, "", "undercurl")
call s:hi("SpellLocal", s:bright_cyan, "", "undercurl")
call s:hi("SpellRare", s:bright_magenta, "", "undercurl")

" Git (for plugins like vim-gitgutter)
call s:hi("GitGutterAdd", s:bright_green, "", "")
call s:hi("GitGutterChange", s:bright_yellow, "", "")
call s:hi("GitGutterDelete", s:bright_red, "", "")
call s:hi("GitGutterChangeDelete", s:bright_red, "", "")

" LSP/CoC (for language server protocol)
call s:hi("LspDiagnosticsDefaultError", s:bright_red, "", "")
call s:hi("LspDiagnosticsDefaultWarning", s:bright_yellow, "", "")
call s:hi("LspDiagnosticsDefaultInformation", s:bright_blue, "", "")
call s:hi("LspDiagnosticsDefaultHint", s:bright_cyan, "", "")

" CoC specific
call s:hi("CocErrorSign", s:bright_red, "", "")
call s:hi("CocWarningSign", s:bright_yellow, "", "")
call s:hi("CocInfoSign", s:bright_blue, "", "")
call s:hi("CocHintSign", s:bright_cyan, "", "")

" Telescope (for nvim)
call s:hi("TelescopeSelection", s:bg, s:bright_yellow, "")
call s:hi("TelescopeMultiSelection", s:bg, s:bright_green, "")
call s:hi("TelescopeNormal", s:fg, s:bg, "")
call s:hi("TelescopeBorder", s:bright_black, s:bg, "")
call s:hi("TelescopePromptBorder", s:bright_black, s:bg, "")
call s:hi("TelescopeResultsBorder", s:bright_black, s:bg, "")
call s:hi("TelescopePreviewBorder", s:bright_black, s:bg, "")

" NERDTree
call s:hi("NERDTreeDir", s:bright_blue, "", "")
call s:hi("NERDTreeDirSlash", s:bright_blue, "", "")
call s:hi("NERDTreeOpenable", s:bright_green, "", "")
call s:hi("NERDTreeClosable", s:bright_yellow, "", "")
call s:hi("NERDTreeFile", s:fg, "", "")
call s:hi("NERDTreeExecFile", s:bright_green, "", "")
call s:hi("NERDTreeUp", s:bright_black, "", "")
call s:hi("NERDTreeCWD", s:bright_magenta, "", "")
call s:hi("NERDTreeHelp", s:bright_black, "", "")
call s:hi("NERDTreeToggleOn", s:bright_green, "", "")
call s:hi("NERDTreeToggleOff", s:bright_red, "", "")

" Terminal colors (for :terminal)
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