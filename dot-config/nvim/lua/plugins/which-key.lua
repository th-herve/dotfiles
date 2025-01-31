return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").setup({
			preset = "modern",
			notify = false,
			icons = { mappings = false },
		})
		require("which-key").add({
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>w", group = "[W]iki" },
			{ "<leader>f", group = "[F]uzzy find" },
			{ "<leader>o", group = "Lang" },
		})
	end,
}
