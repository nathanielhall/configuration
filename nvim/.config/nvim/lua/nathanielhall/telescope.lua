local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    prompt_prefix = " >",
    file_ignore_patterns = {"node_modules", ".git"},
    -- file_ignore_patterns = {"node_modules", ".git", "public", "init", ".npm_local"},
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
  extensions = {
    fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
    },
  },
}


require("telescope").load_extension("fzy_native")

local M = {}

M.search_dotfiles = function(opts)
    require("telescope.builtin").find_files({
        prompt_title = "< Configuration >",
        cwd = "~/configuration",
        hidden = true,
        opts = opts
    })
end

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map("i", "<c-d>", actions.git_delete_branch)
            map("n", "<c-d>", actions.git_delete_branch)
            return true
        end
    })
end


return M











