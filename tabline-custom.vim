" tab display
function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        let tabnr = i + 1
        let winnr = tabpagewinnr(tabnr)
        let bufnr = tabpagebuflist(tabnr)[winnr - 1]
        let bufname = bufname(bufnr)
        let filename = fnamemodify(bufname, ':t')
        let s .= (tabnr == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        let s .= ' ' . tabnr . ':' . (filename == '' ? '[No Name]' : filename) . ' '
    endfor
    let s .= '%#TabLineFill#'
    return s
endfunction
set tabline=%!MyTabLine()