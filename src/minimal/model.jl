importall IAMF

include("linear.jl")

function constructmodel(;nsteps=150)
    m = Model()

    setindex(m, :time, [1950:1950+nsteps])
    setindex(m, :regions, ["NY"])

    # ---------------------------------------------
    # Create components
    # ---------------------------------------------
    addcomponent(m, linear)

    # ---------------------------------------------
    # Connect parameters to variables
    # ---------------------------------------------

    #bindparameter(m, :geography, :landloss, :impactsealevelrise)

    return m
end

function makemodel(;nsteps=150, parameters=nothing)
    # ---------------------------------------------
    # Construct model
    # ---------------------------------------------
    m = constructmodel(nsteps=nsteps)

    # ---------------------------------------------
    # Load remaining parameters from file
    # ---------------------------------------------
    if parameters == nothing
      parameters = {}
    end

    setleftoverparameters(m, parameters)

    # ---------------------------------------------
    # Return model
    # ---------------------------------------------

    return m
end
