using Plots
using Ogre
import Ogre.Phases: phases, PlanetModel

Tirrs = 200:100:1000
ɛs = [0, 1e-14, 1e-13, 1e-12, 1e-11, 1e-10, 1e-9]
fs = 0.3:0.1:0.9
Ms = (1:10) .* M_earth

srand(12)
plots = []
for i=1:12
  Tirr = rand(Tirrs)
  ɛ = rand(ɛs)
  f = rand(fs)
  M = rand(Ms)
  push!(plots, plot(phases(PlanetModel(Tirr=Tirr, ɛ=ɛ, f=f, M=M))))
end
srand(4)
shuffle!(plots)

dpi = 300
aspectratio = 4/3
width_in = 4.5
height_in = width_in/aspectratio
plotsize = [width_in, height_in] * dpi

plot(plots..., layout=(3,4), ylims=(0,3.2), size=plotsize)
savefig("images/title-phases.png")
