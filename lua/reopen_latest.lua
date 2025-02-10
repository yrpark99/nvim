local M = {}

M.last_closed = nil

vim.api.nvim_create_autocmd("BufDelete", {
  callback = function(args)
    M.last_closed = vim.api.nvim_buf_get_name(args.buf)
  end
})

function M.reopen_latest()
  if M.last_closed and M.last_closed ~= "" then
    vim.cmd("tabnew " .. vim.fn.fnameescape(M.last_closed))
  else
    print("No recently closed buffer found!")
  end
end

vim.api.nvim_create_user_command("ReopenLatest", M.reopen_latest, {})

return M

