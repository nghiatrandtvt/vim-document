" open file at cursor
function! OpenFileAtCursor()
    let l:filepath = expand('<cfile>')

    if !isdirectory(l:filepath) && !filereadable(l:filepath)
        let l:filepath = expand('%:p:h') . '/' . l:filepath
    endif

    if filereadable(l:filepath)
        execute 'tabedit ' . fnameescape(l:filepath)
    else
        echo "No such file: " . l:filepath
    endif
endfunction

function! OpenFileWithPath()
    let l:filepath = expand('<cfile>')
	echo "Opening file: " . l:filepath
	let l:path = input("Enter file path: ", getcwd(), "file")
	if empty(l:path)
		echo("No file path provided.")
		return
	endif

    let l:filepath = l:path . '/' . l:filepath

    if filereadable(l:filepath)
        execute 'tabedit ' . fnameescape(l:filepath)
    else
        echo "No such file: " . l:filepath
    endif
endfunction

function! GotoDirAtCursor()
    let l:filepath = expand('<cfile>')
    if isdirectory(l:filepath)
        echo l:filepath . " existed."
        let l:dirpath  = l:filepath
    elseif filereadable(l:filepath)
        echo l:filepath . " is readable file. Removing the filename."
        let dirpath = fnamemodify(l:filepath, ':h')
    else
        echo l:filepath . " is not directory nor readable file. Expanding with head of current file."
        let l:dirpath = expand('%:p:h') . '/' . l:filepath
        let dirpath = fnamemodify(l:filepath, ':h')
    endif
 
    if isdirectory(l:dirpath)
        echo "Jumping to: " . l:dirpath
        execute 'tabnew | terminal cd ' . fnameescape(l:dirpath) . ' && ' . $SHELL
        call feedkeys("cd " . l:dirpath . " && " . $SHELL . "\<CR>")
    else
        echo "No such file: " . l:dirpath
    endif
endfunction
