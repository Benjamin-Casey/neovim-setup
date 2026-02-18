return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
		-- config = function()
		-- 	require("nvim-ts-autotag").setup({})
		-- end,
	},
}
