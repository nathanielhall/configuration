require("nathanielhall.telescope")
require("nathanielhall.tree")
require("nathanielhall.cmp")
require("nathanielhall.autopairs")
require("nathanielhall.illuminate")

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
