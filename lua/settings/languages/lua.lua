vim.api.nvim_create_autocmd('FileType', {
	pattern = 'lua',
	callback = function()
		vim.lsp.start({
			cmd = { 'lua-language-server' },
			single_file_support = true,
			settings = {
				Lua = {
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true)
					}
				}

			}
		})
	end,
})
