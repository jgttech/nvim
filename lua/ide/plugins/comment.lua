-- NOTE: Plugins can also be added by using a table,
-- with the first argument being the link and the following
-- keys can be used to configure plugin behavior/loading/etc.
--
-- Use `opts = {}` to force a plugin to be loaded.
--
--  This is equivalent to:
--    require('Comment').setup({})

-- "gc" to comment visual regions/lines
return {
  'numToStr/Comment.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    local comment = require 'Comment'
    local ts_context_comment = require 'ts_context_commentstring'
    local comment_nvim = require 'ts_context_commentstring.integrations.comment_nvim'

    ts_context_comment.setup {
      enable = true,
      enable_autocmd = false,
    }

    comment.setup {
      pre_hook = comment_nvim.create_pre_hook(),
    }
  end,
}
