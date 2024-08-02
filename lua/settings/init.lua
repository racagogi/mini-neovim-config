local function load_setting(dir)
	local path = vim.fn.stdpath("config") .. "/lua/settings/" .. dir
	for fname in vim.fs.dir(path) do
		local n = fname:match("^(.*)%.lua$")
		pcall(require, "settings" .. "." .. dir .. "." .. n)
	end
end

load_setting("languages")
load_setting("options")
