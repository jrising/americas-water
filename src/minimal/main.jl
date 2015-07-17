# cd("$(homedir())/projects/water/model/src/minimal")
push!(LOAD_PATH, "$(homedir())/projects/water/model")

import IAMF.runmodel

include("model.jl")

m = makemodel(parameters={"slope" => [1.0]})

runmodel(m)

m.components[:linear].Variables
