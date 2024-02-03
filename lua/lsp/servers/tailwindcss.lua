return {
  setup = function(tailwindcss, configure)
    tailwindcss.setup(configure({
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
              { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
              "tw`([^`]*)", -- tw`...`
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
