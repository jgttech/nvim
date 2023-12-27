return {
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      local ts_context_commentstring = import('ts_context_commentstring')

      if ts_context_commentstring then
        ts_context_commentstring.setup({
          enable = true,
          enable_autocmd = false,
        })
      end
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      local comment = import("Comment")
      local comment_nvim = import('ts_context_commentstring.integrations.comment_nvim')

      if comment and comment_nvim then
        comment.setup({
          pre_hook = comment_nvim.create_pre_hook(),
        })
      end
    end
  }
}

