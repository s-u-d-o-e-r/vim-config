" Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (C) 2016-present Sven Greb <development@svengreb.de>

" Project: Nord Vim
" Repository: https://github.com/arcticicestudio/nord-vim
" License: MIT

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "nord"
let s:nord_vim_version="0.15.0"
set background=dark

let s:nord0_gui = "#2E3440"
let s:nord1_gui = "#3B4252"
let s:nord2_gui = "#434C5E"
let s:nord3_gui = "#4C566A"
let s:nord3_gui_bright = "#616E88"
let s:nord4_gui = "#D8DEE9"
let s:nord5_gui = "#E5E9F0"
let s:nord6_gui = "#ECEFF4"
let s:nord7_gui = "#8FBCBB"
let s:nord8_gui = "#88C0D0"
let s:nord9_gui = "#81A1C1"
let s:nord10_gui = "#5E81AC"
let s:nord11_gui = "#BF616A"
let s:nord12_gui = "#D08770"
let s:nord13_gui = "#EBCB8B"
let s:nord14_gui = "#A3BE8C"
let s:nord15_gui = "#B48EAD"

let s:nord1_term = "0"
let s:nord3_term = "8"
let s:nord5_term = "7"
let s:nord6_term = "15"
let s:nord7_term = "14"
let s:nord8_term = "6"
let s:nord9_term = "4"
let s:nord10_term = "12"
let s:nord11_term = "1"
let s:nord12_term = "11"
let s:nord13_term = "3"
let s:nord14_term = "2"
let s:nord15_term = "5"

let s:nord3_gui_brightened = [
  \ s:nord3_gui,
  \ "#4e586d",
  \ "#505b70",
  \ "#525d73",
  \ "#556076",
  \ "#576279",
  \ "#59647c",
  \ "#5b677f",
  \ "#5d6982",
  \ "#5f6c85",
  \ "#616e88",
  \ "#63718b",
  \ "#66738e",
  \ "#687591",
  \ "#6a7894",
  \ "#6d7a96",
  \ "#6f7d98",
  \ "#72809a",
  \ "#75829c",
  \ "#78859e",
  \ "#7b88a1",
\ ]

if !exists("g:nord_bold")
  let g:nord_bold = 1
endif

let s:bold = "bold,"
if g:nord_bold == 0
  let s:bold = ""
endif

