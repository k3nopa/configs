local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
}

local rust_tool_opts = {
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
		executor = require("rust-tools/executors").termopen,
        -- runnables = { use_telescope = true },
        -- debuggables = { use_telescope = true },

        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = ": ",
            other_hints_prefix = "> ",
            highlight = "Comment",
            only_current_line_autocmd = "CursorHold",
        },

        hover_actions = {
            border = {
                {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                {"╰", "FloatBorder"}, {"│", "FloatBorder"}
            },
            auto_focus = false  -- for hover action window
        },

        -- settings for showing the crate graph based on graphviz and the dot
        crate_graph = {
            backend = "x11",
            output = nil,   -- output path
            full = true,
        }
    },

	server = { 
        on_attach=on_attach,
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importGranularity = "module",
                    importPrefix = "by_self",
                },
                cargo = { loadOutDirsFromCheck = true },
                procMacro = { enable = true },
                checkOnSave = { command = "clippy" },
            }
        }
    },

    -- debugging stuff
    -- dap = {
    --     adapter = {
    --         type = 'executable',
    --         command = 'lldb-vscode',
    --         name = "rt_lldb"
    --     }
    -- }
}
require('rust-tools').setup(rust_tool_opts)
