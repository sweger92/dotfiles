local status_ok, iron = pcall(require, "iron.core")
if not status_ok then
	return
end


local status_ok, view = pcall(require, "iron.view")
if not status_ok then
	return
end


iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        command = {"zsh"}
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = view.split.vertical.botright(.4)
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<leader>sc",
    visual_send = "<leader>sc",
    send_file = "<leader>sf",
    -- send_line = "<leader>sl",
    -- send_mark = "<leader>sm",
    -- mark_motion = "<leader>mc",
    -- mark_visual = "<leader>mc",
    -- remove_mark = "<leader>md",
    cr = "<leader>s<cr>",
    interrupt = "<leader>s<space>",
    exit = "<leader>sq",
    clear = "<leader>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  }
}

 vim.keymap.set('n', '<leader>sl', function()
    local last_line = vim.fn.line('$')
    local pos = vim.api.nvim_win_get_cursor(0)
    require('iron.core').send_line()
    vim.api.nvim_win_set_cursor(0, { math.min(pos[1] + 1, last_line), pos[2] })
end)
