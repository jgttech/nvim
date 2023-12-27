return {
  { 'HiPhish/rainbow-delimiters.nvim' },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      local ibl = import("ibl")

      if ibl then
        ibl.setup()
      end
    end
  }
}
