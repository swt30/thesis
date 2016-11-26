# Phase structure and migration

Having constructed models of watery planets and examined how they change size with different modes of heating, the next step is to see how the actual structure of the planet changes.

Why is is desirable that we know the phase structure of a planet?
The planet's structure could be important for several reasons.
The phase of water affects its bulk geophysical properties: water behaves very differently when it is solid than when it is liquid.
This consequently affects heat transfer within the planet.
Different ices may also adopt configurations in which other molecules such as methane are trapped within the water matrix, known as filled ice, and this can also alter the temperature of the interior.^[@Levi2014]
This may all have astrobiological consequences.
It is therefore useful to have some grasp on how varied the internal structures of these planets can be.

> TODO: more references for the above

Visualising the phase structure of these planets has several additional benefits.
It provides a sanity check that these models are producing appropriate structures: we expect to see a gas atmosphere over layers of liquid, supercritical fluid/plasma, and high-pressure ices.
It allows us to see whether the equation of state had its detail in the right regions: if our final planets are mostly ice X, a high-pressure ice for which I chose a temperature-independent EOS, then perhaps much of the effort spent on developing the EOS was wasted.
And it provides an at-a-glance overview of the similarities and differences between planets with different heating parameters.

To visualise the phase structure of a planet requires a few additional steps:

- we need to link the planet's surface temperature to the planet--star system;
- we need the pressure and temperature throughout the planet model;
- we need to link that pressure and temperature to its corresponding phase;
- and we need to choose a way of representing that information visually.

\noindent Thankfully, this was a relatively easy task.
The first item is a simple equilibrium temperature calculation; the pressure and temperature are available from my structural models; and I had the foresight to include information on the phases of water in my equation of state.

In the remainder of this chapter, I therefore present visualisations of planets at different distances from a host star.
I explain how I calculated and constructed these, present the results for a few different scenarios, and highlight the interesting features of these results.

## The phase structure of a planet

A phase transition is a discrete change in the properties of a material.
This could be a strong change such as the transition between a liquid and a vapour, or it could be more subtle such a change in the crystalline structure of ice.

