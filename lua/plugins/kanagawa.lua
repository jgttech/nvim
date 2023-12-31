return {
  "rebelot/kanagawa.nvim",
  config = import.config(function(use)
    local ok, kanagawa = use({ "kanagawa" })

    if ok then
      kanagawa.setup({
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      })
    end
  end),
}
