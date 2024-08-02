# mini-neovim-config
100 loc, 100% lua, yet sufficient configuration for configuring neovim

```
github.com/AlDanial/cloc v 2.00  T=0.01 s (1263.0 files/s, 16734.9 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Lua                              8              6              0            100
-------------------------------------------------------------------------------
SUM:                             8              6              0            100
-------------------------------------------------------------------------------
```

## features

- managing plugin by [lazy.nvim](https://github.com/folke/lazy.nvim)
- [tree-sitter](https://github.com/nvim-treesitter/nvim-treesitter)
- built-in lsp 
- completion by [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

## configs structure

```
mini-neovim-config
├── init.lua
├── lua
│  ├── plugins -- add plugins
│  │  ├── init.lua
│  │  ├── sitter
│  │  │  └── nvim-treesitter.lua
│  │  └── snip
│  │     └── nvim-cmp.lua
│  └── settings -- add autocmds, general settings
│     ├── init.lua
│     ├── languages
│     │  ├── lsp.lua
│     │  └── lua.lua
│     └── options
│        └── options.lua
└── README.md
```

## adding plugins

1. make directory in `lua/plugins`
1. write `some-plugin.lua` in the directory

```lua
return{
"some-plugin"
config = function()
some_config()
end
}
```
## add lsp

1. add `settings/languages/somelang.lua` file

```lua

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'somelang',
	callback = function()
		vim.lsp.start({
			cmd = { 'some-language-server' },
			single_file_support = true,
			settings = {
				somelang = {
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true)
					}
				}

			}
		})
	end,
})
```
