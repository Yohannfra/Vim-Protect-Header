function! protect_header#Protect()
    let extension = expand('%:e')
    let filename = expand('%:t:r')

    if !exists("g:Protect_Header_Endif_Comment")
        let g:Protect_Header_Endif_Comment = 0
    endif

    if !exists("g:Protect_Header_cpp_extern_c")
        let g:Protect_Header_cpp_extern_c = 0
    endif


    if extension !=# "h" && extension !=# "hpp"
        echo "This is not a header file"
    endif

    let ext = "_" . toupper(extension)
    let gate_name = toupper(filename) . ext

    call append(line('$'), "#ifndef ". gate_name)
    call append(line('$'), "#define " . gate_name)
    call append(line('$'), "")

    if g:Protect_Header_cpp_extern_c 

    call append(line('$'), "#ifdef __cplusplus")
    call append(line('$'), "extern \"C\" {")
    call append(line('$'), "#endif")
    call append(line('$'), "")
    call append(line('$'), "#ifdef __cplusplus")
    call append(line('$'), "}")
    call append(line('$'), "#endif")
    call append(line('$'), "")
    endif

    if g:Protect_Header_Endif_Comment
        call append(line('$'), "#endif // " . gate_name)
    else
        call append(line('$'), "#endif")
    endif
endfunction
