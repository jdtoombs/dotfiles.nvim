local M = {}

M.load_env = function()
	local env = {}
	local env_file = vim.fn.stdpath("config") .. "/.env"
	local file = io.open(env_file, "r")
	if not file then
		print("No .env file found")
		return
	end

	file:close()

	for line in io.lines(env_file) do
		print(line)
		local key, value = line:match("^([%w_]+)=(.+)$")
		env[key] = value
	end

	return env
end

return M
