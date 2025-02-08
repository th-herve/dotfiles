return {

	"tpope/vim-fugitive",

	dependencies = {
		"sindrets/diffview.nvim",
	},

	config = function()
		key("n", "gs", ":G status<CR>")
		key("n", "ga.", ":Git add .<CR>")
		key("n", "gaw", ":Gw<CR>")
		key("n", "gcm", ":Git commit -m '")
		key("n", "gco", ":Git checkout ")
		key("n", "gp", ":Git push<CR>")
		-- key("n", "gh", ":diffget //2<CR>")
		-- key("n", "gl", ":diffget //3<CR>")

		local actions = require("diffview.actions")

		require("diffview").setup({
			view = {
				merge_tool = {
					layout = "diff1_plain",
				},
			},
			keymaps = {
				view = {
					{
						"n",
						"gh",
						actions.conflict_choose("ours"),
						{ desc = "Choose the OURS version of a conflict" },
					},
					{
						"n",
						"gl",
						actions.conflict_choose("theirs"),
						{ desc = "Choose the THEIRS version of a conflict" },
					},
				},
			},
		})
		key("n", ld .. "gdo", ":DiffviewOpen<CR>")
		key("n", ld .. "gdc", ":DiffviewClose<CR>")

		-- toggle fugitive status with ld..gs
		local function showFugitiveGit()
			if vim.fn.FugitiveHead() ~= "" then
				vim.cmd([[ tab Git ]])
				vim.cmd([[ execute ":set nonumber norelativenumber" ]])
			end
		end

		local function toggleFugitiveGit()
			if vim.fn.buflisted(vim.fn.bufname("fugitive:///*/.git//$")) ~= 0 then
				vim.cmd([[ execute ":bdelete" bufname('fugitive:///*/.git//$') ]])
			else
				showFugitiveGit()
			end
		end
		key("n", ld .. "gs", toggleFugitiveGit, opts) -- has to use the leader key, otherwise it won't close

		vim.cmd([[
        autocmd BufNewFile COMMIT_EDITMSG exec set nonumber norelativenumber
      ]])
	end,
}
