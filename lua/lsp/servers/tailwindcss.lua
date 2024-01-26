return {
  setup = function(tailwindcss, configure)
    tailwindcss.setup(configure({
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
    }))
  end,
}
