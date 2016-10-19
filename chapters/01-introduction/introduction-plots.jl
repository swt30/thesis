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

# make three margin-sized plots
for (dd, color, yl) in zip(groupby(d, :PLANETDISCMETH), colors, ylabels)
  method = dd[1, :PLANETDISCMETH]
  xs = span(dd[:DATE])
  ys = counts(dd[:DATE])
  name = "exoplanet-discoveries-$(lowercase(method))"
  autofig(name, Margin, vscale=1) do
    bar(xs, ys,
      xticks=[1995, 2000, 2010, 2016],
      fillcolor=color,
      xlabel="Year of discovery",
      xlims=(1994.5, 2016.5),
      ylabel=ylabels[method],
      linewidth=0,
      legend=false,
      border=false,
      foreground_color_axis=false)
  end
end

# autofig("exoplanet-discoveries-transit", Normal, vscale=1) do
#   end
#   xticks!(plots[3], 1995:5:2015)

  # xlabels = hcat("", "", "Year of discovery")
  # ylabels = hcat("", "Number of planets", "")
  # ylims = hcat((0, 10), (0, 70), (0, 1200))
  #
  # plot(plots...,
  #   link=:x,
  #   # layout=3,
  #   xlabel=xlabels,
  #   ylabel=ylabels,
  #   legend=false,
  #   linewidth=0,
  #   xlims=(1994.5, 2016.5),
  #   ylims=ylims,
  #   border=false,
  #   foreground_color_axis=false)
#
#     return plots[2]
# end

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
