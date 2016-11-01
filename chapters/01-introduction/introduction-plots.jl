module IntroductionPlots

cd(dirname(@__FILE__))

using Plots
using ThesisUtils
using DataFrames
using LaTeXStrings
using StatPlots

## Exoplanet discovery methods

# get the data
d = readtable("figdata/exoplanet-discoveries.csv", allowcomments=true)
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
color_dict = Dict(
  "Other" => colors[1],
  "RV" => colors[2],
  "Transit" => colors[3] )
basefont = ThesisUtils.main_font
f(n) = font(basefont, colors[n], :left)
yticks = reshape([100:100:1500, nothing, nothing], (1,3))
xticks = [1995, 2016]

# make one big bar chart
autofig("exoplanet-discoveries", Normal, vscale=3.4) do
  plots = map(groupby(d, :PLANETDISCMETH), colors) do d, c
    methods = d[1, :PLANETDISCMETH]
    xs = span(d[:DATE])
    ys = counts(d[:DATE])
    bar(xs, ys,
        fillcolor=c,
        ylabel=ylabels[methods])
  end
  annotate!(plots[1], 1998, 130, text("Transit timing", f(1)))
  annotate!(plots[1], 1998, 160, text("Direct detection", f(1)))
  annotate!(plots[1], 1998, 190, text("Microlensing", f(1)))
  annotate!(plots[2], 1998, 190, text("Radial velocity", f(2)))
  annotate!(plots[3], 1998, 190, text("Transit", f(3)))
  p = plot(plots...,
       xlims=(1993.5, 2017.5),
       xrotation=90,
       xticks=xticks,
       linewidth=0,
       xlabel=["" "Year of discovery" ""],
       ylabel=["Number of planets discovered" "" ""],
       yticks=yticks,
       legend=false,
       border=false,
       link = :y,
       alpha=0.8,
       foreground_color_axis=false,
       layout = @layout [a b c])
end

# make radius-separation chart
autofig("radius-separation", Margin, vscale=1.2) do
  x = :SEP
  y = :MASS
  mycols = d[[:PLANETDISCMETH, x, y]]
  clean = mycols[complete_cases(mycols), :]
  p = plot(xaxis=("Planet–star separation / au", (0.01, 10), :log), xticks=[0.01, 0.1, 1, 10], yaxis=(L"Planet radius / R$_⊕$", (0.01, 10000), :log), legend=:bottomright)
  for subgroup in groupby(clean, :PLANETDISCMETH)
    method = string(subgroup[1, :PLANETDISCMETH])
    scatter!(subgroup[x], subgroup[y],
      markerstrokewidth=0,
      label=method,
      alpha=0.8,
      c=color_dict[method],
      border=false)
  end
  p
end

autofig("margin", Margin) do
  placeholder()
  title!("Placeholder figure")
  xlabel!("This is the x-axis")
  xlabel!("This is the y-axis")
end

autofig("normal", Normal) do
  placeholder()
  title!("Placeholder figure")
  xlabel!("This is the x-axis")
  ylabel!("This is the y-axis")
end

autofig("full", Full) do
  placeholder()
  title!("Placeholder figure")
  xlabel!("This is the x-axis")
  ylabel!("This is the y-axis")
end

end # module IntroductionPlots
