vim.opt.number = true      -- Exibe a numeração das linhas
vim.opt.relativenumber = true -- (Opcional) Exibe numeração relativa

require("config.lazy")

require'lspconfig'.pyright.setup{
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic"
            }
        }
    }
}


require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")


require("nvim-treesitter.configs").setup({
    ensure_installed = { "python", "lua" },
    highlight = { enable = true },
})

require("catppuccin").setup({
    transparent_background = true,
    integrations = {
	    nvimtree = true,
	    telescope = true,
	    which_key = true,
	}
	--flavour = "mocha" -- Troque para "latte", "frappe", "macchiato", "mocha"
})

vim.cmd.colorscheme "catppuccin-mocha"

local cmp = require'cmp'

cmp.setup({
  completion = {
    autocomplete = { cmp.TriggerEvent.TextChanged },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- Usando LuaSnip para expandir snippets
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),  -- Ativar autocompletar
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirmar sugestão
  }),
  sources = {
    { name = 'nvim_lsp' },  -- LSP como fonte de completions
    { name = 'luasnip' },   -- Snippets como fonte de completions
  },
})
