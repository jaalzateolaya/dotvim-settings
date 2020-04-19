" # Tabular
" ## For JavaScript array and regular assignments.
if mapcheck("<F8>") == ""
	nmap <unique><silent> <F8> :Tabularize /=\ze[^>]\\|from\\|\w\s*\zs:\)/l1c1l0<CR>
	vmap <unique><silent> <F8> :Tabularize /=\ze[^>]\\|from\\|\w\s*\zs:\)/l1c1l0<CR>
	imap <unique><silent> <F8> <ESC>:Tabularize /=\ze[^>]\\|from\\|\w\s*\zs:\)/l1c1l0<CR>i
endif
