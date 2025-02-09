return {
  "catgoose/nvim-colorizer.lua",
  config = function()
    vim.api.nvim_create_autocmd("BufReadPost", {
      pattern = "*",
      callback = function()
        require("colorizer").attach_to_buffer(0)
      end,
    })
  end,
}
