if v:version < 600
	syntax clear
elseif exists('b:current_syntax')
	finish
endif

syntax spell notoplevel

" don't use standard HiLink, it will not work with included syntax files
if v:version < 508
	command! -nargs=+ NushellHiLink hi link <args>
else
	command! -nargs=+ NushellHiLink hi def link <args>
endif

syntax match nushellComment "\v#.*$"
highlight link nushellComment Comment

syntax keyword nushellKeyword module use export def def-env extern
syntax keyword nushellKeyword alias let let-env
NushellHiLink nushellKeyword Keyword

syntax match nushellOperator "\v\="
syntax match nushellOperator "\v\=\~"
NushellHiLink nushellOperator Operator

syntax region nushellString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region nushellString start=/\v`/ skip=/\v\\./ end=/\v`/
syntax region nushellString start=/\v'/ skip=/\v\\./ end=/\v'/
NushellHiLink nushellString String


delcommand NushellHiLink

let b:current_syntax = "nushell"
