require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "json", "lua", "rust", "c", "python", "latex", "markdown" },
  sync_install = false,
  highlight = {
    enable = true,
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
