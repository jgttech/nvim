return {
  "rebelot/kanagawa.nvim",
  config = import.config(function(use)
    local ok, kanagawa = use({ "kanagawa" })

    if ok then
      kanagawa.setup({})
    end
  end),
}
