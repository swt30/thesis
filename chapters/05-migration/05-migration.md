# Phase structure and migration

Having constructed models of watery planets and examined how they change size with different modes of heating, what comes next?
I have continued my development of watery planet structure by investigating two key questions.
First, I would like to understand what the interiors of these planets actually look like.^[By this I mean that I would like to understand the *phase structure* of my models; that is, the layered structure of water. For example, the phase structure of the water layer might consist of gas over liquid over high-pressure ice.]
Second, I would like to understand how this internal structure (and the planet's observable properties) dynamically change as the planet is moved within the star--planet system.
This is a particularly relevant question in the context of planetary migration, but planets in elliptical orbits also vary in their planet--star separation, albeit on a much shorter timescale.

\newthought{Why is is desirable} that we know the phase structure of a planet?
The planet's structure could be important for several reasons.
The phase of water affects its bulk geophysical properties: water behaves very differently when it is solid than when it is liquid.
This consequently affects heat transfer within the planet.
And different ice phases may also adopt configurations in which other molecules such as methane are trapped within the water matrix, known as filled ice, and this can also alter the temperature of the interior.^[@Levi2014]
This may all have astrobiological consequences.
It is therefore useful to have some grasp on how varied the internal structures of these planets can be.

The phase structure of these planets is useful to know for other reasons too.
It provides a sanity check that these models are producing appropriate structures: we expect to see a gaseous atmosphere over layers of liquid, supercritical fluid/plasma, and high-pressure ices.
It allows us to see whether the equation of state had its detail in the right regions: we would prefer that the final planetary models consist of phases like gas and supercritical fluid rather than ice X because the latter's equation of state is not well-known.
And it provides an at-a-glance overview of the similarities and differences between planets with different heating parameters.

\newthought{To investigate these} two questions, I began by linking the planet's surface temperature to its physical context in a planet--star system.
I assumed a Sun-like star and fixed the orbital separation between this star and a water-rich planet of a given mass.
Then I calculated the irradiation temperature (@eq:irradiation-temperature) of the planet and solved for its radius and structure as described in previous chapters.
Within the planetary structure, I tracked the pressure--temperature profile and used this to determine the phase structure of water within the planet.
By changing the star--planet separation, I can observe how this phase structure varies.
This approach therefore provides an idea of what structural changes the planet undergoes as it migrates.

In this chapter I first give some background of how I calculated the phase structure of water in my models.
Then I present visualisations of the interior structure of a watery planet at different distances from a host star.
I show the results for a few different scenarios and highlight the interesting features of these results.

## The phase structure of a planet

A phase transition is a discrete change in the properties of a material.
This could be a strong change such as the transition between a liquid and a vapour, or it could be more subtle such as a change in the crystalline structure of ice.

Phase transitions occur within my planetary models when the temperature and pressure cross a phase boundary.
For example, [@fig:pressure-temperature-profiles] shows how several different planetary structures each span different regions of the pressure--temperature phase space.^[Recall that these boundaries are not necessarily well-defined at high temperatures and pressures because the behaviour of water has yet to be measured in these regions.]

![
  Example pressure--temperature profiles for watery planet interiors.
  The \textcolor{Tomato}{orange lines} are the P--T profile for planets with the given explicit surface temperatures.
  Each orange line follows an adiabat (isentrope) within a particular phase, and the pressure and temperature are matched at phase boundaries.
  The planets are $3\,$M$_⊕$, consist entirely of water, and I have ignored their atmospheres by setting the surface pressure to $5×10^7\,$Pa, which is beyond the critical pressure.
  Pressure and temperature increase towards the top right of the phase space (deeper into the planet).
  Increasing the surface temperature means that more of the planet consists of superionic or plasma phases of water, with the transition to high-pressure ice happening deeper within the interior or not at all.
](pressure-temperature-profiles){#fig:pressure-temperature-profiles}

Because I construct my models by assuming a differentiated one-dimensional planet, the water layer in the final structure will itself consist of several different layers.
I explicitly treat the atmospheric layer differently with the two-stream radiative temperature gradient, but even the adiabatic interior may have several sub-layers of increasing density towards the centre.
This does not mean that any given phase may only be found in a single layer within the planet.
But in practice the structure of the equation of state and the path of the adiabat in my models is such that this is almost always the case.

### My treatment of phase transitions

My solver traces an adiabat through the envelope of the planet, and this adiabat's path depends on the equation of state: it is calculated from the thermal expansion coefficient $\alpha$, which I evaluate directly from the EOS by taking a partial derivative in the temperature direction.^[@Eq:thermal-expansion]
This poses a problem: how do we treat the boundaries between phases?
Do we enforce continuity of temperature and pressure across the phase boundaries, or do we allow for discontinuities?
When I wrote the solver, I was therefore forced to make a choice about how to handle these phase transitions within the adiabatic interior.
I tried two different approaches.

\newthought{The first approach} is the simplest: we can calculate the thermal expansion coefficient $\alpha$ using @eq:thermal-expansion.
Within a given phase, this produces the correct value for $α$.
But the density is discontinuous at the phase boundaries ([@fig:density-jump]).
Because of this discontinuity, we obtain a peak in the value of $α$ across the boundary ([@fig:thermal-expansivity-correction]).

![
  In this slice of constant temperature across the vapour--ice VII phase boundary, we see that the density increases rapidly---a result of interpolating between discontinuous values.
](density-jump){#fig:density-jump}

![
  The thermal expansivity $α$ is the partial derivative of the density in the temperature direction.
  The original treatment had numerical difficulty at phase boundaries.
  Here we see that $α$ originally had a very large peak at the boundary.
  The height of this artifact depends on the grid resolution.
  Correcting this problem removed the peaks at phase boundaries, allowing the integrator to move smoothly through phase space without strange behaviour.
](thermal-expansivity-correction){#fig:thermal-expansivity-correction}

This approach is problematic because the discontinuity is not reflected in the heat capacity I used, which is instead interpolated from a separate table.
When I evaluate the adiabatic temperature gradient ${dT \over dm}$, ^[@Eq:adiabatic-temperature-gradient] I therefore obtain a very large value at the phase boundary.
This makes the integrator take a step sharply in the $T$ direction.
This continues at each integration step until the integrator encounters a region where $α$ happens to be small enough that it can step across the boundary.
As a consequence, the shape of the adiabat at the boundary changes sharply.
Due to this, my code produced odd-looking curves in $P$--$T$ space ([@fig:phase-boundary-issues]).

![
  Sketch of the behaviour of the adiabat at phase boundaries in my models.
  My models determine the path of the adiabat by calculating the partial derivative of the density with respect to temperature, which initially resulted in numerical issues where the adiabat would not cross phase boundaries correctly.
  I matched pressure and temperature at the phase boundaries to fix this issue.
](phase-boundary-issues){#fig:phase-boundary-issues}

This behaviour is a numerical artifact, a product of the finite grid resolution of the EOS, rather than a reflection of a physical process.^[
This can be seen through a quick thought experiment: as the EOS grid resolution increases, the value of $α$ approaches infinity at the boundary (because it is the derivative of a step discontinuity in the equation of state).
An infinite value of $α$ produces an infinite value of ${dT \over dm}$ and therefore an unphysical infinite increase in temperature at the phase boundary.]
I verified that this was the case by increasing the resolution of the EOS grid and observing that the jagged edges showed in [@fig:phase-boundary-issues] did not converge to a stable solution.
This is not the behaviour we want.

\newthought{The second approach} is to calculate $\alpha$ from @eq:adiabatic-temperature-gradient as above but to match the pressure and temperature of the adiabat at the phase boundary.
Equivalently we can set $\alpha=0$ at the boundary so that ${dT \over dm} = 0$.
This gives an adiabat that crosses the boundary smoothly.

I used this second approach.
First I pre-calculated the values of $\alpha$ across the pressure--temperature domain of the equation of state.
I tried a thresholding procedure, in which values $\alpha$ is set to zero if it exceeds some threshold value.
But the value of $α$ varies strongly across the parameter space, and some of the phase boundaries have relatively small density changes, so I could not find a suitable threshold value for $α$ that left all the normal values of $\alpha$ within the phases untouched.
I therefore instead re-generated the table of $α$ phase by phase.
Within each phase I calculated $α$ as normal, then stitched the phases together by joining them directly in the same fashion as the EOS stitching in @sec:an-improved-water-equation-of-state.
In this way, I avoided generating artificial spikes in $α$ at the phase boundaries, retaining the behaviour of $α$ within each phase and producing a step, rather than a spike, at the boundary instead.
This produces adiabats that remain continuous at phase boundaries ([@fig:phase-boundary-issues]).

<!-- We might expect to see different results if we chose a different treatment.
A third option could involve calculating the specific entropy of water directly, rather than implicitly fixing it by setting $T$ and $P$ and then evaluating @eq:adiabatic-temperature-gradient.
We could then simply follow the adiabat into the planet by taking $T = T(P)$.^[In a discussion with Stéphane Mazevet (Observatoire de Paris), he suggested that it would be worthwhile for the pressure--temperature profile to trace contours of constant entropy directly, rather than fixing the pressure and temperature at the boundary. (S. Mazevet, personal communication, 31 March 2016)]
This would have the advantage of avoiding the numerical difficulty described above while also allowing for density discontinuities at phase boundaries.
But the degree to which this would change the results is unclear.
I obtained a copy of a water EOS that included data on the specific entropy across some of the phases of interest,^[S. Stewart, personal communication, 4 March 2016] but ultimately did not have enough time to carry out this approach for comparison.

This approach---smoothly following an isentrope---would also appear to presuppose that convective mixing can occur across phase boundaries, which is unlikely to be the case.
A more realistic model would likely involve some treatment of boundary layers between different phases and also between different materials.
At these boundaries we would perhaps expect a conductive boundary layer to form.^[See for example the work of Valencia et al., who include conductive boundary layers in their models.] -->

### Extracting phase information

My equation of state includes phase information for water^[
  *The phases of water*: The phases included in my EOS are: gas, liquid, supercritical fluid, plasma, superionic fluid; and ices Ih, II, III, V, VI, VII, VIII, and X.
] across its entire pressure and temperature range.
This information is either implicitly included in the definition of that region of the EOS, or it is explicitly included as part of the data tables that the EOS is drawn from.
For example, the phase ice-six (Ice VI) appears as one contiguous region in my equation of state and shares one functional form for density.
The domain of this region therefore defines the pressure--temperature region in which water is ice-six.
In comparison, the data tables from @French2009 cover several different phases of water.
For each $P$--$T$ pair in their tables, they label the corresponding phase, and I use these labels to determine which phase water is in at a given temperature and pressure.

I used this information to allow me to label the layers of my planetary models with the appropriate phases.
I label the atmosphere layer and everything at higher temperature than the condensation curve as gaseous.^[Technically an additional distinction may be made between *vapour* and a *gas*, the first being compressible to a liquid, but I treat these under the same label for the purpose of determining phase structure.]
Within the interior, I match pressure--temperature pairs to phases in a similar manner to the procedure described in @sec:how-i-collected-and-synthesized-the-data.
I define the boundaries of the ice phases using the boundaries from @Choukroun2007.
For non-ice phases, I extract phase information directly from the EOS tables where this is provided.^[@French2009; @Wagner2002]
For points off the unstructured grid, I take the phase of the nearest grid point in barycentric coordinates.
And for any phase not yet covered by any of these regions, I treat anything with greater pressure and temperature than the critical point as supercritical fluid, and anything with $P > P_\mathrm{c}$ but $T < T_\mathrm{c}$\marginnote{
  $P_\mathrm{c}$ and $T_\mathrm{c}$ are the pressure and temperature of the critical point of water ($22\,$MPa, $647\,K$).
} as liquid.

The end result is a mapping between $(P,T)$ and phase across the entire range of validity of my EOS.
I use this mapping to determine the phase at each mass step within the final model.
By linking it to the corresponding radial distance, I can therefore produce the radial phase structure of the watery layers in any planet model.
Finally, I include labels for both iron and silicate, though I do not specify the phases of these materials.
I label these materials based on the mass co-ordinate $m$ rather than pressure and temperature because the core and mantle are defined in terms of the mass fraction of the entire planet.

## Structural changes of migrating planets

When I investigate the phase structures of heated waterworlds in this chapter, I take the physical context to be that of a migrating planet.
Up to half of Sun-like stars have a super-Earth with a period less than $100$ days, and one way to explain these short periods is that the planets formed farther out and migrated inwards.^[@Izidoro2015]
Moreover, a third of confirmed exoplanets lie in multi-planet systems, and in such systems there are resonant processes at play that also affect migration.^[@Baruteau2014]
If these planets undergo migration, how are they affected by their changing proximity to the host star?
My key goal here is therefore to understand how changing the orbital separation of a water-rich planet can affect its radius and/or phase structure.

I generated internal structure models for watery planets undergoing migration.
I did this by moving the planet closer to its host star and recalculating its structure based on the changed surface boundary conditions.
Below, I have assumed a Sun-like star, but this method is applicable to any star and the distances will be scaled appropriately.^[One caveat: if the star is much cooler than the Sun, the two-stream irradiated atmospheric temperature profile may not be appropriate. See @sec:limitations-of-the-atmospheric-model.]

### Irradiation and internal heating

To place the planet in its physical context, I use its irradiation temperature (@eq:irradiation-temperature), which is repeated to the right as @eq:irradiation-temperature-repeat\marginnote{
  The irradiation temperature is
  \begin{equation}
    T_\mathrm{irr} = T_⊕ \sqrt{R_⊕ \over D}
    \label{eq:irradiation-temperature-repeat}
  \end{equation}
  where the planet orbits at a distance $D$ from a star of radius $R_⊕$ and temperature $T_⊕$.
  For simplicity, I assume zero albedo.
} for convenience.
The irradiation temperature is a parameter to the two-stream irradiated atmospheric profile from @sec:heating-and-the-atmosphere.
I calculated this temperature based on a Sun-like star ($T_⊕ = 5800\,$K, $R_⊕ = 7×10^8\,$m).
I then evaluated the planet's structure at different distances from the host star to simulate the effect of migration.

As well as setting the irradiation temperature according to the star--planet distance, I also fix the internal heating parameter $ɛ$.
In the previous chapter I showed how I link this parameter to an internal temperature for two-stream grey atmospheric model: the luminosity of the core is assumed to produce a black-body surface temperature that is then used as the internal temperature $T_\mathrm{int}$ in the atmospheric model.
I do not change this value as the planet is moved closer to its host star.

## Results

Here I present the structural changes of migrating planets.
[@Fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth] show two different groups of results.
In the top panels, I show how the radius of a watery planet changes with distance to its host star.
I also show the associated irradiation temperature at this distance.
In the bottom panels, I show the phase structure of these planets at selected points in this migration.

I have chosen to represent the phase structures of the planets as a colour-coded cross-section through the planet's interior.
Therefore I also provide [@fig:phase-key] as a key to the colours and scale of [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth].

![
  Key to [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth].
  The concentric dotted circles are at integer multiples of Earth's radius and the outermost solid black line is the planet's photospheric radius.
  Coloured layers show the phase structure of the planet.
  This key does not show every phase possible in my models, only the ones that appear in [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth].
](phase-key){#fig:phase-key}

These figures show several values and trends at a glance:

- how much of a planet's radius is contributed by its atmosphere;
- the relative size of heated watery planets; and
- the similarity or otherwise of the structure of their water layers.

![
  *Top panel:* Heated planets are larger, but how close does a watery planet need to be to its host star to grow significantly?
  Here I show the radius of a $1\,$M$_⊕$ watery planet ($30$% water by mass) at several different distances from a Sun-like star and with several different core energy generation rates.
  Such a planet can almost double in size or more if it is moved from $1\,$au to $0.1\,$au.
  There is also a kink in the curve for the lowest internal energy generation rate ($10^{-18}\,$W$⋅$kg$^{-1}$) near $3\,$au.
  This is caused by a transition to cold ice and liquid, causing a sharp change in radius (see below).
  *Bottom panel:* What do the interiors of these planets look like?
  Here I show structural diagrams for the models indicated with circles in the top panel.
  See [@fig:phase-key] for the colour key.
  The relative positions of the models are maintained.
  For example, the top red line in the top panel corresponds to the top row of models in the bottom panel.
  In almost all of these cases, the planets have a thick water vapour atmosphere.
  Deeper within the planet, the atmosphere transitions directly to superionic fluid and possibly plasma.
  The only exception is in the case of a cold planet past $3\,$au, which has a liquid layer around an ice VII shell.
](migration-1Mearth){#fig:migration-1Mearth}

The key results from these figures are as follows.

1. Small ($\lesssim 2\,$M$_\oplus$) watery planets can have extended low-density atmospheres.

2. For the most part, waterworlds in orbits comparable to Earth contain three key phases of water: gas, superionic fluid, and plasma. There is no liquid, ice VII or ice X except for cold planets in wider orbits ($\gtrsim 3\,$au).

3. There is a discrete transition in planet size for waterworlds with very low internal heating ($10^{-18}\,$W$\cdot$kg$^{-1}$). For a Sun-like star, this transition occurs at around $3\,$au.

### Small watery planets can have extended low-density atmospheres

A key question that arose in [@sec:watery-planet-interiors,@sec:heating-and-the-atmosphere] was whether the inflated radii of my models were primarily due to a phase transition from liquid to vapour, or whether they were the result of a more bulk expansion of the planet.
In @sec:watery-planet-interiors I suggested that the results indicated the latter rather than the former, but that a more thorough treatment of the atmosphere was needed, as it is not appropriate to assume that a gaseous layer is fully convective.

@Fig:migration-1Mearth reveals that the atmospheric component of these models is key to their inflated size.
When comparing phase structures of these identical-mass planets, most of the difference can be explained by the atmosphere itself.
There is some expansion in the heated internal layers too, but most of the expansion is caused by the atmosphere itself, at least for the lower-mass case ($M_\mathrm{P} \approx M_\oplus$).
For example, compare the top row of models in @fig:migration-1Mearth.
As the planet is moved closer to the star, the atmosphere expands while the other layers remain virtually static.

Comparing [@fig:migration-10Mearth] to [@fig:migration-1Mearth] then shows that this effect is exaggerated for low-mass planets ($\approx 1\,$M$_\oplus$).
This is a consequence of the effect I observed in @sec:heating-and-the-atmosphere, where lower-mass planets have lower gravity and are unable to hold onto their heated atmospheres.

By linking the temperature of the planet to its orbital separation, we can also see that large radial changes occur across a reasonable range of orbital distances and are not just confined to planets orbiting very close to their host star.
The range of orbital separations shown in [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth] is similar to the range from Mercury to Saturn in our solar system.

![
  As in [@fig:migration-1Mearth], but for a $3\,$M$_⊕$ planet.
  Comparing to [@fig:migration-1Mearth], we see that the $3\,$M$_⊕$ planets can actually be smaller than the $1\,$M$_⊕$ planets, at least where there is moderate internal or external heating.
  This is the upturn at the low-mass end of the mass--radius relation that I discussed in @sec:heating-and-the-atmosphere.
](migration-3Mearth){#fig:migration-3Mearth}

### These planets mostly contain three key phases of water

At the irradiation temperatures shown in [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth] , the bulk of these planetary models contain only three phases of water: gas, supercritical fluid and plasma.
There is little evidence that high-pressure ice phases like ice VII and ice X are present except in the case of very cold planets.^[It is certainly possible to generate planets with more varied phase structures. For example, see the images on the title page, which I generated by taking random temperatures, planet masses and water fractions. But most of the interesting structures arise with planets that are several times more massive than Earth and consist mostly of water (water fractions of 50% or more).]
In [@fig:migration-1Mearth;@fig:migration-3Mearth;@fig:migration-5Mearth;@fig:migration-10Mearth] the only models to contain phases other than these three were minimally internally heated ($\varepsilon = 10^{-18}\,$W/kg).
The plasma phase appears near the bottom of the water envelope for these cold planets, and the liquid and ice VII phases appear under a very thin gas atmosphere.

These graphs do not explore the trends for planets with water mass fractions other than $30$%.
However, we might expect that planets with larger water mass fractions are more likely to reach high-pressure ices near their core.^[In fact this can be seen in the pressure--temperature profiles for $100$% water spheres in [@fig:pressure-temperature-profiles], which reach ice X at their core.]
They will also be less dense and have a larger radius overall than planets with iron and silicate layers.
But the way in which my internal heating models are constructed, in which the internal heat ing comes from the core of the planet, means that the internal heating approaches zero as the core mass approaches zero.
We would need a way of representing energy generation from the water envelope itself (by a tidal heating model, for example) in order to continue modelling these high-water-mass planets as being internally heated.

### There is a discrete transition in planet size

The kink in the lower curve on [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth] is a discrete transition in phase structure for cold planets.
The phase structure of the resulting planet is visible as the bottom-right structure in the grid of models.
This structure contains a water layer over ice VII and ice X.
But these phases are only present when there is virtually no internal heating: even an Earth-like internal heating amount of $10^{-12}\,$W$⋅$kg$^{-1}$ in the core is enough to shift the path of the adiabat away from these cold ice phases and up to the supercritical fluid regime.

![
  As in [@fig:migration-1Mearth; @fig:migration-3Mearth], but for a $5\,$M$_⊕$ planet.
](migration-5Mearth){#fig:migration-5Mearth}


## Discussion

To wrap up the chapter, here I provide a short discussion on the limitations of these models and some thought on their astrobiological implications.

### Limitations of the phase structural models

The key limitation of labelling phases like this comes from the domain of the equation of state.
The EOS only extends down to $275\,$K.^[See @sec:how-i-collected-and-synthesized-the-data for full details on its domain.]
Below this temperature or otherwise outside its domain, I extrapolate by simply taking the closest point within the domain of the EOS.
At very high pressures, this gives results that are correct (because ice X occupies most of the phase space there), but it neglects the finer structure of various low-temperature ices.
It would not be appropriate to consider wholly solid planets with this approach because my models lack any convective heat transfer; others have developed models of cold icy bodies that are better suited to these applications.^[See for example @Ehrenreich2006.]

The actual positions of the phase boundaries are still a matter of debate too, at least at high pressures and temperatures.
However, I argue that the exact position of the phase boundaries is less important for gaining what is better understood as a broad overview of trends in planetary structure.
It would be very easy to repeat this analysis in future with improved equation of state data, or to add in different mineral phases of the iron and silicate layers if we wanted to examine their structure from a geological perspective.

I used these models to simulate the effects of migration.
We must assume that any movement occurs on timescales that are longer than the thermal equilibrium timescale of the planet (so that it remains in thermal quasi-equilibrium) and that there is no significant mass loss over this timescale.^[@Kurosaki2014 show that super-Earths with watery envelopes and radii between $1.5$ and $3\,$R$_\oplus$ can sustain these envelopes against photo-evaporation, while lighter components like hydrogen and helium are lost from the atmosphere on shorter timescales. [@Lopez2012; @Owen2015]
This is promising support for the stability of such water-rich super-Earths.]
Further, my atmospheric models assume a one-dimensional atmosphere and so therefore correspond to a well-mixed atmosphere without any latitudinal or longitudinal structure.
Such an atmosphere could be found around a planet that rotates rapidly compared to the orbital timescale.
Though my models also assume no rotation, in practice only a very rapidly rotating planet would affect the interior structure significantly.

![
  As in [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth], but for a $10\,$M$_⊕$ planet.
  The radius--distance relation is much flatter for these higher-mass planets.
  Looking at the phase structures, we can see why: they have much thinner atmospheres.
  As it is the low-density atmosphere that is most responsive to temperature changes, these planets grow less when heated than a lower-mass planet would.
](migration-10Mearth){#fig:migration-10Mearth}

### Astrobiological implications

I find the most interesting feature of these results to be what they indicate about the habitability properties of water-rich planets.
I include a short discussion of this below, but have not had time to pursue these ideas any further than these brief initial thoughts.

When I initially began to study water-rich planets, I expected that the most relevant phases of water would be liquid and ice.
But this chapter has shown that my models, at least, result mostly in diffuse gaseous layers when we consider a relatively broad range of heating parameters.
As well as finding that the radial changes due to temperature are significant, this project has also shown that the phase structure varies surprisingly little across this parameter space.
With larger water fractions, such layers mostly consist of gas and supercritical fluid.
What does this mean for the hospitability of such a planet?

If we accept that planets can be formed with significant water layers---and this is not particularly far-fetched, especially when we consider that even low water mass fractions can result in extended atmospheres---then these models show that liquid water may exist in a relatively narrow region of phase space.
This is an important consideration in calculations of the habitable zone.
For example, we saw above that the phase structure of a planet with a $30$% water layer allows for liquid water at the surface only when the planet is quite cold (irradiation temperature less than that of Earth's) and has very little internal heating ($10^{-18}\,$W$\cdot$kg$^{-1}$).
But such a planet's atmosphere is diffuse and gaseous even if the internal heating is up to two orders of magnitude lower than the Earth.

I did not have time to investigate the effect of the water fraction further.
We could consider checking the models by comparing them to the Earth's atmosphere.
But this is complicated by the fact that the Earth's atmosphere contains gases other than water.
It also terminates at a surface pressure of $1\,$bar, at which point my EOS has not yet even transitioned from the ideal gas equation of state.
Enhancing the EOS by adding a more appropriate treatment at the low-pressure end would be a useful next step.
Ultimately, my models currently lack the capacity to handle such a thin atmosphere; they are better suited to modelling planets with much heavier water layers.
Having said that, we can still use the Earth's water fraction as a useful reference point: its water fraction by mass is about $10^{-3.6}$ (see the next chapter), much lower than any of the water fractions considered in this study so far.

Depending on the orbital timescale and the timescales for convective turnover and atmospheric redistribution, we might expect a planet's structure to vary over time.
Investigating this would be another interesting extension to this work: might we expect the physical properties of a planet on an eccentric orbit to change over an orbital timescale?
Or would heat redistribution in the thick watery atmosphere and envelope smooth out the changes in internal^[Tidal forces might become significant if the planet comes close to its host star.] and external heating that would arise from a highly eccentric orbit?

What about the higher-pressure and higher-temperature phases such as supercritical fluid?
Are these environments inhospitable to life?
This is a more involved question than can be answered here but it is worth noting that thick ocean layers (and thick watery atmospheres) can easily shield the interior from radiation that would be problematic for life on other planets.
However, there are fundamental changes in the properties of water at these temperatures and pressures.
Hydrogen bonds are destroyed at high temperatures and water ceases to be a good solvent for electrolytes, becoming instead a non-polar fluid.^[@Ansimov2004]
And there are sudden changes in the chemical properties of liquid water past $0.2\,$GPa as well.^[@Kruse2007]
As much life on Earth is dependent on the peculiar chemical properties of water, it is unlikely that life as we know it could survive under such conditions.
Of course this does not rule out other conceptions of life based on non-polar solvents.
It does mean that the layered phase structure of a thick ocean planet could result in a relatively thin layer in which such life could survive.^[I would like to acknowledge that these interesting points about the properties of supercritical water were raised by the anonymous reviewer for our first paper [@Thomas2016].]
