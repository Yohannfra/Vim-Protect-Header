" vim plugin to protect C or CPP headers
" Assouline Yohann
" 2019

if exists('g:protect_header_loadded')
    finish
endif

let g:protect_header_loadded = 1

command! Protect :call protect_header#Protect()
