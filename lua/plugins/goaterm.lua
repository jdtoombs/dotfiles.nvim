return {
	{
		"goaterm",
		dev = true,
		dir = "~/.config/nvim/lua/goaterm",
		config = function()
			require "goaterm".setup {
				-- options will go here
			}
		end,
	}
}