if !exists("g:nord_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:nord_italic = 1
  else
    let g:nord_italic = 0
  endif
endif

let s:italic = "italic,"
if g:nord_italic == 0
  let s:italic = ""
endif

let s:underline = "underline,"
if ! get(g:, "nord_underline", 1)
  let s:underline = "NONE,"
endif

let s:italicize_comments = ""
if exists("g:nord_italic_comments")
  if g:nord_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif

if !exists('g:nord_uniform_status_lines')
  let g:nord_uniform_status_lines = 0
endif

function! s:logWarning(msg)
  echohl WarningMsg
  echomsg 'nord: warning: ' . a:msg
  echohl None
endfunction

if exists("g:nord_comment_brightness")
  call s:logWarning('Variable g:nord_comment_brightness has been deprecated and will be removed in version 1.0.0!' .
                   \' The comment color brightness has been increased by 10% by default.' .
                   \' Please see https://github.com/arcticicestudio/nord-vim/issues/145 for more details.')
  let g:nord_comment_brightness = 10
endif

if !exists("g:nord_uniform_diff_background")
  let g:nord_uniform_diff_background = 0
endif

if !exists("g:nord_cursor_line_number_background")
  let g:nord_cursor_line_number_background = 0
endif

if !exists("g:nord_bold_vertical_split_line")
  let g:nord_bold_vertical_split_line = 0
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", s:bold, "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:nord1_gui, "NONE", s:nord1_term, "", "")
call s:hi("Cursor", s:nord0_gui, s:nord4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
call s:hi("Error", s:nord4_gui, s:nord11_gui, "", s:nord11_term, "", "")
call s:hi("iCursor", s:nord0_gui, s:nord4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:nord3_gui, "NONE", s:nord3_term, "NONE", "", "")
call s:hi("MatchParen", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "", "")
call s:hi("NonText", s:nord2_gui, "", s:nord3_term, "", "", "")
call s:hi("Normal", s:nord4_gui, s:nord0_gui, "NONE", "NONE", "", "")
call s:hi("PMenu", s:nord4_gui, s:nord2_gui, "NONE", s:nord1_term, "NONE", "")
call s:hi("PmenuSbar", s:nord4_gui, s:nord2_gui, "NONE", s:nord1_term, "", "")
call s:hi("PMenuSel", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "", "")
call s:hi("PmenuThumb", s:nord8_gui, s:nord3_gui, "NONE", s:nord3_term, "", "")
call s:hi("SpecialKey", s:nord3_gui, "", s:nord3_term, "", "", "")
call s:hi("SpellBad", s:nord11_gui, s:nord0_gui, s:nord11_term, "NONE", "undercurl", s:nord11_gui)
call s:hi("SpellCap", s:nord13_gui, s:nord0_gui, s:nord13_term, "NONE", "undercurl", s:nord13_gui)
call s:hi("SpellLocal", s:nord5_gui, s:nord0_gui, s:nord5_term, "NONE", "undercurl", s:nord5_gui)
call s:hi("SpellRare", s:nord6_gui, s:nord0_gui, s:nord6_term, "NONE", "undercurl", s:nord6_gui)
call s:hi("Visual", "", s:nord2_gui, "", s:nord1_term, "", "")
call s:hi("VisualNOS", "", s:nord2_gui, "", s:nord1_term, "", "")
"+- Neovim Support -+
call s:hi("healthError", s:nord11_gui, s:nord1_gui, s:nord11_term, s:nord1_term, "", "")
call s:hi("healthSuccess", s:nord14_gui, s:nord1_gui, s:nord14_term, s:nord1_term, "", "")
call s:hi("healthWarning", s:nord13_gui, s:nord1_gui, s:nord13_term, s:nord1_term, "", "")
call s:hi("TermCursorNC", "", s:nord1_gui, "", s:nord1_term, "", "")

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [s:nord1_gui, s:nord11_gui, s:nord14_gui, s:nord13_gui, s:nord9_gui, s:nord15_gui, s:nord8_gui, s:nord5_gui, s:nord3_gui, s:nord11_gui, s:nord14_gui, s:nord13_gui, s:nord9_gui, s:nord15_gui, s:nord7_gui, s:nord6_gui]
endif

"+- Neovim Terminal Colors -+
if has('nvim')
  let g:terminal_color_0 = s:nord1_gui
  let g:terminal_color_1 = s:nord11_gui
  let g:terminal_color_2 = s:nord14_gui
  let g:terminal_color_3 = s:nord13_gui
  let g:terminal_color_4 = s:nord9_gui
  let g:terminal_color_5 = s:nord15_gui
  let g:terminal_color_6 = s:nord8_gui
  let g:terminal_color_7 = s:nord5_gui
  let g:terminal_color_8 = s:nord3_gui
  let g:terminal_color_9 = s:nord11_gui
  let g:terminal_color_10 = s:nord14_gui
  let g:terminal_color_11 = s:nord13_gui
  let g:terminal_color_12 = s:nord9_gui
  let g:terminal_color_13 = s:nord15_gui
  let g:terminal_color_14 = s:nord7_gui
  let g:terminal_color_15 = s:nord6_gui
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:nord1_gui, "NONE", s:nord1_term, "", "")
if g:nord_cursor_line_number_background == 0
  call s:hi("CursorLineNr", s:nord4_gui, "", "NONE", "", "NONE", "")
