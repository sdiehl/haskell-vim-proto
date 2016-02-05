" Vim syntax file
" Language:     Alex config language
" Maintainer:   Nickolay Kudasov <false.developer@gmail.com>
" Last Change:  March 16, 2010
"
" Version:      0.2
" Changes:      $ and @ are now part of identifier
"               so auto complete works well
"               haskell directives are now regocnized
"               hightlighting fixmes
"               hightlighting todos and fixmes in haskell comments

if exists("b:current_syntax")
    finish
endif

" macro definitions start with $ for sets and @ for regexps
" so we add this symbols to isident to make autocompletion work properly
set isident+=$
set isident+=@

" Haskell code in alex file
syn match haskell_comment  /--.*$/ contained contains=alex_todo,alex_fixme
syn match haskell_char /'[^\\]'\|'\\.'/ contained

syn region haskell_string           start=/"/ skip=/\\"/ end=/"/        contained
syn region haskell_block_comment    start=/{-/ end=/-}/                 fold contained contains=haskell_block_comment,alex_todo,alex_fixme
syn region haskell_directive        start=/{-#/ end=/#-}/               contained
syn region haskell_code             start=/{/ skip=/'\\\?}'/ end=/}/    fold contains=haskell_comment,haskell_block_comment,haskell_string,haskell_char,haskell_code,haskell_directive

" Comments in alex file
syn match alex_comment  /--.*$/ contains=alex_todo,alex_fixme
syn match alex_todo     /[tT][oO][dD][oO]/ contained
syn match alex_fixme    /[fF][iI][xX][mM][eE]/ contained

" String representing ordered set of characters for regexp matching
syn region alex_string  start=/"/ skip=/\\"/ end=/"/

" Sets of characters
syn match alex_char     /\(\\x[\da-fA-F]\+\|\\o[0-7]\+\|\\\?\d\+\|\\.\|[a-zA-Z_]\)/
syn match alex_anychar  /\./
syn match alex_range    /\(\\x[\da-fA-F]\+\|\\o[0-7]\+\|\\\?\d\+\|\\.\|[a-zA-Z_]\)\(-\(\\x[\da-fA-F]\+\|\\o[0-7]\+\|\\\?\d\+\|\\.\|[a-zA-Z_]\)\)\?/
syn match alex_set      /$[a-zA-Z_][a-zA-Z_\d]*/
syn match alex_setcompl /\~\(\\x[\da-fA-F]\+\|\\o[0-7]\+\|\\\?\d\+\|\\.\|[a-zA-Z_]\)/he=s+1,me=s+1
syn match alex_setcompl /\~\./
syn match alex_setcompl /\~\(\\x[\da-fA-F]\+\|\\o[0-7]\+\|\\\?\d\+\|\\.\|[a-zA-Z_]\)\(-\(\\x[\da-fA-F]\+\|\\o[0-7]\+\|\\\?\d\+\|\\.\|[a-zA-Z_]\)\)\?/he=s+1,me=s+1
syn match alex_setcompl /\~$[a-zA-Z_][a-zA-Z_\d]*/he=s+1,me=s+1
syn match alex_setspec  /[\^.$]/ contained
syn region alex_sets start="\[" skip="\\]" end="]" contains=alex_char,alex_anychar,alex_range,alex_set,alex_setcompl,alex_sets,alex_setspec

" Regular expressions
syn match alex_regexp   /@[a-zA-Z_][a-zA-Z_\d]*/
syn match alex_rexpspec /[*+?]/
syn match alex_repeat   /{\d\+\(\,\d*\)\?}/

" Keywords
syn keyword alex_keywords wrapper tokens

hi def link haskell_comment         Comment
hi def link haskell_block_comment   Comment
hi def link haskell_directive       Special
hi def link haskell_char            Character
hi def link haskell_string          String

hi def link alex_comment            Comment
hi def link alex_todo               Todo
hi def link alex_fixme              Todo
hi def link alex_string             String
hi def link alex_char               Character
hi def link alex_range              Character
hi def link alex_anychar            Special
hi def link alex_setcompl           Special
hi def link alex_setspec            Special
hi def link alex_rexpspec           Special
hi def link alex_repeat             Special
hi def link alex_set                Identifier
hi def link alex_regexp             Function
hi def link alex_keywords           Keyword

" Syntax configuration name
let b:current_syntax = "alex"
