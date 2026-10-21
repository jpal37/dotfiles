-- MapLeader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core
require("jp.core.options")
require("jp.core.keymaps")
require("jp.core.commands")
require("jp.core.autocmds")

-- Providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