else
  call s:hi("CursorLineNr", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
endif
call s:hi("Folded", s:nord3_gui, s:nord1_gui, s:nord3_term, s:nord1_term, s:bold, "")
call s:hi("FoldColumn", s:nord3_gui, s:nord0_gui, s:nord3_term, "NONE", "", "")
call s:hi("SignColumn", s:nord1_gui, s:nord0_gui, s:nord1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:nord8_gui, "", s:nord8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:nord1_gui, "", s:nord1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:nord4_gui, s:nord11_gui, "NONE", s:nord11_term, "", "")
call s:hi("ModeMsg", s:nord4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("Question", s:nord4_gui, "", "NONE", "", "", "")
if g:nord_uniform_status_lines == 0
  call s:hi("StatusLine", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineNC", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
  call s:hi("StatusLineTerm", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
else
  call s:hi("StatusLine", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineNC", s:nord4_gui, s:nord3_gui, "NONE", s:nord3_term, "NONE", "")
  call s:hi("StatusLineTerm", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:nord4_gui, s:nord3_gui, "NONE", s:nord3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:nord0_gui, s:nord13_gui, s:nord1_term, s:nord13_term, "", "")
call s:hi("WildMenu", s:nord8_gui, s:nord1_gui, s:nord8_term, s:nord1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:nord6_gui, s:nord10_gui, s:nord6_term, s:nord10_term, s:underline, "")
call s:hi("Search", s:nord1_gui, s:nord8_gui, s:nord1_term, s:nord8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
call s:hi("TabLineFill", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
call s:hi("TabLineSel", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:nord4_gui, "", "NONE", "", "NONE", "")

if g:nord_bold_vertical_split_line == 0
  call s:hi("VertSplit", s:nord2_gui, s:nord0_gui, s:nord3_term, "NONE", "NONE", "")
else
  call s:hi("VertSplit", s:nord2_gui, s:nord1_gui, s:nord3_term, s:nord1_term, "NONE", "")
endif

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Character", s:nord14_gui, "", s:nord14_term, "", "", "")
call s:hi("Comment", s:nord3_gui_bright, "", s:nord3_term, "", s:italicize_comments, "")
call s:hi("Conditional", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Constant", s:nord4_gui, "", "NONE", "", "", "")
call s:hi("Define", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Delimiter", s:nord6_gui, "", s:nord6_term, "", "", "")
call s:hi("Exception", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Float", s:nord15_gui, "", s:nord15_term, "", "", "")
call s:hi("Function", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("Identifier", s:nord4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Keyword", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Label", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Number", s:nord15_gui, "", s:nord15_term, "", "", "")
call s:hi("Operator", s:nord9_gui, "", s:nord9_term, "", "NONE", "")
call s:hi("PreProc", s:nord9_gui, "", s:nord9_term, "", "NONE", "")
call s:hi("Repeat", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Special", s:nord4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("SpecialComment", s:nord8_gui, "", s:nord8_term, "", s:italicize_comments, "")
call s:hi("Statement", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("StorageClass", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("String", s:nord14_gui, "", s:nord14_term, "", "", "")
call s:hi("Structure", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Tag", s:nord4_gui, "", "", "", "", "")
call s:hi("Todo", s:nord13_gui, "NONE", s:nord13_term, "NONE", "", "")
call s:hi("Type", s:nord9_gui, "", s:nord9_term, "", "NONE", "")
call s:hi("Typedef", s:nord9_gui, "", s:nord9_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", s:nord10_gui, "", s:nord10_term, "", "", "")
call s:hi("asciidocAttributeList", s:nord10_gui, "", s:nord10_term, "", "", "")
call s:hi("asciidocAttributeRef", s:nord10_gui, "", s:nord10_term, "", "", "")
call s:hi("asciidocHLabel", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("asciidocListingBlock", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("asciidocMacroAttributes", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("asciidocOneLineTitle", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("asciidocPassthroughBlock", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("asciidocQuotedMonospaced", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link asciidocAdmonition Keyword
hi! link asciidocAttributeRef markdownH1
hi! link asciidocBackslash Keyword
hi! link asciidocMacro Keyword
hi! link asciidocQuotedBold Bold
hi! link asciidocQuotedEmphasized Italic
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownLinkText

call s:hi("awkCharClass", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("awkPatterns", s:nord9_gui, "", s:nord9_term, "", s:bold, "")
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi("cIncluded", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

call s:hi("cmakeGeneratorExpression", s:nord10_gui, "", s:nord10_term, "", "", "")

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("cssDefinition", s:nord7_gui, "", s:nord7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:nord7_gui, "", s:nord7_term, "", s:underline, "")
call s:hi("cssStringQ", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:nord8_gui, "", s:nord8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("dtExecKey", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("dtLocaleKey", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("dtNumericKey", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("dtTypeKey", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:nord_uniform_diff_background == 0
  call s:hi("DiffAdd", s:nord14_gui, s:nord0_gui, s:nord14_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:nord13_gui, s:nord0_gui, s:nord13_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:nord11_gui, s:nord0_gui, s:nord11_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:nord9_gui, s:nord0_gui, s:nord9_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:nord14_gui, s:nord1_gui, s:nord14_term, s:nord1_term, "", "")
  call s:hi("DiffChange", s:nord13_gui, s:nord1_gui, s:nord13_term, s:nord1_term, "", "")
  call s:hi("DiffDelete", s:nord11_gui, s:nord1_gui, s:nord11_term, s:nord1_term, "", "")
  call s:hi("DiffText", s:nord9_gui, s:nord1_gui, s:nord9_term, s:nord1_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:nord7_gui, "", s:nord7_term, "", "", "")

call s:hi("goBuiltins", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:nord3_gui, "", s:nord3_term, "", "", "")
call s:hi("helpHyperTextJump", s:nord8_gui, "", s:nord8_term, "", s:underline, "")

call s:hi("htmlArg", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("htmlLink", s:nord4_gui, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:nord7_gui, "", s:nord7_term, "", "", "")

call s:hi("lessClass", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownCode", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownFootnote", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownId", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownH1", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("markdownLinkText", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("markdownUrl", s:nord4_gui, "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", s:nord7_gui, "", s:nord7_term, "", "", "")

call s:hi("phpClasses", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("phpClass", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("phpDocTags", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword
hi! link phpMethod Function
hi! link phpFunction Function

call s:hi("podCmdText", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("podVerbatimLine", s:nord4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("rubySymbol", s:nord6_gui, "", s:nord6_term, "", s:bold, "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("rustAttribute", s:nord10_gui, "", s:nord10_term, "", "", "")
call s:hi("rustEnum", s:nord7_gui, "", s:nord7_term, "", s:bold, "")
call s:hi("rustMacro", s:nord8_gui, "", s:nord8_term, "", s:bold, "")
call s:hi("rustModPath", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("rustPanic", s:nord9_gui, "", s:nord9_term, "", s:bold, "")
call s:hi("rustTrait", s:nord7_gui, "", s:nord7_term, "", s:italic, "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi("sassClass", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("sassId", s:nord7_gui, "", s:nord7_term, "", s:underline, "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("vimMapRhs", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("vimNotation", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("xmlCdataStart", s:nord3_gui_bright, "", s:nord3_term, "", s:bold, "")
call s:hi("xmlNamespace", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("ALEErrorSign" , s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("ALEWarning" , s:nord13_gui, "", s:nord13_term, "", "undercurl", "")
call s:hi("ALEError" , s:nord11_gui, "", s:nord11_term, "", "undercurl", "")

" Coc
" > neoclide/coc
call s:hi("CocWarningHighlight" , s:nord13_gui, "", s:nord13_term, "", "undercurl", "")
call s:hi("CocErrorHighlight" , s:nord11_gui, "", s:nord11_term, "", "undercurl", "")
call s:hi("CocWarningSign", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("CocErrorSign" , s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("CocInfoSign" , s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("CocHintSign" , s:nord10_gui, "", s:nord10_term, "", "", "")

" Nvim LSP
" > neovim/nvim-lsp
call s:hi("LSPDiagnosticsWarning", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("LSPDiagnosticsError" , s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("LSPDiagnosticsInformation" , s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("LSPDiagnosticsHint" , s:nord10_gui, "", s:nord10_term, "", "", "")

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:nord14_gui, "", s:nord14_term, "", "", "")
call s:hi("GitGutterChange", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("GitGutterDelete", s:nord11_gui, "", s:nord11_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:nord14_gui, "", s:nord14_term, "", "", "")
call s:hi("SignifySignChange", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("SignifySignDelete", s:nord11_gui, "", s:nord11_term, "", "", "")

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:nord14_gui, "", s:nord14_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:nord4_gui, s:nord3_gui, "", s:nord3_term, "", "")
call s:hi("jediFat", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, s:underline.s:bold, "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-clap
" > liuchengxu/vim-clap
call s:hi("ClapDir", s:nord4_gui, "", "", "", "", "")
call s:hi("ClapDisplay", s:nord4_gui, s:nord1_gui, "", s:nord1_term, "", "")
call s:hi("ClapFile", s:nord4_gui, "", "", "NONE", "", "")
call s:hi("ClapMatches", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("ClapNoMatchesFound", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("ClapSelected", s:nord7_gui, "", s:nord7_term, "", s:bold, "")
call s:hi("ClapSelectedSign", s:nord9_gui, "", s:nord9_term, "", "", "")

let s:clap_matches = [
        \ [s:nord8_gui,  s:nord8_term] ,
        \ [s:nord9_gui,  s:nord9_term] ,
        \ [s:nord10_gui, s:nord10_term] ,
        \ ]
for s:nord_clap_match_i in range(1,12)
  let clap_match_color = s:clap_matches[s:nord_clap_match_i % len(s:clap_matches) - 1]
  call s:hi("ClapMatches" . s:nord_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
  call s:hi("ClapFuzzyMatches" . s:nord_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
endfor
unlet s:nord_clap_match_i

hi! link ClapCurrentSelection PmenuSel
hi! link ClapCurrentSelectionSign ClapSelectedSign
hi! link ClapInput Pmenu
hi! link ClapPreview Pmenu
hi! link ClapProviderAbout ClapDisplay
hi! link ClapProviderColon Type
hi! link ClapProviderId Type

" vim-indent-guides
" > nathanaelkane/vim-indent-guides
call s:hi("IndentGuidesEven", "", s:nord1_gui, "", s:nord1_term, "", "")
call s:hi("IndentGuidesOdd", "", s:nord2_gui, "", s:nord3_term, "", "")

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:nord11_gui, "", "", s:nord11_term, "", "")

" vim-signature
" > kshenoy/vim-signature
call s:hi("SignatureMarkText", s:nord8_gui, "", s:nord8_term, "", "", "")

" vim-startify
" > mhinz/vim-startify
call s:hi("StartifyFile", s:nord6_gui, "", s:nord6_term, "", "", "")
call s:hi("StartifyFooter", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("StartifyHeader", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("StartifyNumber", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("StartifyPath", s:nord8_gui, "", s:nord8_term, "", "", "")
hi! link StartifyBracket Delimiter
hi! link StartifySlash Normal
hi! link StartifySpecial Comment

"+--- Languages ---+
" Haskell
" > neovimhaskell/haskell-vim
call s:hi("haskellPreProc", s:nord10_gui, "", s:nord10_term, "", "", "")
call s:hi("haskellType", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link haskellPragma haskellPreProc

" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:nord8_gui, "", s:nord8_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" TypeScript
" > HerringtonDarkholme/yats.vim
call s:hi("typescriptBOMWindowMethod", s:nord8_gui, "", s:nord8_term, "", s:italic, "")
call s:hi("typescriptClassName", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("typescriptDecorator", s:nord12_gui, "", s:nord12_term, "", "", "")
call s:hi("typescriptInterfaceName", s:nord7_gui, "", s:nord7_term, "", s:bold, "")
call s:hi("typescriptRegexpString", s:nord13_gui, "", s:nord13_term, "", "", "")
" TypeScript JSX
 call s:hi("tsxAttrib", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link typescriptOperator Operator
hi! link typescriptBinaryOp Operator
hi! link typescriptAssign Operator
hi! link typescriptMember Identifier
hi! link typescriptDOMStorageMethod Identifier
hi! link typescriptArrowFuncArg Identifier
hi! link typescriptGlobal typescriptClassName
hi! link typescriptBOMWindowProp Function
hi! link typescriptArrowFuncDef Function
hi! link typescriptAliasDeclaration Function
hi! link typescriptPredefinedType Type
hi! link typescriptTypeReference typescriptClassName
hi! link typescriptTypeAnnotation Structure
hi! link typescriptDocNamedParamType SpecialComment
hi! link typescriptDocNotation Keyword
hi! link typescriptDocTags Keyword
hi! link typescriptImport Keyword
hi! link typescriptExport Keyword
hi! link typescriptTry Keyword
hi! link typescriptVariable Keyword
hi! link typescriptBraces Normal
hi! link typescriptObjectLabel Normal
hi! link typescriptCall Normal
hi! link typescriptClassHeritage typescriptClassName
hi! link typescriptFuncTypeArrow Structure
hi! link typescriptMemberOptionality Structure
hi! link typescriptNodeGlobal typescriptGlobal
hi! link typescriptTypeBrackets Structure
hi! link tsxEqual Operator
hi! link tsxIntrinsicTagName htmlTag
hi! link tsxTagName tsxIntrinsicTagName

" Markdown
" > plasticboy/vim-markdown
call s:hi("mkdCode", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("mkdFootnote", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("mkdRule", s:nord10_gui, "", s:nord10_term, "", "", "")
call s:hi("mkdLineBreak", s:nord9_gui, "", s:nord9_term, "", "", "")
hi! link mkdBold Bold
hi! link mkdItalic Italic
hi! link mkdString Keyword
hi! link mkdCodeStart mkdCode
hi! link mkdCodeEnd mkdCode
hi! link mkdBlockquote Comment
hi! link mkdListItem Keyword
hi! link mkdListItemLine Normal
hi! link mkdFootnotes mkdFootnote
hi! link mkdLink markdownLinkText
hi! link mkdURL markdownUrl
hi! link mkdInlineURL mkdURL
hi! link mkdID Identifier
hi! link mkdLinkDef mkdLink
hi! link mkdLinkDefTarget mkdURL
hi! link mkdLinkTitle mkdInlineURL
hi! link mkdDelimiter Keyword

" Vimwiki
" > vimwiki/vimwiki
if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:nord8_gui, "", s:nord8_term, "", s:bold, "")
  endfor
else
  let s:vimwiki_hcolor_guifg = [s:nord7_gui, s:nord8_gui, s:nord9_gui, s:nord10_gui, s:nord14_gui, s:nord15_gui]
  let s:vimwiki_hcolor_ctermfg = [s:nord7_term, s:nord8_term, s:nord9_term, s:nord10_term, s:nord14_term, s:nord15_term]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:vimwiki_hcolor_guifg[s:i-1] , "", s:vimwiki_hcolor_ctermfg[s:i-1], "", s:bold, "")
  endfor
endif

call s:hi("VimwikiLink", s:nord8_gui, "", s:nord8_term, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:nord7_gui, "", s:nord7_term, "", "", "")




hi ColorColumn guifg=NONE ctermfg=NONE guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi Cursor guifg=#2e3440 ctermfg=237 guibg=#d8dee9 ctermbg=254 gui=NONE cterm=NONE
hi CursorLine guifg=NONE ctermfg=NONE guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi Error guifg=#d8dee9 ctermfg=254 guibg=#bf616a ctermbg=131 gui=NONE cterm=NONE
hi LineNr guifg=#4c566a ctermfg=240 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#88c0d0 ctermfg=110 guibg=#4c566a ctermbg=240 gui=NONE cterm=NONE
hi NonText guifg=#434c5e ctermfg=239 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Normal guifg=#d8dee9 ctermfg=254 guibg=#2e3440 ctermbg=237 gui=NONE cterm=NONE
hi Pmenu guifg=#d8dee9 ctermfg=254 guibg=#434c5e ctermbg=239 gui=NONE cterm=NONE
hi PmenuSbar guifg=#d8dee9 ctermfg=254 guibg=#434c5e ctermbg=239 gui=NONE cterm=NONE
hi PmenuSel guifg=#88c0d0 ctermfg=110 guibg=#4c566a ctermbg=240 gui=NONE cterm=NONE
hi PmenuThumb guifg=#88c0d0 ctermfg=110 guibg=#4c566a ctermbg=240 gui=NONE cterm=NONE
hi SpecialKey guifg=#4c566a ctermfg=240 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=#bf616a ctermfg=131 guibg=#2e3440 ctermbg=237 gui=underline cterm=underline
hi SpellCap guifg=#ebcb8b ctermfg=222 guibg=#88c0d0 ctermbg=110 gui=underline cterm=underline
hi SpellLocal guifg=#e5e9f0 ctermfg=255 guibg=#2e3440 ctermbg=237 gui=underline cterm=underline
hi SpellRare guifg=#eceff4 ctermfg=255 guibg=#2e3440 ctermbg=237 gui=underline cterm=underline
hi Visual guifg=NONE ctermfg=NONE guibg=#434c5e ctermbg=239 gui=NONE cterm=NONE
hi VisualNOS guifg=NONE ctermfg=NONE guibg=#434c5e ctermbg=239 gui=NONE cterm=NONE
hi QuickFixLine guifg=#2e3440 ctermfg=237 guibg=#ebcb8b ctermbg=222 gui=NONE cterm=NONE
hi Terminal guifg=#eceff4 ctermfg=255 guibg=#2e3440 ctermbg=237 gui=NONE cterm=NONE
hi healthError guifg=#bf616a ctermfg=131 guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi healthSuccess guifg=#a3be8c ctermfg=144 guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi healthWarning guifg=#ebcb8b ctermfg=222 guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi CursorColumn guifg=NONE ctermfg=NONE guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi CursorLineNr guifg=#d8dee9 ctermfg=254 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Folded guifg=#4c566a ctermfg=240 guibg=#2e3440 ctermbg=237 gui=NONE cterm=NONE
hi FoldColumn guifg=#4c566a ctermfg=240 guibg=#2e3440 ctermbg=237 gui=NONE cterm=NONE
hi SignColumn guifg=#3b4252 ctermfg=238 guibg=#2e3440 ctermbg=237 gui=NONE cterm=NONE
hi Directory guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#3b4252 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#d8dee9 ctermfg=254 guibg=#bf616a ctermbg=131 gui=NONE cterm=NONE
hi ModeMsg guifg=#d8dee9 ctermfg=254 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi MoreMsg guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Question guifg=#d8dee9 ctermfg=254 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#eceff4 ctermfg=255 guibg=#4c566a ctermbg=240 gui=NONE cterm=NONE
hi StatusLineNC guifg=#d8dee9 ctermfg=254 guibg=#4c566a ctermbg=240 gui=NONE cterm=NONE
hi StatusLineTerm guifg=#88c0d0 ctermfg=110 guibg=#4c566a ctermbg=240 gui=NONE cterm=NONE
hi StatusLineTermNC guifg=#d8dee9 ctermfg=254 guibg=#4c566a ctermbg=240 gui=NONE cterm=NONE
hi WarningMsg guifg=#2e3440 ctermfg=237 guibg=#ebcb8b ctermbg=222 gui=NONE cterm=NONE
hi WildMenu guifg=#88c0d0 ctermfg=110 guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi IncSearch guifg=#2e3440 ctermfg=237 guibg=#ebcb8b ctermbg=222 gui=underline cterm=underline
hi Search guifg=#2e3440 ctermfg=237 guibg=#ebcb8b ctermbg=222 gui=NONE cterm=NONE
hi TabLine guifg=#d8dee9 ctermfg=254 guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi TabLineFill guifg=#d8dee9 ctermfg=254 guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi TabLineSel guifg=#88c0d0 ctermfg=110 guibg=#4c566a ctermbg=240 gui=NONE cterm=NONE
hi Title guifg=#d8dee9 ctermfg=254 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=#434c5e ctermfg=239 guibg=#2e3440 ctermbg=237 gui=NONE cterm=NONE
hi Boolean guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Character guifg=#a3be8c ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Comment guifg=#616e88 ctermfg=60 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Conditional guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Constant guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Define guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Delimeter guifg=#eceff4 ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Exception guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Float guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Function guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#d8dee9 ctermfg=254 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Include guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Label guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Number guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Operator guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Repeat guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Special guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpecialChar guifg=#ebcb8b ctermfg=222 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpecialComment guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Statement guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StorageClass guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi String guifg=#a3be8c ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Structure guifg=#ebcb8b ctermfg=222 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Tag guifg=#d8dee9 ctermfg=254 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Todo guifg=#ebcb8b ctermfg=222 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Type guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Typedef guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Macro guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#a3be8c ctermfg=144 guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi DiffChange guifg=#ebcb8b ctermfg=222 guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi DiffDelete guifg=#bf616a ctermfg=131 guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi DiffText guifg=#81a1c1 ctermfg=109 guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi diffAdded guifg=#a3be8c ctermfg=144 guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi diffChanged guifg=#ebcb8b ctermfg=222 guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi diffRemoved guifg=#bf616a ctermfg=131 guibg=#3b4252 ctermbg=238 gui=NONE cterm=NONE
hi diffFileId guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi diffFile guifg=#3b4048 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffNewFile guifg=#a3be8c ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffOldFile guifg=#bf616a ctermfg=131 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitconfigVariable guifg=#8fbcbb ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi debugPc guifg=NONE ctermfg=NONE guibg=#8fbcbb ctermbg=109 gui=NONE cterm=NONE
hi debugBreakpoint guifg=#bf616a ctermfg=131 guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi TSError guifg=#bf616a ctermfg=131 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi TSPunctDelimiter guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctBracket guifg=#eceff4 ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctSpecial guifg=#eceff4 ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstant guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstBuiltin guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstMacro guifg=#8fbcbb ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStringRegex guifg=#a3be8c ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSString guifg=#a3be8c ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStringEscape guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSCharacter guifg=#a3be8c ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSNumber guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSBoolean guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFloat guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSAnnotation guifg=#d08770 ctermfg=173 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSAttribute guifg=#8fbcbb ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSNamespace guifg=#8FBCBB ctermfg=201 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFuncBuiltin guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFunction guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFuncMacro guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSParameter guifg=#e5e9f0 ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSParameterReference guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSMethod guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSField guifg=#e5e9f0 ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSProperty guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstructor guifg=#8fbcbb ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConditional guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSRepeat guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSLabel guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSKeyword guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSKeywordFunction guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSKeywordOperator guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSOperator guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSException guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSType guifg=#8fbcbb ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTypeBuiltin guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStructure guifg=#8FBCBB ctermfg=201 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSInclude guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSVariable guifg=#e5e9f0 ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSVariableBuiltin guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSText guifg=#D8DEE9 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStrong guifg=#D8DEE9 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSEmphasis guifg=#D8DEE9 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSUnderline guifg=#D8DEE9 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTitle guifg=#D8DEE9 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSLiteral guifg=#D8DEE9 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSURI guifg=#D8DEE9 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTag guifg=#81a1c1 ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTagDelimiter guifg=#5c6370 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlArg guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlBold guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi htmlEndTag guifg=#eceff4 ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH1 guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH2 guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH3 guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH4 guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH5 guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH6 guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlItalic guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi htmlLink guifg=#8fbcbb ctermfg=109 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi htmlSpecialChar guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlSpecialTagName guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlTag guifg=#eceff4 ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlTagN guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlTagName guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlTitle guifg=#eceff4 ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownBlockquote guifg=#5c6370 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownBold guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownCode guifg=#a3be8c ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownCodeBlock guifg=#a3be8c ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownCodeDelimiter guifg=#a3be8c ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH1 guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH2 guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH3 guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH4 guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH5 guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH6 guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownHeadingDelimiter guifg=#bf616a ctermfg=131 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownHeadingRule guifg=#5c6370 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownId guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownIdDeclaration guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownIdDelimiter guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownItalic guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi markdownLinkDelimiter guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownLinkText guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownListMarker guifg=#bf616a ctermfg=131 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownOrdenord11ListMarker guifg=#bf616a ctermfg=131 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownRule guifg=#5c6370 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownUrl guifg=#8fbcbb ctermfg=109 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi CocExplorerIndentLine guifg=#5c6370 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerBufferRoot guifg=#8fbcbb ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerFileRoot guifg=#8fbcbb ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerBufferFullPath guifg=#5c6370 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerFileFullPath guifg=#5c6370 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerBufferReadonly guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerBufferModified guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerBufferNameVisible guifg=#d08770 ctermfg=173 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerFileReadonly guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerFileModified guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerFileHidden guifg=#5c6370 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerHelpLine guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi EasyMotionTarget guifg=#bf616a ctermfg=131 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi EasyMotionTarget2First guifg=#bf616a ctermfg=131 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi EasyMotionTarget2Second guifg=#bf616a ctermfg=131 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi EasyMotionShade guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyNumber guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifySelect guifg=#a3be8c ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyBracket guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifySpecial guifg=#8fbcbb ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyVar guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyPath guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyFile guifg=#8fbcbb ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifySlash guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyHeader guifg=#a3be8c ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifySection guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyFooter guifg=#a3be8c ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WhichKey guifg=#b48ead ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WhichKeySeperator guifg=#a3be8c ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WhichKeyGroup guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitGutterAdd guifg=#a3be8c ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitGutterChange guifg=#ebcb8b ctermfg=222 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitGutterChangeDelete guifg=#bf616a ctermfg=131 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitGutterDelete guifg=#bf616a ctermfg=131 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitcommitDiscardedFile guifg=#bf616a ctermfg=131 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitcommitSelectedFile guifg=#a3be8c ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitcommitUntrackedFile guifg=#bf616a ctermfg=131 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LSPDiagnosticsWarning guifg=#ebcb8b ctermfg=222 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsDefaultError guifg=#bf616a ctermfg=131 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsInformation guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsHint guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsUnderlineWarning guifg=#ebcb8b ctermfg=222 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsUnderlineError guifg=#bf616a ctermfg=131 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsUnderlineInformation guifg=#88c0d0 ctermfg=110 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsUnderlineHint guifg=#5e81ac ctermfg=67 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
