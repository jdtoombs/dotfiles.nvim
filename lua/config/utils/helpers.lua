local M = {}
--- Check if a package is installed in the systems
--- @param package string: The package name to Check
--- @return boolean: True if the package is installed, false otherwise
--- Used for installing debian packages using apt
function M.is_installed(package)
	local handle = io.popen(package .. " --version")
	if handle == nil then return false end

	local result = handle:read("*a"):lower()
	handle:close()
	print("pkg: " .. package .. " result: " .. result)

	return result:match(package:lower() .. " version") ~= nil
end

return M
