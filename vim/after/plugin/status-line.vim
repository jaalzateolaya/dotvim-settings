" Personal ViM Status Line
"
" File: status-line.vim
" Author: Jhonny Alexander Alzate Olaya <jhonnyalexander_91@yahoo.es>
" Description: Personal status line plugin
" Last Modified: August 11, 2017
" License: GNU GPL v3

function! s:git_status_line ()
	if empty (fugitive#head ())
		return ""
	endif

	let color = ""
	if fugitive#head () == "master"
		let color = "%#ErrorMsg#"
	elseif fugitive#head () =~ "devel"
		let color ="%#MoreMsg#"
	endif

	return color . "%{fugitive#statusline()}%*"
endfunction

function! MyStatusLine ()
	let statusline  = s:git_status_line ()

	let statusline .= "%#Directory# %f %*"

	" read only, modified, modifiable flags in brackets
	let statusline .=" %([%R%M]%) "

	" right-align everything past this point
	let statusline.= "%= "

	" file type (eg. python, ruby, etc..)
	let statusline.= "%Y "
	"
	" file format (eg. unix, dos, etc..)
	let statusline.= "%{&fileformat} "

	" file encoding (eg. utf8, latin1, etc..)
	let statusline.= "%(%{(&fenc!=''?&fenc:&enc)}%)"

	return statusline
endfunction

set laststatus =2
set statusline =%!MyStatusLine()

