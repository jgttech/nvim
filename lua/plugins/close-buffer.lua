return {
  "Asheq/close-buffers.vim",
  config = import.config(function(use)
    local ok, close_buffers = use({ "close-buffers" })

    if ok then
      close_buffers.setup({})
    end
  end),
}
