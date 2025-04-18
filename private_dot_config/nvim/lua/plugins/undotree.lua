return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local undotree = require("undotree")
    undotree.setup({
      float_diff = true, -- using float window previews diff, set this `true` will disable layout option
      layout = "left_bottom", -- "left_bottom", "left_left_bottom"
      ignore_filetype = { "Undotree", "UndotreeDiff", "qf", "TelescopePrompt", "spectre_panel", "tsplayground" },
      window = {
        winblend = 30,
      },
      keymaps = {
        ["j"] = "move_next",
        ["k"] = "move_prev",
        ["J"] = "move_change_next",
        ["K"] = "move_change_prev",
        ["<cr>"] = "action_enter",
        ["p"] = "enter_diffbuf",
        ["q"] = "quit",
      },
    })
    if vim.fn.exists("*persistent_undo") then
      local target_path = vim.fn.expand("~/.undodir")
      if vim.fn.isdirectory(target_path) == 0 then
        vim.fn.mkdir(target_path, "p", 0700)
      end
      vim.o.undodir = target_path
      vim.o.undofile = true
    end
  end,
  keys = { -- load the plugin only when using it's keybinding:
    { "<leader>ut", "<cmd>lua require('undotree').toggle()<cr>" },
  },
}
