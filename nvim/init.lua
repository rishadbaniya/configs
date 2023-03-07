-- Loads all the necessary plugins
require("packer.packer_config")

-- Sets the global(doesn't depend on any plugins) options
require("global.options")

-- Sets the global(doesn't depend on any plugins) keymaps
require("global.keymaps")

-- Loads all plugins specific configurations
require("packer.plugins.coc")
require("packer.plugins.gruvbox")
require("packer.plugins.indentline")
require("packer.plugins.telescope")
