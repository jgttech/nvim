return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  config = import.config(function(use)
    local ok, onedark = use({ "onedark" })

    if ok then
      onedark.setup({
        style = "deep",
        cmp_itemkind_reverse = true,
        code_style = {
          comments = "italic",
          keywords = "bold,italic",
          functions = "bold",
          strings = "bold",
          variables = "bold,italic",
        },
      })

      onedark.load()
    end
  end),
}
