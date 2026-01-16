return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  ft = { 'markdown' },
  opts = {
    -- Render in normal and command mode, show raw in insert mode
    render_modes = { 'n', 'c' },

    -- Anti-conceal: show raw markdown on cursor line (hybrid mode)
    anti_conceal = {
      enabled = true,
    },

    -- Headings with nerd font icons
    heading = {
      enabled = true,
      sign = false,
      icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      width = 'full',
    },

    -- Tables with rounded borders
    pipe_table = {
      enabled = true,
      preset = 'round',
      cell = 'trimmed', -- Trim whitespace, better for concealed content
    },

    -- Code blocks - full width
    code = {
      enabled = true,
      sign = false,
      width = 'full',
      border = 'thin',
    },

    -- Horizontal rules
    dash = {
      enabled = true,
      width = 'full',
    },

    -- Links: conceal URL, show text with icon
    link = {
      enabled = true,
      render_modes = { 'n', 'c', 'i' }, -- Render links in all modes
      hyperlink = '󰌹 ',
    },

    -- Enable LSP completions for checkboxes/callouts
    completions = {
      lsp = { enabled = true },
    },
  },
}
