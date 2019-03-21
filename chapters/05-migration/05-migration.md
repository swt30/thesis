# Phase structure and migration

Having constructed models of watery planets and examined how they change size with different modes of heating, what comes next?
I have continued my development of watery planet structure by investigating two key questions.
First, I would like to understand what the interiors of these planets actually look like.^[By this I mean that I would like to understand the *phase structure* of my models; that is, the layered structure of water. For example, the phase structure of the water layer might consist of gas over liquid over high-pressure ice.]
Second, I would like to understand how this internal structure (and the planet's observable properties) dynamically change as the planet is moved within the star--planet system.
This is a particularly relevant question in the context of planetary migration, but planets in elliptical orbits also vary in their star--planet separation, albeit on a much shorter timescale.

\newthought{Why is it desirable} that we know the phase structure of a planet?
The planet's structure could be important for several reasons.
The phase of water affects its bulk geophysical properties: water behaves very differently when it is solid than when it is liquid.
This consequently affects heat transfer within the planet.
And different ice phases may also adopt configurations in which other molecules such as methane are trapped within the water matrix, known as filled ice, and this can also alter the temperature of the interior.^[@Levi2014]
This may all have astrobiological consequences.
It is therefore useful to have some grasp on how varied the internal structures of these planets can be.

The phase structure of these planets is useful to know for other reasons too.
It provides a sanity check that these models are producing appropriate structures: we expect to see a gaseous atmosphere over layers of liquid, supercritical fluid/plasma, or high-pressure ices.
It allows us to see whether the equation of state had its detail in the right regions: we would prefer that the final planetary models consist of phases like gas and supercritical fluid rather than ice X because the latter's equation of state is not well-known.
And it provides an at-a-glance overview of the similarities and differences between planets with different heating parameters.

\newthought{To investigate these} two questions, I began by linking the planet's surface temperature to its physical context in a planet--star system.
I assumed a Sun-like star and fixed the orbital separation between this star and a water-rich planet of a given mass.
Then I calculated the irradiation temperature (@eq:irradiation-temperature) of the planet and solved for its radius and structure as described in previous chapters.
Within the planetary structure, I tracked the pressure--temperature profile and used this to determine the phase structure of water within the planet.
By changing the star--planet separation, I can observe how this phase structure varies.
This approach therefore provides an idea of what structural changes the planet might undergo as it migrates.

In this chapter I first give some background of how I calculated the phase structure of water in my models.
Then I present visualisations of the interior structure of a watery planet at different distances from a host star.
I show the results for a few different scenarios and highlight the interesting features of these results.

## The phase structure of a planet

A phase transition is a discrete change in the properties of a material.
This could be a dramatic change such as the transition between a liquid and a vapour, or it could be more subtle such as a change in the crystalline structure of ice.

Phase transitions occur within my planetary models when the temperature and pressure cross a phase boundary.
For example, [@fig:pressure-temperature-profiles] shows how several different planetary temperature--pressure structures each span different phases within pressure--temperature space.^[Recall that these boundaries are not necessarily well-defined at high temperatures and pressures because the behaviour of water has yet to be measured in these regions.]

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

My solver traces an adiabat through the envelope of the planet, and this adiabat's path depends on the equation of state: it is calculated from the thermal expansion coefficient $\alpha$, which I evaluate directly from the EOS by taking a partial derivative in the temperature direction.^[See @eq:thermal-expansion.]
But this approach breaks down at phase boundaries because they feature density discontinuities at which the thermal expansion coefficient becomes undefined.

This poses the problem of how to treat the boundaries between layers.
Is the adiabat continuous and smooth in P--T space, continuous and non-smooth, or discontinuous at the phase boundary?
And how should this be implemented in a way that can be used in a differential equation solver?
The answer depends on the properties of the material in question, in particular whether there is latent heat involved in the phase transition and what the relative thermal expansivities and heat capacities are in the different phases.

### The adiabatic temperature gradient at phase transitions

In the Earth, we see "seismic discontinuities", significant changes in seismic wave speeds at different depths.
These seismic discontinuities are caused by density discontinuities in the mantle minerals.
For example, one component of the mantle is a silicate called olivine ((Mg$_{0.9}$Si$_{0.1}$)$_2$SiO$_4$) which has a phase transition at a depth of about 400$\,$km or 14$\,$GPa.^[@Milone2014]
This is not a change in the chemical composition of the mantle, only in its molecular configuration---but it is enough to cause a density change and deflect seismic waves at that depth.
We therefore expect to see similar behaviour in water layers as they transition between ice phases.

First, it is worth pointing out that phase transitions do not actually happen at a single depth.
Because heat transport within the planet is driven by convection, the precise depth must vary within the planet depending on whether material is rising or falling.
Rising parcels of material within the mantle will be hotter than the surrounding material.
They will transition to the cooler phase only once they have exchanged heat with their surroundings, meaning that the phase transition occurs closer to the surface of the planet.
But, as the exact opposite effect occurs within falling parcels of cool material, it is reasonable to use the temperature and pressure of the surrounding material when calculating the depth at which a phase transition occurs on average.^[Such an assumption might no longer be be appropriate if we were not considering the planet as a whole---for example if we were considering a subducting slab i.e. material moving unidirectionally.]

\newthought{How do such} transitions affect the path of the adiabat in a convecting water ice layer?
Within a single phase, the adiabat follows the P--T path defined by the solution to [@eq:adiabatic-temperature-gradient-radial; @eq:adiabatic-temperature-gradient].
Between phases there may be a discontinuity, which may be accounted for in two ways.
If we know the specific entropy across the P--T range of interest, we can continue the adiabat into the new phase by matching the specific entropy at the boundary.^[This is because the adiabat is also an isentrope.]
Or if we know the latent heat of transition at the boundary but not the specific entropy on either side, we can use this to calculate the deflection of the adiabat, which is on the order of\marginnote{
  Here $\Delta T$ is temperature change, $\Delta H$ is latent heat and C$_\mathrm{P}$ is the isobaric heat capacity in the high-pressure phase.
} $$ \Delta T \approx {-\Delta H \over C_\mathrm{P}.} $${#eq:latent-heat-phase-transition}
But it is better to know the entropy directly as it can be used to calculate a more accurate deflection in both temperature and pressure, known as the Verhoogen effect.^[@Bina1998;@Verhoogen1965]

In summary, phase transitions cause a discontinuity and/or deflection of the adiabat into the planet, and this effect can only be correctly characterised with knowledge of latent heat or entropy across the phase boundary in question.

### My treatment of the adiabat

From the above section, a complete treatment of the adiabat across water phase changes requires one of two things.
Either we need the latent heat of transition between the two phases, or we need the specific entropy on either side of the phase boundary.
Furthermore, these measurements need to be complete and continuous in P--T space to allow for any potential adiabat to be calculated for any potential path.

However, neither of these pieces of information are available across the range of temperatures and pressures seen in my planetary models.
Even recent state-of-the-art equations of state do not treat entropy in a fully consistent way between phases,^[For example, @Mazevet2018 produced a comprehensive water equation of state that includes specific entropy within each phase. Yet they acknowledge in that paper that an adiabat calculated with their EOS is only valid within a single phase because the entropy measures are only consistent within phases and not between them.] and the data sources I drew my equation of state from in @sec:an-improved-water-equation-of-state did not provide this information.
Although this information is readily available for water, ice and steam, there is a paucity of such measurements in the high-pressure ice phases.

Because we do not have measurements of latent heat or entropy to guide us, we lack a principled way to determine where to start the adiabat as we cross into the next phase.
As discussed above, this would otherwise be provided by the Verhoogen effect or by taking isoentropes on an entropy surface.
So in the absence of this information, my implementation of the adiabat enforces continuity of temperature and pressure across phase boundaries.
I do not require the the thermal expansivity $\alpha$ to be continuous, so I therefore allow for the planetary adiabat to be non-smooth where it crosses boundaries.
But because I match the pressure and temperature of the adiabat at phase boundaries, this treatment is equivalent to assuming that there is no latent heat of phase transition.

\newthought{The way in which} I achieve continuity of temperature and pressure across each phase boundary is as follows.
It is not sufficient to simply calculate the thermal expansion coefficient $\alpha$ using @eq:thermal-expansion across all of P--T space, because this approach only yields the correct value for $α$ within each phase.
The density discontinuity at the phase boundaries ([@fig:density-jump]) means that we would obtain a peak in the value of $α$ across the boundary ([@fig:thermal-expansivity-correction]).

The "spike" seen in [@fig:thermal-expansivity-correction] is a partially a reflection of a physical process: a sharp density change at the phase boundary will be reflected as a spike in the value of $\alpha$, which is a directional derivative of density.
This change in density is associated with the release or absorption of latent heat.
But it is also a reflection of a numerical process: the height of this artifact depends on the EOS grid resolution because $\alpha$ is undefined at the boundary.
To put it another way, the value of the density derivative ceases to be well-defined at phase boundaries due to a discontinuity in density itself.
It therefore cannot be used to infer properties of the adiabat across the boundary, and we
cannot continue the adiabat across the phase boundary without a different approach.

![
  In this slice of constant temperature across the vapour--ice VII phase boundary, we see that the density increases rapidly---a result of interpolating between discontinuous values.
](density-jump){#fig:density-jump}

![
  The thermal expansivity $α$ is the partial derivative of the density in the temperature direction.
  Here we see that a simple treatment of $α$ leads to a large peak at the boundary.
  This is numerically problematic because it means we can no longer use $\alpha$ in @eq:adiabatic-temperature-gradient to trace the path of the adiabat across the phase boundary, and a different approach is needed.
](thermal-expansivity-correction){#fig:thermal-expansivity-correction}

To resolve this and produce an adiabat that crosses the boundary smoothly, I still calculate $\alpha$ from @eq:adiabatic-temperature-gradient as above---but I prevent the value of $\alpha$ from spiking at the boundary, forcing it to switch immediately to its value in the adjacent phase.
In practice I achieve this as follows.
First I pre-calculate the values of $\alpha$ across the pressure--temperature domain of the equation of state.^[I tried a thresholding procedure, in which $\alpha$ is set to zero if it exceeds some threshold value.
But the value of $α$ varies strongly across the parameter space, and some of the phase boundaries have relatively small density changes, so I could not find a suitable threshold value for $α$ that left all the normal values of $\alpha$ within the phases untouched.
I therefore instead re-generated the table of $α$ phase by phase.]
Within each phase I calculate $α$ as normal, then stitch the phases together by joining them directly in the same fashion as the EOS stitching in @sec:an-improved-water-equation-of-state.
In this way, I avoid generating artificial spikes in $α$ at the phase boundaries, retaining the behaviour of $α$ within each phase and producing a change in its slope, rather than a spike, at the boundary.
This yields adiabats that remain continuous at phase boundaries, like those shown in [@fig:pressure-temperature-profiles].
In contrast, there is no such need to repeat this process to deal with heat capacity discontinuities because the heat capacity is available directly and not as a directional derivative of the EOS; see @sec:thermal-expansion-and-heat-capacity-of-water for more information about heat capacity discontinuities in my EOS.

\newthought{Although the assumption} of no latent heat of phase transition is not ideal, I claim three reasons why it is not an irresponsible choice for the planets considered in this chapter.
First, theoretical studies of high-pressure ices suggest that their configurational entropies are quite similar.
That is, the portion of the specific entropy change that arises from the crystalline configuration of the ice phase does not appear to differ much from phase to phase---at most $5$%.^[@Herrero2014]
This then suggests that the latent heat difference between adjacent ice phases is also small.
Second, this is supported by studies that trace specific water adiabats through high-pressure ice.
For example, @Dolan2007 show an isentrope calculated from the liquid phase through ice VII; there is no perceivable discontinuity at the phase transition in that paper.
Finally, as we will see in this chapter, the bulk radius of a planet is driven primarily by changes to its atmospheric thickness and not by the thickness of deeper layers.
A planet's size is therefore insensitive to the precise position of phase boundaries in its water layers.

This assumption may be appropriate for the high-pressure ice--liquid phase transitions seen in this chapter, but there are two scenarios that warrant further caution.
The first scenario is where the planet contains materials other than pure water: the inclusion of other minerals can substantially alter the thermochemical properties of ice.
For example, adding methane results in a structure called methane clathrate or "filled ice" which has a very different thermal conductivity;^[@Levi2014] we might also expect its entropy to differ more between phases, producing a larger adiabatic discontinuity.
A case-by-case analysis of the latent heat of transitions in these altered water ices would be needed if we were to attempt to calculate an adiabat through their P--T phase space.
The second scenario is where a pure water planet underges a liquid--gas transition, as this has the largest latent heat of any water transition.
But the surrounding environment during a transition to gas is unlikely to be governed by an isentropic temperature profile any more, as we are likely in an atmospheric (radiative) regime; at this point a proper atmospheric treatment is a better choice.
In any case, I did not see any solid--liquid or liquid--gas transitions in the models in this chapter
([@fig:migration-1Mearth;@fig:migration-3Mearth;@fig:migration-5Mearth;@fig:migration-10Mearth]).

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
Finally, I include labels for both iron and silicate, though I do not specify the phases of these materials in more detail.
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
    T_\mathrm{irr} = T_\star \sqrt{R_\star \over D}
    \label{eq:irradiation-temperature-repeat}
  \end{equation}
  where the planet orbits at a distance $D$ from a star of radius $R_\star$ and temperature $T_\star$.
  For simplicity, I assume zero albedo.
} for convenience.
The irradiation temperature is a parameter to the two-stream irradiated atmospheric profile from @sec:heating-and-the-atmosphere.
I calculated this temperature based on a Sun-like star ($T_\star = 5800\,$K, $R_\star = 7×10^8\,$m).
I then evaluated the planet's structure at different distances from the host star to simulate the effect of migration.

As well as setting the irradiation temperature according to the star--planet distance, I also fix the internal heating parameter $ɛ$.
In the previous chapter I showed how I link this parameter to an internal temperature for two-stream grey atmospheric model: the luminosity of the core is assumed to produce a black-body surface temperature that is then used as the internal temperature $T_\mathrm{int}$ in the atmospheric model.
I do not change this value as the planet is moved closer to its host star.

## Results

Here I present the structural changes of migrating planets.
[@Fig:migration-1Mearth;@fig:migration-3Mearth;@fig:migration-5Mearth;@fig:migration-10Mearth] show two different groups of results.
In the top panels, I show how the radius of a watery planet changes with distance to its host star.
I also show the associated irradiation temperature at this distance.
In the bottom panels, I show the phase structure of these planets at selected points in this migration.

I have chosen to represent the phase structures of the planets as a colour-coded cross-section through the planet's interior.
Therefore I also provide [@fig:phase-key] as a key to the colours and scale of [@fig:migration-1Mearth;@fig:migration-3Mearth;@fig:migration-5Mearth;@fig:migration-10Mearth].

![
  Key to [@fig:migration-1Mearth;@fig:migration-3Mearth;@fig:migration-5Mearth;@fig:migration-10Mearth].
  The concentric dotted circles are at integer multiples of Earth's radius and the outermost solid black line is the planet's photospheric radius.
  Coloured layers show the phase structure of the planet.
](phase-key){#fig:phase-key}

These figures show several values and trends at a glance:

- how much of a planet's radius is contributed by its atmosphere;
- the relative size of heated watery planets; and
- the similarity or otherwise of the structure of their water layers.

![
  *Top panel:* Heated planets are larger, but how close does a watery planet need to be to its host star to grow significantly?
  Here I show the radius of a $1\,$M$_⊕$ watery planet ($30$% water by mass) at several different distances from a Sun-like star and with several different core energy generation rates.
  Such a planet can more than double in size if it is moved from $3\,$au to $0.3\,$au.
  *Bottom panel:* What do the interiors of these planets look like?
  Here I show structural diagrams for the models indicated with circles in the top panel.
  See [@fig:phase-key] for the colour key.
  Most of the diagrams show a thick water vapour atmosphere, transitioning to supercritical fluid and possibly plasma deeper within the planet.
  The relative positions of the models are maintained.
  For example, the bottom red line in the top panel corresponds to the bottom row of models in the bottom panel.
  The exception is for the top row of diagrams, which show planetary structures with $\varepsilon=10^{-8}$W$\cdot$kg$^{-1}$ that have not converged and are consequently not shown in the top panel.
](migration-1Mearth){#fig:migration-1Mearth}

\noindent The key results from these figures are as follows.

1. Small ($\lesssim 3\,$M$_\oplus$) watery planets can have extended low-density atmospheres, and these can be caused by either internal or external heating. But these models may only be reliable to a point: at high levels of heating, we see what seems to be unphysical runaway atmospheric growth.

2. For the most part, waterworlds in orbits comparable to Earth contain two or three phases of water: a gaseous atmosphere, a supercritical fluid layer, and possibly a plasma or ice X shell nearer the core. There is no liquid, ice VII or superionic fluid present in any of the planets modelled in this chapter.

3. For larger planets, such as those $\approx 10\,$M$_\oplus$, the size of the planet is relatively insensitive to its position within its orbit. This is because the massive planet is more easily able to hold onto its atmosphere, so external heating effects are weak when compared to the potential size change from increasing the internal energy generation rate instead.

### Small watery planets can have extended low-density atmospheres

@Fig:migration-1Mearth reveals that the atmospheric component of these models is key to their inflated size.
When comparing phase structures of these identical-mass planets, most of the difference can be explained by the atmosphere itself.
There is some expansion in the heated internal layers too, but most of the expansion is caused by the atmosphere itself, at least for the lower-mass case ($M_\mathrm{P} \approx M_\oplus$).
For example, compare the second row of models in [@fig:migration-1Mearth].
As the planet is moved closer to the star, the atmosphere expands while the other layers remain virtually static.

Comparing [@fig:migration-10Mearth] to [@fig:migration-1Mearth] then shows that this effect is exaggerated for low-mass planets ($\lesssim 3\,$M$_\oplus$).
This is a consequence of lower-mass planets having lower gravity.
Together with high temperatures, this leads to large atmospheric scale heights and hence extended atmospheres.^[However, here I have assumed no photoevaporation, which I do not treat in this study (see @Lopez2012 and @Kurosaki2014).]

By linking the temperature of the planet to its orbital separation, we can also see that large radial changes occur across a reasonable range of orbital distances and are not just confined to planets orbiting very close to their host star.
The range of orbital separations shown in [@fig:migration-1Mearth;@fig:migration-3Mearth;@fig:migration-5Mearth;@fig:migration-10Mearth] is similar to the range from Mercury to Saturn in our solar system.

These results are only reliable to a point, however.
Compare the top panels of [@fig:migration-1Mearth] and [@fig:migration-3Mearth].
The latter shows orbital separation--radius curves for four values of internal heating $\varepsilon$; the former shows only three.
What happened to the 10$\,^{-8}$W$\cdot$kg$^{-1}$ case?
The answer is that these models suffered from runaway atmospheric growth and did not converge.^[By this, I mean that the trial ODE solution failed to satisfy the inner boundary condition $r=0, m=0$ and instead reached $r=0$ first. Normally this would then result in us increasing our radius guess until the boundary condition was met ([@fig:solver-flowchart]) but no such increase in the radius could be found to produce a consistent solution.]
The upper row of models in the lower panel of [@fig:migration-1Mearth] show these unconverged models: they differ from the converged models by their lack of an Earth-like core.
This is because the core is defined as the region where $m<0.7$M$_\mathrm{planet}$, but this region is not reached before the integrator terminates at $r=0$.

I believe that this runaway growth is a result of incomplete opacity information in the outer atmosphere.
In @sec:heating-and-the-atmosphere I explained that our information about water opacity in the outer atmosphere is represented as a power-law fit to a grid of a few pressure--temperature pairs.
But the lowest of these temperatures is $1000\,$K and the lowest of these pressures is $1\,$bar.
Further, we saw that the outer edge of the atmosphere is defined as the solution to the equation @eq:optical-depth-at-photosphere.
This equation depends on the water opacity and, as we heat the planet, the pressure at which it is satisfied becomes very low.

To refine our estimates of planet sizes, the most important thing we could therefore do is to obtain better estimates for the opacity of water (and corresponding quantities like the opacity ratio $\gamma$) in this low-pressure regime.
But at these low pressures other considerations like photoevaporation become important too.
Because of the restrictions above, I am not confident that the planetary radii shown in this chapter are robust for strongly heated low-mass planets (i.e. [@fig:migration-1Mearth]).
I am more confident in the later figures and in the other observations about planetary structure, which I describe below.


![
  As in [@fig:migration-1Mearth], but for a $3\,$M$_⊕$ planet.
  Comparing to [@fig:migration-1Mearth], we see that the $3\,$M$_⊕$ planets can actually be smaller than the $1\,$M$_⊕$ planets, at least where there is moderate internal or external heating.
](migration-3Mearth){#fig:migration-3Mearth}

### These planets mostly contain three phases of water

At the irradiation temperatures shown in [@fig:migration-1Mearth;@fig:migration-3Mearth;@fig:migration-5Mearth;@fig:migration-10Mearth], the bulk of these planetary models contain only three phases of water: gas, supercritical fluid and either plasma or ice X.
There is no evidence that other high-pressure ice phases like ice VII are present.^[It is certainly possible to generate planets with more varied phase structures. For example, see the images on the title page, which I generated by taking random temperatures, planet masses and water fractions. But most of the interesting structures arise with planets that are several times more massive than Earth and consist mostly of water (water fractions of $50$% or more).]

These graphs do not explore the trends for planets with water mass fractions other than $30$%.
However, we might expect that planets with larger water mass fractions are more likely to reach other high-pressure water phases near their core.
They will also be less dense and have a larger radius overall than planets with iron and silicate layers.
But the way in which my internal heating models are constructed, in which the internal heating comes from the core of the planet, means that the internal heating approaches zero as the core mass approaches zero.
We would need a way of representing energy generation from the water envelope itself (by a tidal heating model, for example) in order to continue modelling these high-water-mass planets as being internally heated.

### Larger planets have a weak relationship between orbital radius and planetary radius

Comparing [@fig:migration-1Mearth] to [@fig:migration-10Mearth] shows how much flatter the orbital--planetary radius curve is for the more massive planet.
Earlier, we saw that low-mass planets can become highly inflated when heated, and that this inflation is due almost exclusively to the atmospheric layer of the planet expanding.
With higher-mass planets, we see the opposite: the planet's size is almost constant no matter whether it is positioned at $0.3$ or $10\,$au, the gaseous atmosphere occupying only a small portion of the planet's total radius in either case.

In the previous chapter we asked the question: given a planet that could be heated internally and externally, which mode of heating is dominant?
There we concluded that internal heating is more capable of increasing a planet's radius because it can affect the temperature throughout the entire planet rather than simply inflating the outer atmospheric layer.
In the flat orbital--planetary radius curves of [@fig:migration-10Mearth] we can see this effect strongly.
It is easier to inflate these massive waterworlds by heating them from the inside than by moving them closer to their host star.

This finding has implications for assessing the internal structure of an observed super-Earth, because it means that information about the planet's environment is not enough to determine whether its radius is inflated.
Instead, we must take into account that any *internal* energy generation---even if only comparable to the Earth's---can increase its radius and therefore lead to a different interpretation of the planet's structure.

![
  As in [@fig:migration-1Mearth;@fig:migration-3Mearth], but for a $5\,$M$_⊕$ planet.
](migration-5Mearth){#fig:migration-5Mearth}


## Discussion

To wrap up the chapter, here I provide a short discussion on the limitations of these models and some thought on their astrobiological implications.

### Limitations of the phase structural models

The key limitation of labelling phases like this comes from the domain of the equation of state.
The EOS only extends down to $275\,$K.^[See @sec:how-i-collected-and-synthesized-the-data for full details on its domain.]
Below this temperature or otherwise outside its domain, I extrapolate by simply taking the closest point within the domain of the EOS.
At very high pressures, this gives results that are correct (because ice X occupies most of the phase space there), but it neglects the finer structure of various low-temperature ices.
It would not be appropriate to consider wholly solid planets with this approach because my models lack any conductive heat transfer; others have developed models of cold icy bodies that are better suited to these applications.^[See for example @Ehrenreich2006.]

The actual positions of the phase boundaries are still a matter of debate too, at least at high pressures and temperatures.
However, I argue that the exact position of the phase boundaries is less important for gaining what is better understood as a broad overview of trends in planetary structure.
It would be very easy to repeat this analysis in future with improved equation of state data, or to add in different mineral phases of the iron and silicate layers if we wanted to examine their structure from a geological perspective.

I used these models to simulate the effects of migration.
In order for this to be reasonable, we must assume that any movement occurs on timescales that are longer than the thermal equilibrium timescale of the planet (so that it remains in thermal quasi-equilibrium) and that there is no significant mass loss over this timescale.^[@Kurosaki2014 show that super-Earths with watery envelopes and radii between $1.5$ and $3\,$R$_\oplus$ can sustain these envelopes against photo-evaporation, while lighter components like hydrogen and helium are lost from the atmosphere on shorter timescales. [@Lopez2012; @Owen2015]
This is promising support for the stability of such water-rich super-Earths.]
Further, my atmospheric models assume a one-dimensional atmosphere and so therefore correspond to a well-mixed atmosphere without any latitudinal or longitudinal structure.
Such an atmosphere could be found around a planet that rotates rapidly compared to the orbital timescale.
Though my models also assume no rotation, in practice only a very rapidly rotating planet would affect the interior structure significantly.

![
  As in [@fig:migration-1Mearth;@fig:migration-3Mearth;@fig:migration-5Mearth], but for a $10\,$M$_⊕$ planet.
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
For example, the phase structure of a planet with a $30$% water layer allows for liquid water at the surface only when the planet is quite cold (irradiation temperature less than that of Earth's) and has very little internal heating ($10^{-18}\,$W$\cdot$kg$^{-1}$).
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
This is a deeper question than can be answered here but it is worth noting that thick ocean layers (and thick watery atmospheres) can easily shield the interior from radiation that would be problematic for life on other planets.
However, there are fundamental changes in the properties of water at these temperatures and pressures.
Hydrogen bonds are destroyed at high temperatures and water ceases to be a good solvent for electrolytes, becoming instead a non-polar fluid.^[@Ansimov2004]
And there are sudden changes in the chemical properties of liquid water past $0.2\,$GPa as well.^[@Kruse2007]
As much life on Earth is dependent on the peculiar chemical properties of water, it is unlikely that life as we know it could survive under such conditions.
Of course this does not rule out other conceptions of life based on non-polar solvents.
It does mean that the layered phase structure of a thick ocean planet could result in a relatively thin layer in which life as we know it could survive.^[I would like to acknowledge that these interesting points about the properties of supercritical water were raised by the anonymous reviewer for our first paper [@Thomas2016].]
