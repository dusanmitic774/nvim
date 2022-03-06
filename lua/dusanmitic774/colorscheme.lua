 -- vim.cmd [[
 -- try
 --   colorscheme OceanicNext
 -- catch /^Vim\%((\a\+)\)\=:E185/
 --   colorscheme default
 --   set background=dark
 -- endtry
 -- ]]

 -- vim.cmd [[
 -- try
 --   colorscheme gruvbox
 -- catch /^Vim\%((\a\+)\)\=:E185/
 --   colorscheme default
 --   set background=dark
 -- endtry
 -- ]]

 vim.cmd [[
 try
    set fillchars+=vert:│"
    colorscheme codesmell_dark
 catch /^Vim\%((\a\+)\)\=:E185/
   colorscheme default
   set background=dark
 endtry
 ]]
