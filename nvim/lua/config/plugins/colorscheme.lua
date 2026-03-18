return {
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,
    priority = 1000,
    config = function()
      require('github-theme').setup({
        options = {
          darken = {
            sidebars = { "qf", "vista_kind", "terminal", "packer" },
            floats = true,
          },
        },
        -- This ensures the background is #000000 across the UI
        specs = {
          all = {
            bg1 = '#000000',
            bg0 = '#000000',
          },
        },
      })

      vim.cmd('colorscheme github_dark_default')
    end,
  }
}
