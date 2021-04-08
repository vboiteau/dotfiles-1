local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        mappings = {
            i = {
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

local M = {}
M.search_dotfiles = function() 
    require("telescope.builtin").find_files({
        prompt_title = "< DotFiles >",
        cwd = "$HOME/Projects/Perso/dotfiles",
    })
end
return M
