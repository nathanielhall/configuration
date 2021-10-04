--
-- Break this up at some point
-- nvim-tree / nvim-web-devicons / lualine
--
require'nvim-tree'.setup {
  auto_close = true,
  view = {
   side='right',
   auto_resize = true,
  }
}

require'nvim-web-devicons'.setup {
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 default = true;
}

--require'lualine'.setup {
  --options = {theme = 'cobalt2'}
--}
--
