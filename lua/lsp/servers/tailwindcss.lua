return {
  setup = function(args)
    local lspconfig = args.lspconfig

    lspconfig.tailwindcss.setup({
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              "\\$`([^`]*)", -- $`...`
              "classes`([^`]*)", -- classes`...`
              'tw="([^"]*)', -- <div tw="..." />
              "tw='([^']*)", -- <div tw='...' />
              'tw={"([^"}]*)', -- <div tw={"..."} />
              "tw={'([^'}]*)", -- <div tw={'...'} />
              "tw={`([^`}]*)", -- <div tw={`...`} />
              'className="([^"]*)', -- <div className="..." />
              "className='([^']*)", -- <div className='...' />
              'className={"([^"}]*)', -- <div className={"..."} />
              "className={'([^'}]*)", -- <div className={'...'} />
              "className={`([^`}]*)", -- <div className={`...`} />
            },
          },
        },
      },
    })
  end,
}