![
  Example pressure--temperature profiles for watery planet interiors.
  The orange lines are the P--T profile for planets with the given explicit surface temperatures.
  Each orange line follows an adiabat (isentrope) within a particular phase, and the pressure and temperature are matched at phase boundaries.
  The planets are $3\,$M$_⊕$, consist entirely of water, and I have ignored their atmospheres by setting the surface pressure to $5×10^7\,$Pa, which is beyond the critical pressure.
  Pressure and temperature increase towards the top right of the phase space (deeper into the planet).
  Increasing the surface temperature means that more of the planet consists of superionic or plasma phases of water, with the transition to high-pressure ice happening deeper within the interior or not at all.
  At a surface temperature of 300 K, the planet consists of liquid water over an ice VII core.
  But the ice VII phase may not be present within the interior at higher surface temperatures.
  Instead, the bulk of the planet consists of water in the superionic or plasma state.
  This, combined with the low- density supercritical fluid at the surface, results in an inflated radius.
](pressure_temperature_profiles_fig){#fig:pressure-temperature-profiles}

Phase transitions occur within my planetary models when the temperature and pressure cross a phase boundary.
For example, [@fig:pressure-temperature-profiles] shows how several different planetary structures each touch different regions of the P--T phase space.
These boundaries are not necessarily well-known, especially at high temperatures and pressures.

Because I construct my models by assuming a differentiated one-dimensional planet, the water layer in the final structure will itself consist of several different layers.
I explicitly treat the atmospheric layer differently with the two-stream radiative temperature gradient, but even the adiabatic interior may have several sub-layers of increasing density towards the centre.
This does not mean that any given phase may only be found in a single layer within the planet, or that the density of the planet must always increase monotonically inward.
But in practice the structure of the equation of state and the path of the adiabat is such that this is almost always the case.

### My treatment of phase transitions

My solver traces an adiabat through the interior of the planet, and this adiabat is calculated directly from the equation of state by evaluating a directional derivative.
This poses a problem: how do we treat the boundaries between phases?
Do we enforce continuity of temperature and pressure across the phase boundaries, or do we allow for discontinuities?
When I wrote the solver, I was therefore forced to make a choice about how to handle these phase transitions within the adiabatic interior.

\begin{marginfigure}
  \includegraphics{density-jump}
  \caption{In this slice of constant temperature across the vapour--ice VII phase boundary, we see that the density increases rapidly---a result of interpolating between discontinuous values.}
  \label{fig:density-jump}
\end{marginfigure}

> TODO: [@fig:density-jump] needs updating to match visual style & larger labels.

I first tested an approach in which I directly evaluated the thermal expansivity $α$ across the entire phase space by taking a directional derivative of the equation of state.
Within a given phase, this produces the correct value for $α$.
But problems arise at the phase boundaries where the density is discontinuous ([@fig:density-jump]).
Because of this discontinuity, we obtain a peak in the value of $α$ across the boundary ([@fig:thermal-expansivity-spike]).
This peak is not reflected in the heat capacity I used, which is instead interpolated from a separate table.

\begin{marginfigure}
  \includegraphics{thermal-expansivity-spike}
  \caption{The thermal expansivity $α$ is the derivative of the density in the pressure direction (the derivative of \cref{fig:density-jump}. Here we see that $α$ has a peak at the boundary. This height of this artifact depends on the grid resolution.}
  \label{fig:thermal-expansivity-spike}
\end{marginfigure}

> TODO: insert a sketch showing how these options differ?

> TODO: [@fig:thermal-expansivity-spike] needs updating to match visual style & larger labels.

As a consequence, the shape of the adiabat at the phase boundary changes sharply.
This occurs where the integrator encounters a very high value of $α$, forcing the temperature gradient ${dT \over dm}$ to become large.
The integrator then takes a step sharply in the T direction.
This continues at each integration step until the integrator encounters a region where $α$ happens to be small enough that it can step across the boundary.
Due to this, my code obtained odd-looking curves in P--T space (figure ...).

> TODO: equation and figure reference above

This behaviour was a numerical artifact, a product of the finite grid resolution of the EOS, rather than a reflection of a physical process.
This can be seen through a quick thought experiment: as the grid resolution increases, the value of $α$ approaches infinity at the boundary (because it is the derivative of a step discontinuity in the equation of state).
The sharp peak in $α$ is effectively the discrete equivalent of a delta function.
An infinite value of $α$ produces an infinite value of ${dT \over dm}$ and therefore an infinite increase in temperature when coupled to the finite step size of the Runge-Kutta integrator.
In this way, the integrator should never step across a phase boundary if there is a density discontinuity at that boundary.
This is not the behaviour we want.

I verified that this was the case by changing the resolution of the EOS grid and observing that the path of the adiabat varied at the boundary according to no particular pattern.

I believe that in the analytic limit where the grid size approaches 0, the changes in $α$ and $c_p$ most likely balance each other out and produce a smooth transition across the boundary (modulo some latent heat of phase transition).
But the numerical limitations of the model mean that we cannot do this.

For ease of calculation, I therefore chose instead to fix the pressure and temperature.
In order for this to work, I needed to fix $α=0$ at the boundary.
I trialled a thresholding procedure to set $α=0$ but this could not handle all the phase boundaries.
The value of $α$ varies strongly across the parameter space, and some of the phase boundaries have relatively small density changes, so I could not find a suitable threshold value for $α$ that left the the data within the phases untouched.
Instead, I re-generated the table of $α$ phase by phase.
Within each phase I calculated $α$ as normal, then stitched the phases together by joining them directly  
In this way, I avoided generating artificial spikes in $α$ at the phase boundaries, retaining the behaviour of $α$ within each phase and producing a step, rather than a spike, at the boundary instead.

We might expect to see different results if we chose a different treatment.
A third option could involve calculating the specific entropy of water directly, rather than implicitly fixing it by setting T and P and then evaluating @eq:adiabatic-temperature-gradient.
We could then simply follow the adiabat into the planet by taking $T = T(P)$.^[In a discussion with Stéphane Mazevet (Observatoire de Paris), he suggested that it would be worthwhile for the pressure--temperature profile to trace contours of constant entropy directly, rather than fixing the pressure and temperature at the boundary. (S. Mazevet, personal communication, 31 March 2016)]
This would have the advantage of avoiding the numerical difficulty described above while also allowing for density discontinuities at phase boundaries.
But the degree to which this would change the results is unclear.
I obtained a copy of a water EOS that included data on the specific entropy across some of the phases of interest,^[S. Stewart, personal communication, 4 March 2016] but ultimately did not have enough time to carry out this approach for comparison.

This approach---smoothly following an isentrope---would also appear to presuppose that convective mixing can occur across phase boundaries, which is unlikely to be the case.
A more realistic model would likely involve some treatment of boundary layers between different phases and also between different materials.
At these boundaries we would perhaps expect a conductive boundary layer to form.

> TODO: reference Valencia's conductive boundary layer approach?

### Extracting phase information

My equation of state includes phase information for water across its entire pressure and temperature range.
This phase information is either implicit in the definition of the regions of the EOS, or it is explicitly included as part of the data tables that the EOS is drawn from.
I used this information to allow me to label the layers of my planetary models with the appropriate phases.

I label the atmosphere layer and everything at higher temperature than the condensation curve as gaseous.^[Technically an additional distinction may be made between *vapour* and a *gas*, the first being compressible to a liquid, but I treat these under the same label for the purpose of determining phase structure.]
Within the interior, I match pressure--temperature pairs to phases in a similar manner to the procedure described in @sec:how-i-collected-and-synthesized-the-data.
I define the boundaries of the ice phases using the boundaries from @Choukroun2007.
For non-ice phases, I extract phase information directly from the EOS tables where this is provided.^[@French2009; @Wagner2002]
For points off the unstructured grid, I take the phase of the nearest grid point in barycentric coordinates.
And for any phase not yet covered by any of these regions, I treat anything with greater pressure and temperature than the critical point as supercritical fluid, and anything with $P > P_c$ but $T < T_c$ as liquid.

The end result is a mapping between $(P,T)$ and phase across the entire range of validity of my EOS.
I use this mapping to determine the phase at each mass step within the final model.
By linking it to the appropriate radius, I can therefore produce the radial phase structure of the watery layers in any planet model.
Finally, I include labels for both iron and silicate, though I do not specify the phases of these materials at all.

### Limitations of the phase structural models

> TODO: Include a brief discussion of what happens when the adiabat leaves the phase space and of how realistic the phase boundaries are

## Structural changes of migrating planets

I constructed planetary models for heated watery planets undergoing migration.
I did this by moving the planet closer to its host star and recalculating its structure based on the changed surface boundary conditions.
The key motivation here was to understand whether changing the radius of a planet's orbit could significantly affect its radius and/or phase structure.

### Irradiation and internal heating

I treat irradiation simply by altering the equilibrium temperature of the planet [@eq:planet-equilibrium-temperature].
The equilibrium temperature of a black body at a distance $D$ from a host star of radius $R_⊕$ and temperature $T_⊕$ is \marginnote{
  For simplicity, I assume zero albedo.
} $$ T_\mathrm{eq} = T_⊕ \sqrt{R_⊕} $${#eq:equilibrium-temperature-no-albedo}
I calculated this temperature based on a Sun-like star ($T_⊕ = 5800\,$K, $R_⊕ = 7×10^8\,$m).

> TODO: move equilibrium temperature introduction from earlier chapter?

We must also assume that any movement occurs on timescales that are longer than the thermal equilibrium timescale of the planet (so that it returns to a state of quasi-equilibrium) and that there is no significant mass loss over this timescale.
Further, my atmospheric models assume a one-dimensional atmosphere and so therefore correspond to a well-mixed atmosphere without any latitudinal or longitudinal structure.
Such an atmosphere could be found around a planet that rotates rapidly compared to the orbital timescale.

> TODO: assumption of no significant mass loss, how significant would it really be? (Kurosaki paper)

As well as setting the equilibrium temperature, I also fix the internal heating parameter $ɛ$.
In the previous chapter I discussed two methods for linking this parameter to the atmospheric temperature of the planet; I choose the second of these, in which the luminosity of the core is assumed to produce a black-body surface temperature that is then used as an input to the atmospheric model.
I do not change this value as the planet is moved closer to its host star, whether by cooling the core or adding tidal energy.

## Results

In [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth] I show two key results.
The first is how the radius of a watery planet changes with distance to its host star (top panels).
The second is the phase structure of these planets (bottom panels).

I have chosen to represent the phase structures of the planets as a colour-coded cross-section through the planet's interior.
Therefore I also provide [@fig:phase-key] as a key to the colours and scale of [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth].
These figures show several values and trends at a glance:

- how much of a planet's radius is contributed by its atmosphere;
- the relative size of heated watery planets;
- and the similarity or otherwise of the structure of their water layers.

![
  Key to [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth].
  The dotted lines show 1, 2 and 3 Earth radii and the black line shows the planet's transit radius.
  Coloured layers show the phase structure of the planet.
  This key only shows the phases present in the majority of my models;
  any other phases are labelled where they appear in [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth].
](phase-key){#fig:phase-key}

![
  *Top panel:* Heated planets are larger, but how close does a watery planet need to be to its host star to grow significantly?
  Here I show the radius of a $1\,$M$_⊕$ watery planet (30% water by mass) at several different distances and with several different core energy generation rates.
  Such a planet can grow by 10% or more if it is moved from $1\,$a.u. to $0.1\,$a.u.
  There is also a kink in the curve for the lowest internal energy generation rate ($10^{-18}\,$W$⋅$kg$^{-1}$) near $1\,$a.u.
  This is caused by a transition to cold ice and liquid, causing a sharp change in radius (see below).
  *Bottom panel:* What do the interiors of these planets look like?
  Here I show structural diagrams for the models indicated with circles in the top panel.
  See [@fig:phase-key] for the colour key.
  The relative positions of the models are maintained.
  For example, the top red line in the top panel corresponds to the top row of models in the bottom panel.
  In almost all of these cases, the planets have a thick water vapour atmosphere.
  Deeper within the planet, the atmosphere transitions directly to superionic fluid and possibly plasma.
  The only exception is in the case of a cold planet at $5\,$au, which has a liquid layer around an ice VII shell.
](migration-1Mearth){#fig:migration-1Mearth}

![
  As in [@fig:migration-1Mearth], but for a $3\,$M$_⊕$ planet.
  Comparing to [@fig:migration-1Mearth], we see that the $3\,$M$_⊕$ planets can actually be smaller than the $1\,$M$_⊕$ planets, at least where there is moderate internal or external heating.
  This is the upturn at the low-mass end of the mass--radius relation that I discussed in @sec:heating-and-the-atmosphere.
](migration-3Mearth){#fig:migration-3Mearth}

![
  As in [@fig:migration-1Mearth; @fig:migration-3Mearth], but for a $5\,$M$_⊕$ planet.
](migration-5Mearth){#fig:migration-5Mearth}

![
  As in [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth], but for a $10\,$M$_⊕$ planet.
  The radius--distance relation is much flatter for these higher-mass planets.
  Looking at the phase structures, we can see why: they have much thinner atmospheres.
  As it is the low-density atmosphere that is most responsive to temperature changes, these planets grow less when heated than a lower-mass planet would.
](migration-10Mearth){#fig:migration-10Mearth}

> TODO: Label [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth] with the masses in the figures themselves rather than in the captions

> TODO: Label [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth] with temperatures as well as distances

The key results from these figures can be summarised as follows.

1. Small watery planets have extended low-density atmospheres.
2. Large changes in planetary radius occur if a planet is moved closer to its host star.
3. This trend is shallower for larger-mass planets.
4. For the most part, these planets contain three key phases of water: gas, superionic fluid, and plasma. There is no ice VII or X except for cold planets.
5. There is a discrete transition in planet size for these cold planets, which for a Sun-like star occurs at 1$\,$au, the freezing point of water.
6. External heating becomes dominant for planets closer to the Sun than Earth, unless the planet is internally heated more than Earth.

### Small watery planets have extended low-density atmospheres.

A key question that arose in [@sec:watery-planet-interiors,@sec:heating-and-the-atmosphere] was whether the inflated radii of my models were primarily due to a phase transition from liquid to vapour, or whether they were the result of a more bulk expansion of the planet.
In @sec:watery-planet-interiors I suggested that the results indicated the former.

@Fig:migration-1Mearth reveals that the atmospheric component of these models is key to their inflated size.
When comparing phase structures of these identical-mass planets, most of the difference can be explained by the atmosphere itself.
There is some expansion in the heated internal layers too, but most of the expansion is caused by the atmosphere itself, at least for the lower-mass cases.

However, this figure also indicates a potential problem with my models.
In choosing the boundary conditions, I assumed a constant-gravity atmosphere.
We can see that this is not the case, at least for low-mass planets.
I identified this issue earlier as a turn-up in radius near the low-mass end of the mass--radius diagram, but with the phase structure in hand it is clear that the atmospheric layer grows to become very thick on some of these planets.

### Large changes in planetary radius occur if a planet is moved closer to its host star.

This is an unsurprising statement, as we have seen in previous chapters that radial changes occur with heating.
But by linking the temperature of the planet to its position, we can see that large radial changes occur across a reasonable range of orbital distances and are not just confined to planets orbiting very close to their host star.
This potentially has impacts when considering migration scenarios, or even (if the equilibrium timescale is short enough) for planets on elliptical orbits.

> TODO: add example numbers

### This trend is shallower for larger-mass planets.

Comparing [@fig:migration-10Mearth] to [@fig:migration-1Mearth] shows a much larger proportional increase in radius for lower-mass planets when they are moved.
This is a consequence of the effect I observed in @sec:heating-and-the-atmosphere, where lower-mass planets have lower gravity and are unable to hold onto their heated atmospheres.

> TODO: add example numbers.

### These planets mostly contain three key phases of water: gas, superionic fluid, and plasma.

At the surface temperatures represented by these distances, the bulk of these planets contain only three phases of water.
There is little evidence that high-pressure ice phases like ice VII and ice X are present except in the case of very cold planets (sub-Earth internal heating and surface temperatures of <200K)

> TODO: include exact number

These graphs do not explore the trends for planets with water mass fractions other than 30%.
However, we might expect that planets with larger water mass fractions are more likely to reach high-pressure ices near their core.
They will also be less dense and have a larger radius overall.
But the way in which my internal heating models are constructed, in which the internal heating comes from the core of the planet, means that the internal heating approaches zero as the core mass approaches zero.
We would need a way of representing energy generation from the water envelope itself (by a tidal heating model, for example) in order to continue modelling these high-water-mass planets as being internally heated.

### There is a discrete transition in planet size near 1$\,$au for cold planets.

The kink in the lower curve on [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth] is a discrete transition in phase structure for cold planets.
The phase structure of the resulting planet is visible as the bottom-right structure in the grid of models.
This structure contains a water layer over ice VII and ice X.
But these phases are only present when there is virtually no internal heating: even an Earth-like internal heating amount of $10^{-12}\,$W$⋅$kg$^{-1}$ in the core is enough to shift the path of the adiabat away from these cold ice phases and up to the supercritical fluid regime.

## Discussion

### Astrobiological implications

> TODO: this isn't vital to have but would be nice

### Future work

> TODO: Atmospheric escape, tidal heating?
