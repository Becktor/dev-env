-- Disable wrap for better table rendering
vim.opt_local.wrap = false

-- Set textwidth for prettier to wrap prose at 100 characters
vim.opt_local.textwidth = 100

-- Enable concealment for links (required by render-markdown.nvim)
vim.opt_local.conceallevel = 2

-- Disable diagnostics (linting warnings) for markdown by default
vim.diagnostic.enable(false, { bufnr = 0 })
