using IAMF

@defcomp linear begin
    regions = Index()

    value = Variable(index=[time,regions])

    slope = Parameter(index=[regions])
end

function timestep(s::linear, t::Int)
    v = s.Variables
    p = s.Parameters
    d = s.Dimensions

    if t==1
        for r in d.regions
            v.value[t, r] = 1
        end
    else
        for r in d.regions
            v.value[t, r] = v.value[t - 1, r] - p.slope[r]
        end
    end
end
