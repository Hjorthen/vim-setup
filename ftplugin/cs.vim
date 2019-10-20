let g:OmniSharp_timeout = 10
nnoremap <buffer>gd :OmniSharpGotoDefinition<CR>
nnoremap <buffer><LocalLeader>fs :OmniSharpFindSymbol<CR>
nnoremap <buffer><LocalLeader>r  :OmniSharpRename<CR>
nnoremap <buffer><LocalLeader>d  :OmniSharpDocumentation<CR>
nnoremap <buffer><LocalLeader>fi :OmniSharpFindImplementations<CR>
nnoremap <buffer><LocalLeader>fu :OmniSharpFindUsages<CR>
nnoremap <buffer><LocalLeader>fc :OmniSharpCodeFormat<CR>
nnoremap <buffer><LocalLeader>fm :OmniSharpFindMembers<CR>
nnoremap <buffer><LocalLeader><space> :OmniSharpGetCodeActions<CR>
" Make ALE not use its internal linter
let b:ale_linters_explicit = 1
let b:ale_linters = {'cs': ['omnisharp']}
autocmd BufWritePre *.cs :OmniSharpHighlightTypes 
"Enable autocomplete
let OmniSharp_want_snippet=1
