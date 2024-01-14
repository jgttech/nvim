return {
  "andrewferrier/wrapping.nvim",
  config = import.config(function(use)
    local ok, wrapping = use({ "wrapping" })

    if ok then
      wrapping.setup()
    end
  end),
}
