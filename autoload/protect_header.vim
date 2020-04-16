let g:Protect_Header_Skip_Epitech_Header =
            \ get(g:, 'Protect_Header_Skip_Epitech_Header')

function! protect_header#Protect()
    let extension = expand('%:e')
    let filename = expand('%:t:r')
    let first_index = 0

    if g:Protect_Header_Skip_Epitech_Header == 1
        if stridx(getline(2), "EPITECH PROJECT,") != -1
            let first_index = 7
        endif
    endif

    if !exists("g:Protect_Header_Endif_Comment")
        let g:Protect_Header_Endif_Comment = 0
    endif

    if extension !=# "h" && extension !=# "hpp"
        echo "This is not a header file"
    endif

    let ext = "_" . toupper(extension)
    let gate_name = toupper(filename) . ext

    call append(first_index, "#ifndef ". gate_name)
    call append(first_index + 1, "#define " . gate_name)
    call append(first_index + 2, "")
    if g:Protect_Header_Endif_Comment
        call append(line('$'), "#endif // " . gate_name)
    else
        call append(line('$'), "#endif")
    endif
endfunction
