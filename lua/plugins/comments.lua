return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = import.config(function (use)
    local ok, comment, ts_context_comment, comment_nvim = use({
      "Comment",
      "ts_context_commentstring",
      "ts_context_commentstring.integrations.comment_nvim",
    })

    if ok then
      ts_context_comment.setup({
        enable = true,
        enable_autocmd = false,
      })

      comment.setup({
        pre_hook = comment_nvim.create_pre_hook(),
      })
    end
  end)
}
