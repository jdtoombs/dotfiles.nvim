return {
	{
		"goaterm",
		dev = true,
		dir = "~/.config/nvim/lua/goaterm",
		opts = {},
		config = function()
			require("goaterm").setup()
		end,
	}
}
