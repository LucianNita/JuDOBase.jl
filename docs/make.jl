using JuDOBase
using Documenter

DocMeta.setdocmeta!(JuDOBase, :DocTestSetup, :(using JuDOBase); recursive=true)

makedocs(;
    modules=[JuDOBase],
    authors="astroEduardo <72969764+astroEduardo@users.noreply.github.com> and contributors",
    repo="https://github.com/astroEduardo/JuDOBase.jl/blob/{commit}{path}#{line}",
    sitename="JuDOBase.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://astroEduardo.github.io/JuDOBase.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/astroEduardo/JuDOBase.jl",
)
