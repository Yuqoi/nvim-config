require 'core.keymaps'
require 'core.options'




local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

 {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", 
    },
    lazy = false, 
  },
  {
   'shaunsingh/nord.nvim',
   lazy = false, 
   priority = 1000,
   config = function()
	vim.g.nord_contrast = true
	vim.g.nord_borders = false
	vim.g.nord_disable_background = false
	vim.g.nord_italic = false
	vim.g.nord_uniform_diff_background = true
	vim.g.nord_bold = false

	require('nord').set()
   end
  }
})
