" Vim syntax file
" Language:     Happy file language
" Maintainer:   Nickolay Kudasov
" Last Change:  18 March, 2010
"
" Version:      0.2
" Changes:      ' is now part of non-terminals
"               highlighting todos and fixmes in haskell comments
"               highlighting haskell directives

if exists("b:current_syntax")
    finish
endif

" Keywords (e.g. %name) start with %, so we add it to keyword characters
set iskeyword+=%

" ' is allowed in non-terminals
set isident+='

" Haskell code in happy file
syn match haskell_comment  /--.*$/ contained contains=happy_todo,happy_fixme
syn match haskell_char /'[^\\]'\|'\\.'/ contained

syn region haskell_string           start=/"/ skip=/\\"/ end=/"/        contained
syn region haskell_block_comment    start=/{-/ end=/-}/                 fold contained contains=haskell_block_comment,happy_todo,happy_fixme
syn region haskell_directive        start=/{-#/ end=/#-}/               contained
syn region haskell_code             start=/{/ skip=/'\\\?}'/ end=/}/    fold contains=haskell_comment,haskell_block_comment,haskell_string,haskell_char,haskell_code,haskell_directive

" Comments in happy file
syn match happy_comment  /--.*$/ contains=happy_todo,happy_fixme
syn region happy_block_comment  start=/{-/ end=/-}/ fold contains=happy_block_comment,happy_todo,happy_fixme
syn match happy_todo     /[tT][oO][dD][oO]/ contained
syn match happy_fixme    /[fF][iI][xX][mM][eE]/ contained

" Module header directives
syn keyword happy_directives    %tokentype %partial
syn keyword happy_directives    %monad %lexer
syn keyword happy_directives    %expect %error
syn keyword happy_directives    %attributetype %attribute

" %name directive
syn match parser_name   /[a-zA-Z_][a-zA-Z_\d]*/ contained
syn region happy_names  matchgroup=happy_directives start=/%name/       end=/%/me=e-1,he=e-1 contains=happy_name,parser_name,happy_comment

" %token and association directives
syn match token_name    /[a-zA-Z_][a-zA-Z_\d]*/         contained
syn region token_name   start=/"/ skip=/\\"/ end=/"/    contained
syn region token_name   start=/'/ skip=/\\'/ end=/'/    contained

syn region happy_tokens matchgroup=happy_directives start=/%token/      end=/%/me=e-1,he=e-1 contains=token_name,haskell_code,happy_comment
syn region happy_assoc  matchgroup=happy_directives start=/%left/       end=/%/me=e-1,he=e-1 contains=token_name,haskell_code,happy_comment
syn region happy_assoc  matchgroup=happy_directives start=/%right/      end=/%/me=e-1,he=e-1 contains=token_name,haskell_code,happy_comment
syn region happy_assoc  matchgroup=happy_directives start=/%nonassoc/   end=/%/me=e-1,he=e-1 contains=token_name,haskell_code,happy_comment

syn match happy_separator   /%%/

" Happy grammar
syn match non_terminal  /[a-zA-Z_][a-zA-Z_\d\']*/         
syn region terminal     start=/"/ skip=/\\"/ end=/"/    
syn region terminal     start=/'/ skip=/\\'/ end=/'/    

hi def link haskell_comment         Comment
hi def link haskell_block_comment   Comment
hi def link haskell_directive       Special
hi def link haskell_char            Character
hi def link haskell_string          String

hi def link happy_comment           Comment
hi def link happy_block_comment     Comment
hi def link happy_todo              Todo
hi def link happy_fixme             Todo
hi def link parser_name             Function
hi def link token_name              Identifier
hi def link happy_directives        Keyword
hi def link happy_separator         Special
hi def link non_terminal            Identifier
hi def link terminal                String

" Syntax configuration name
let b:current_syntax = "happy"
