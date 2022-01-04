require("nathanielhall.telescope")
require("nathanielhall.lsp")
require("nathanielhall.tree")
require("nathanielhall.autopairs")

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
