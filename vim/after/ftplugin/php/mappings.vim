" # Tabular
" ## For PHP array and regular assignments.
if mapcheck("<F8>") == ""
	nmap <unique><silent> <F8> :Tabularize /^[^=]*\zs=>\?/l1c1l0<CR>
	vmap <unique><silent> <F8> :Tabularize /^[^=]*\zs=>\?/l1c1l0<CR>
	imap <unique><silent> <F8> <ESC>:Tabularize /^[^=]*\zs=>\?/l1c1l0<CR>i
endif
