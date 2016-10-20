module IntroductionPlots

cd(dirname(@__FILE__))

using Plots
using ThesisUtils
using DataFrames
using StatPlots

## Exoplanet discovery methods

# get the data
d = readtable("figdata/exoplanet-discoveries.csv")
transits = d[:PLANETDISCMETH] .== "Transit"
rv = d[:PLANETDISCMETH] .== "RV"
other = !(transits | rv)
d[other, :PLANETDISCMETH] = "Other"
ylabels = Dict(
  "Transit" => "Planets found by transit",
  "RV" => "Planets found by radial velocity",
  "Other" => "Planets found by other methods")

# choose colors for the plots
colors = [:firebrick, :slateblue, :seagreen]
basefont = ThesisUtils.main_font
f(n) = font(basefont, colors[n], :left)
yticks = reshape([100:100:1500, nothing, nothing], (1,3))
xticks = [1995, 2016]

# make three margin-sized plots
autofig("exoplanet-discoveries", Normal, vscale=3.4) do
  plots = map(groupby(d, :PLANETDISCMETH), colors) do d, c
    method = d[1, :PLANETDISCMETH]
    xs = span(d[:DATE])
    ys = counts(d[:DATE])
    bar(xs, ys,
        fillcolor=c,
        ylabel=ylabels[method])
  end
  annotate!(plots[1], 1998, 130, text("Transit timing", f(1)))
  annotate!(plots[1], 1998, 160, text("Direct detection", f(1)))
  annotate!(plots[1], 1998, 190, text("Microlensing", f(1)))
  annotate!(plots[2], 1998, 190, text("Radial velocity", f(2)))
  annotate!(plots[3], 1998, 190, text("Transit", f(3)))
  p = plot(plots...,
       xlims=(1991.5, 2019),
       xticks=xticks,
       linewidth=0,
       xlabel=["" "Year of discovery" ""],
       ylabel=["Number of planets discovered" "" ""],
       yticks=yticks,
       legend=false,
       border=false,
       link = :y,
       foreground_color_axis=false,
       layout = @layout [a b c])
end

autofig("margin", Margin) do
  placeholder()
  xlabel!("This is the x-axis")
  xlabel!("This is the y-axis")
end

autofig("normal", Normal) do
  placeholder()
  xlabel!("This is the x-axis")
  ylabel!("This is the y-axis")
end

end # module IntroductionPlots
