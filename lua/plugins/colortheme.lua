return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    styles = {
      functions = {},
    },
    on_colors = function(colors)
      colors.hint = colors.orange
      colors.error = '#ff0000'
    end,
    day_brightness = 0.24, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd [[colorscheme tokyonight-day]]
    local isDayTheme = true
    local changedStyle = 'day'

    local toggleThemeMode = function()
      isDayTheme = not isDayTheme
      if isDayTheme == true then
        changedStyle = 'tokyonight-day'
      else
        changedStyle = 'tokyonight-storm'
      end

      vim.cmd('colorscheme ' .. changedStyle)
    end

    vim.keymap.set('n', '<leader>tm', toggleThemeMode, { noremap = true, silent = true })
  end,
}
