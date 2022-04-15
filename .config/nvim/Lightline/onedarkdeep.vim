" =============================================================================
" Filename: autoload/lightline/colorscheme/onedarkdeep.vim
" Author: qmack2
" =============================================================================

" Common colors
let s:blue   = [ '#41a7fc', 75 ]
let s:green  = [ '#8bcd5b', 76 ]
let s:purple = [ '#c75ae8', 176 ]
let s:red1   = [ '#f65866', 168 ]
let s:red2   = [ '#be5046', 168 ]
let s:yellow = [ '#efbd5d', 180 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

if lightline#colorscheme#background() ==# 'light'
  " Light variant
  let s:fg    = [ '#494b53', 238 ]
  let s:bg    = [ '#fafafa', 255 ]
  let s:gray1 = [ '#494b53', 238 ]
  let s:gray2 = [ '#f0f0f0', 255 ]
  let s:gray3 = [ '#d0d0d0', 250 ]
  let s:green = [ '#98c379', 35 ]

  let s:p.inactive.left   = [ [ s:bg,  s:gray3 ], [ s:bg, s:gray3 ] ]
  let s:p.inactive.middle = [ [ s:gray3, s:gray2 ] ]
  let s:p.inactive.right  = [ [ s:bg, s:gray3 ] ]
else
  " Dark variant
  let s:fg    = [ '#93a4c3', 145 ]
  let s:bg    = [ '#1a212e', 235 ]
  let s:gray1 = [ '#141b24', 241 ]
  let s:gray2 = [ '#141b24', 235 ]
  let s:gray3 = [ '#1a212e', 240 ]

  let s:p.inactive.left   = [ [ s:gray1,  s:bg ], [ s:gray1, s:bg ] ]
  let s:p.inactive.middle = [ [ s:gray1, s:gray2 ] ]
  let s:p.inactive.right  = [ [ s:gray1, s:bg ] ]
endif

" Common
let s:p.normal.left    = [ [ s:bg, s:green, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.normal.middle  = [ [ s:fg, s:gray2 ] ]
let s:p.normal.right   = [ [ s:bg, s:green, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.normal.error   = [ [ s:red2, s:bg ] ]
let s:p.normal.warning = [ [ s:yellow, s:bg ] ]
let s:p.insert.right   = [ [ s:bg, s:blue, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.insert.left    = [ [ s:bg, s:blue, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.replace.right  = [ [ s:bg, s:red1, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.replace.left   = [ [ s:bg, s:red1, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.visual.right   = [ [ s:bg, s:purple, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.visual.left    = [ [ s:bg, s:purple, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.tabline.left   = [ [ s:fg, s:gray3 ] ]
let s:p.tabline.tabsel = [ [ s:bg, s:purple, 'bold' ] ]
let s:p.tabline.middle = [ [ s:gray3, s:gray2 ] ]
let s:p.tabline.right  = copy(s:p.normal.right)

let g:lightline#colorscheme#onedarkdeep#palette = lightline#colorscheme#flatten(s:p)
