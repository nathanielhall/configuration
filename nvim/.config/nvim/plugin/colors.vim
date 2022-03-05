let g:my_colorscheme = 'cobalt2'
"let g:my_colorscheme = 'gruvbox'

fun! ColorMyPencils()
    let g:gruvbox_contrast_dark = 'hard'
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    let g:gruvbox_invert_selection='0'
    let g:github_function_style = "italic"
    let g:github_sidebars = ["qf", "vista_kind", "terminal", "packer"]

    let g:javascript_plugin_jsdoc = 1
    let g:vim_jsx_pretty_colorful_config = 1 " default 0

    set background=dark
    if has('nvim')
        call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:my_colorscheme])
    else
        exe 'colorscheme' g:my_colorscheme
    endif
    "
    hi! tsxFunction guifg=#EE80E1
    hi! tsFunction  guifg=#EE80E1

    "let g:light_pink = "EE80E1"
    "call s:X("tsFunction",g:light_pink,"","","","")
    "call s:X("tsxFunction",#EE80E1,"","","","")

    "hi! tsxFuncCall guifg=#FFC600
    "hi! tsxOperator guifg=#FF9D00
    "hi! tsxFuncArgs guifg=#CCCCCC

    highlight ColorColumn ctermbg=0 guibg=grey
    hi SignColumn guibg=none
    hi CursorLineNR guibg=None
    highlight Normal guibg=none
    highlight LineNr guifg=#5eacd3
    "highligt netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
    hi TelescopeBorder guifg=#5eacd

    " NVIM Tree
    hi! NvimTreeFolderIcon guifg=#f5c06f 
    hi! NvimTreeNormal guibg=#15232d
    hi! TelescopeNormal guibg=#15232d

    hi! NvimTreeFolderName guifg=#bdbdbd
    hi! NvimTreeOpenedFolderName guifg=#bdbdbd
    hi! NvimTreeRootFolder guifg=#bdbdbd
    hi! NvimTreeEmptyFolderName guifg=#aaaaaa

    " Files
    hi! NvimTreeOpenFile guibg=#aaaaaa
    hi! NvimTreeSymlink guifg=#aaaaaa
    hi! NvimTreeSpecialFile guifg=#aaaaaa
    hi! NvimTreeExecFile guifg=#aaaaaa
    hi! NvimTreeMarkdownFile guifg=#aaaaaa

    " JSX "
    hi! jsxComponentName guifg=#80ffbb
    hi! jsxBraces  guifg=#9effff
    hi! jsxTagName guifg=#9EFFFF
    hi! jsxAttrib guifg=#FFC600 gui=italic
    hi! jsxEqual guifg=#FFC600
    hi! jsxOpenPunct guifg=#e1efff
    hi! jsxClosePunct guifg=#e1efff
    hi! jsxCloseTag guifg=#e1efff
    hi! jsxCloseString guifg=#e1efff

    """ TypeScript 
    hi! tsxComponentName guifg=#80ffbb
    hi! tsxBraces  guifg=#9effff
    hi! tsxTagName guifg=#9EFFFF
    hi! tsxAttrib guifg=#FFC600 gui=italic
    hi! tsxEqual guifg=#FFC600
    hi! tsxOpenPunct guifg=#e1efff
    hi! tsxClosePunct guifg=#e1efff
    hi! tsxCloseTag guifg=#e1efff
    hi! tsxCloseString guifg=#e1efff

    """ Javascript"
    hi! jsObjectKey guifg=#9effff
    hi! tsObjectKey guifg=#9effff

    """ jsDoc Colors
    hi! jsDocType guifg=#ffc600 gui=italic
    hi! jsDocTypeBrackets guifg=#e1efff gui=italic
    hi! jsDocTags guifg=#ff9d00 gui=italic
    hi! jsDocParam guifg=#e1efff
endfun

call ColorMyPencils()
