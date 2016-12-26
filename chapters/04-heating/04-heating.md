# Heating and the atmosphere

In the previous chapter, I presented the initial results for the interior structures of heated planets and showed that the interior radius can change significantly with heating.
But upon reading that chapter it should quickly have become apparent that these models are limited.
What about the atmosphere?
Isn't it inappropriate to leave the surface pressure as a free parameter?
How do we make the link to a planet's observable radius?
And instead of setting the surface temperature explicitly, shouldn't we be linking this to the planet's host star and its environment?

This chapter addresses these questions.
Here I present an extension to my models that takes into account the planet's atmosphere.
I incorporate an analytic two-stream radiative transfer model to give an atmospheric temperature profile.
Then I compare the effects of heating via two different modes, internal and external, to assess whether watery planets are preferentially inflated by one mode of heating.

## Heated planets

A planet may be heated in several ways, both internal and external.

The Earth's net surface energy flux from internal sources is about $40\,$TW.^[@Davies1980]
Of this, $5\,$TW is generated within its crust and conducted to the surface.
The remaining $35\,$TW is generated within the interior of the planet and transported convectively.
This internal energy generation in planets arises primarily from three sources: the decay of radioactive elements; secular cooling and contraction; and tidal forces.

Tidal heating occurs when a planet is tidally distorted by its gravitational interaction with a host star.
For the Earth, tidal heating currently plays little role in internal energy generation.
It is generally neglected in thermal calculations.
However, rocky exoplanets that have eccentric orbits and pass close to their host star can be much more strongly tidally heated.^[@Barnes2010; @Driscoll2015]
This mode of heating is also important for moons, especially those around giant planets that are only weakly illuminated.
This could be the dominant form of heating in such moons.^[@Ross1989]

The decay of radioactive elements in a planet's interior results in heating.
In the Earth this value is about half of the total internal energy generation.^[@Davies1980]
The so-called "chondritic coincidence"^[@Suess1956; @Urey1956] refers to the fact this energy generation rate per unit mass is about the same as that observed in chondrites.

Cooling and contraction supply the remainder of a planet's internal energy budget.
In the Earth, the other half of the internal energy is supplied by cooling.

At the same time, a planet is heated externally by its host star.
One measure of this heating is the *equilibrium temperature*, which is calculated by assuming that the planet is in thermal equilibrium and that incident and outgoing radiation are balanced.
The equilibrium temperature $T_\mathrm{eq}$ is\marginnote{
  Here $T_\star$ is the stellar temperature, $a$ is the planet's albedo, $R_\star$ is the stellar radius and $D$ is the star--planet distance \citep{Burrows2010}. For the remainder of this chapter I assume zero albedo ($a = 0$).
} $$ T_\mathrm{eq} = T_\star \left( 1-a \right)^{1/4} \sqrt{R_\star \over 2D}. $$ {#eq:equilibrium-temperature}

In this chapter I will also follow @Guillot2010 by defining the irradiation temperature $T_\mathrm{irr}$, which is an effective temperature characterising the irradiation at the substellar point:
$$ T_\mathrm{irr} = T_\star \left( 1-a \right)^{1/4} \sqrt{R_\star \over D}. $$ {#eq:irradiation-temperature}
Because the temperature at the substellar point is hotter than the averaged temperature across the entire planet, the irradiation temperature is higher by a factor $\sqrt{2}$ than the equilibrium temperature.^[This corresponds to a factor of $4$ in incident flux.]

In the previous chapter we saw that the temperature of the planet affects its radius.
The planet's temperature is controlled by both internal and external energy sources, but they may have different effects on the radius.
We must therefore ask: which mode of heating is dominant?
We know that for the Earth, the balance is in favour of irradiation: internal heating only contributes a small amount to the energy balance of the planet.^[$40\,$TW of energy is produced internally but more than $150\,000\,$TW is supplied by irradiation [@Wengenmayr2012].]
But this is not necessarily the case for all planets.
For example, half of Jupiter's energy budget comes from internal heating.
Planets with thick opaque atmospheres might trap internal energy more effectively, exaggerating the heating effects of internal sources.
And water-rich icy moons could also be heated by tidal interactions while receiving very little irradiation.
It is therefore useful to understand whether *internal* heat can significantly contribute to the observed radius of a planet.
But there is a complication that comes with using my models in the previous chapter: they did not treat the planet's atmosphere.

### Incorporating the atmosphere

The models in the previous chapter have surface pressures of tens or hundreds of bars.
@Madhusudhan2015 discussed planets with water-rich atmospheres, describing the use of measurements both in and out of opacity windows to determine the atmospheric thickness.
The pressure to which these measurements probe can be $0.1\,$bar or lower in regions of high opacity.
My interior models therefore begin deeper within the planet, and we must include atmospheric layers if we are to correctly treat the region above that.

In the case of a volatile layer such as water, the line between interior and atmosphere can become blurred.
The picture is complicated by atmospheric effects that can increase the opacity.
If a cloud layer forms in the atmosphere, the opacity surface may not necessarily be at the same depth or pressure as any solid surface of the planet.
Turbidity effects around the critical point may also affect the opacity.
It is for this reason that very high-temperature super-Earths are interesting: at higher temperatures, a cloud deck is less likely to occur^[Some high-temperature condensates are possible but in general we expect clouds to be less of a problem at these higher temperatures.] and atmospheric measurements are therefore able to probe deeper.
The previously-mentioned opacity windows may therefore be able to provide a view through the atmosphere to the planet's surface, or at least to a point where the assumption of interior convective mixing is more likely to hold.

\newthought{We saw earlier} that heating a planet can moderately inflate its interior.
The same will be true for its atmosphere, but to what extent?
To answer this question completely, we need atmospheric models.
An ideal atmospheric model would include line-by-line opacities, clouds and chemical networks, and it would then be combined with an interior model like the one in the previous chapter.
But though a full atmospheric treatment is desirable, it is also difficult: it introduces many free parameters, it is computationally expensive, and ultimately it is beyond the scope of this dissertation.
I therefore conducted an initial exploration of this problem with an analytic atmospheric temperature model instead and investigated the effect on the observed radius.

### An improved structural model

To achieve the goal of incorporating atmospheric and heating information into the models, I did several things.
I extended the equation of state to lower pressures.
I added an atmospheric layer to the models.
And I treated the temperature gradient within this layer, which necessitated adding information on the optical depth and therefore the opacity of water vapour.
Finally, I added realistic boundary conditions to the models that are linked to the physical properties of the planet (its temperature and its transit radius).

\begin{marginfigure}
  \includegraphics{full-structure-sketch}
  \caption{Sketch of my final planetary models for this chapter, showing the layered structure. The planetary radius R$_\mathrm{P}$ is taken as the radius to the photospheric surface, which is also where the external boundary conditions are defined.}
  \label{fig:full-structure-sketch}
\end{marginfigure}

My final model ([@fig:full-structure-sketch]) comprises the interior structure from @sec:watery-planet-interiors (an iron core, a silicate mantle, and a water envelope) plus a water atmosphere.
Here I outline the full structural treatment, including my updated prescription for the boundary conditions.

Before we continue, some definitions are in order.
Normally we would understand the *surface* of a terrestrial planet as being defined by a sharp transition from a thin atmospheric layer to a rocky centre.
But for volatile-rich planets like these waterworlds, such a definition is no longer useful.
In this chapter I therefore use the following nomenclature to describe the different layers and boundaries in my model:

- The **photospheric surface** of a water-rich planet is defined by the depth to which light can no longer penetrate, which for this work I take to be a transverse optical depth of $\tau_\mathrm{t} = 1$. It defines the outer boundary of my models ([@sec:boundary-conditions]). The radius of the planet $R_\mathrm{P}$ is therefore the radius to the photosphere.
- The **atmosphere** is the outer portion of the planet that follows a radiative temperature profile below the photosphere.
- The **atmosphere above the photosphere** refers to the very outer layer of the atmosphere. It is not included in the models, which begin at the photosphere, but I later make some assumptions about the atmosphere above the photosphere to derive the model boundary conditions at the photosphere.
- The **radiative--convective boundary** is the transition between the radiative and convective regimes. It defines the base of the atmosphere.
- The **envelope** of my waterworld models refers to the water layer at depths greater than that of the radiative--convective boundary. It follows an adiabatic (convective) temperature profile.
- The **mantle** and **core** refer respectively to the silicate and iron layers, which are taken to have a mass ratio of $2$:$1$.
- The **Earth-like nucleus** refers to the mantle and the core.
- Finally, the **interior** of the planet includes the watery envelope, the mantle, and the core.

### Structural equations

In the previous chapter I modelled planets using three structural equations: [@eq:mass-continuity; @eq:pressure-gravity; @eq:adiabatic-temperature-gradient].
In this chapter I left the first two of these equations unmodified.
They are reproduced below as [@eq:mass-continuity-repeat; @eq:pressure-gravity-repeat] for completeness.
I then modified @eq:adiabatic-temperature-gradient to a more generic form (@eq:temperature-gradient-generic), allowing for different temperature structures.
Finally, I added @eq:optical-depth-gradient to track the optical depth within the atmosphere.

Together, [@eq:mass-continuity-repeat; @eq:pressure-gravity-repeat; @eq:temperature-gradient-generic; @eq:optical-depth-gradient] form a system of ordinary differential equations that I solve in the same manner as before. The equations are:

- the mass continuity equation,\marginnote{
  Here $r$ is the radius to a spherical shell, $m$ is the mass enclosed by that shell and $ρ$ is the density of the shell.}
  $$ {dr \over dm} = {1 \over 4πr^2ρ}, $$ {#eq:mass-continuity-repeat}

- the equation of hydrostatic equilibrium,\marginnote{
  Here $P$ is the pressure at the shell and $G$ is the gravitational constant.}
  $$ {dP \over dm} = -{Gm \over 4πr^4}, $$ {#eq:pressure-gravity-repeat}

- the temperature gradient,\marginnote{
  Here $∇$ describes how the temperature varies inside the planet; it varies depending on the mode of energy transport (see \cref{sec:the-atmospheric-treatment}).}
  $$ {dT \over dm} = ∇, $$ {#eq:temperature-gradient-generic}

- and the optical depth relation,\marginnote{
  Here $τ$ is the radial optical depth and $κ$ is the opacity.}
  $$ {dτ \over dm} = -{κ \over 4πr^2}. $$ {#eq:optical-depth-gradient}

### The optical depth and opacity

The fourth integration variable, optical depth,\marginnote{
  The definition of the optical depth is
  \begin{equation}
    dτ = -κρdr
    \label{eq:optical-depth}
  \end{equation}
  where τ is the dimensionless optical depth, $κ$ is the opacity (units of m$^2⋅$kg$^{-1}$), $ρ$ is the density and $r$ is the radius.
  Combining this with \cref{eq:mass-continuity-repeat} gives \cref{eq:optical-depth-gradient}.
} is a measure of attenuation in the atmosphere. Within the envelope, I ignore any further increase of the optical depth because it is unimportant for calculating the convective temperature profile.

The optical depth gradient depends directly on the density of the gas (@eq:optical-depth-gradient), which as we have seen is related to its temperature and pressure through the equation of state.
It also depends indirectly on the gas's temperature and pressure through the opacity $κ(P,T)$, which is another state function of the gas.

The meaning of "opacity" can vary from author to author.
Here, for consistency with the other authors I have cited in this chapter,^[@Rogers2010; @Kurosaki2014; @Guillot2010] I denote the opacity $\kappa$ to be the quantity with units of m$^2\cdot$kg$^{-1}$.^[It is sometimes called the mass attenuation coefficient, but is distinct from the attenuation coefficent whose units are m$^{-1}$.]
This opacity $\kappa$ is related to the absorption cross-section of the material by the formula $n\sigma = \kappa\rho$ where $n$ is the number density of absorbers, $\sigma$ is the absorption cross-section per absorber and $\rho$ is the density of the material.
I took the thermal opacity, $κ_\mathrm{th}$, as the representative opacity for the atmosphere.^[@Rogers2010]

The optical depth relation can take either a constant opacity $κ$ or allow the opacity to vary throughout the atmosphere.
Some previous studies have used a constant $κ_\mathrm{th}$: for example, the optical depth--temperature curves presented in @Guillot2010 are for a constant opacity.
In this study I allowed $κ_\mathrm{th}$ to change throughout the atmosphere, but I also examined the effects of using a constant $κ_\mathrm{th}$.
This choice is likely to be significant because the pressure varies over several orders of magnitude within the atmosphere; the opacity should then also vary.
I defer further discussion of the opacity to @sec:opacity-and-opacity-ratio, where I describe my source for the opacity data used in this study.

### Boundary conditions

A key requirement for building a coupled interior--atmosphere model is the knowledge of realistic boundary conditions.
The previous chapter used an arbitrary pressure for the surface of the models, but in reality the pressure is set by the depth beyond which atmospheric measurements can no longer probe.
And in principle this pressure could be observationally constrained through spectroscopic observations of the planetary atmosphere, though such observations are currently difficult for super-Earths.

Following the definitions in @sec:an-improved-structural-model, I use the following boundary conditions in my models.

##### Centre of the planet

For the internal boundary condition, I again take $r(m=0) = 0$ so that the mass enclosed is zero at the physical centre of the planet.
In practice I specify this by requiring that $0 <= r(m=0) < 1000\,$m. The final radius is therefore precise to within $1\,$km.

##### Layer boundaries

For the transitions between layers of different materials, I enforce continuity of the pressure $P$, temperature $T$, radius $r$ and mass enclosed $m$.
The optical depth $\tau$ is also an integration variable, but its value is unimportant below the radiative--convective boundary because it is not used in the convective region.
I therefore do not continue to track the optical depth within the envelope; in practice I achieve this by simply setting ${d\tau \over dm} = 0$ once the integrator reaches the envelope.

##### Photosphere

The external boundary condition is more complicated.
Because my models begin at the photosphere, we require a prescription that links the observable radius of the planet to the temperature, pressure and optical depth at that radius.
For the external boundary condition I therefore use the following derivation.^[This follows @Rogers2010.]

I begin with the planet's mass $M_\mathrm{P}$ and radius $R_\mathrm{P}$.
I take $r = R_\mathrm{P}$ at $m = M_\mathrm{P}$.
This definition therefore assumes that the atmosphere above the photosphere has negligible mass.

I next assume that the atmosphere above the photosphere is isothermal and that the gravity is constant.
In the atmosphere the equation of state is an ideal gas and therefore
$$ P = {\rho k_\mathrm{B} T \over \mu_\mathrm{eff}}. $$ {#eq:ideal-gas-for-boundary}
I assume that the opacity of the atmosphere can be written as a power law of the form $κ = C P^α T^β$.
Then taking the equation of hydrostatic equilibrium $dP/dr = -ρg$ and the definition of optical depth^[See @eq:optical-depth-gradient.] $dτ/dr = -κρ$ gives expressions for $P$ and $τ$ in the atmosphere above the photosphere that are exponential in the radius $r$:\marginnote{
  Here $P_\mathrm{R}$ and $τ_\mathrm{R}$ denote the pressure and optical depth at the planet's radius i.e. the photospheric pressure and the optical depth to the photosphere.
} $$ P(r) = P_\mathrm{R} e^{-(r - R_\mathrm{P})/H} $$ {#eq:pressure-exponential-atmosphere}
and
$$ τ(r) = τ_\mathrm{R} e^{-(α + 1)(r - R_\mathrm{P})/H} $$ {#eq:optical-depth-exponential-atmosphere}
where the pressure scale height $H$ is
$$ H = {R^2_\mathrm{P} k_\mathrm{B} T \over G M_\mathrm{P} μ_\mathrm{eff} }. $$ {#eq:pressure-scale-height}
It can also be shown that the relationship between $P_\mathrm{R}$ and $τ_\mathrm{R}$ is
$$ P_R = \left( { G M_\mathrm{P} \left( α+1 \right) τ_R \over R_\mathrm{P}^2 C T^β }\right). $$ {#eq:pressure-at-photosphere}

I define the photosphere to be at an optical depth of unity ($\tau_\mathrm{t} = 1$).
Optical depths lower than this lie above the photosphere; I treat this region as transparent and ignore it when I construct the final model.

We must also make a correction to this optical depth.
When an observer views a planet in transit, their line of sight at the photosphere passes through the limb of the atmosphere ([@fig:transverse-radial-optical-depth-relation]).
When I define the photosphere to be an optical depth of one, I therefore do so for the *transverse optical depth*^[This optical depth is also called a chord or slant optical depth.] $τ_\mathrm{t}$ only.
But my models are spherically symmetric and require the integration variables to be expressed in a radial form instead.
The corresponding *radial optical depth* $τ$ at the photosphere is less than one; the exact value depends on the opacity of the atmosphere.
The relationship between these two optical depths^[I do not include this derivation here but it is from @Hansen2008 and was used by @Rogers2010. [@Fig:transverse-radial-optical-depth-relation] shows the difference between the two optical depths. The relationship is approximate because it is truncated from an exponentially decaying integrand.] is
$$ τ_\mathrm{t} \approx γ τ_\mathrm{R} \sqrt{2π(α + 1)r \over H} e^{-(α + 1)(r - R_\mathrm{P})/H}. $$ {#eq:transverse-optical-depth}
Setting $τ_\mathrm{t} = 1$ at $r = R_\mathrm{P}$ gives the boundary condition on $\tau$:
$$ τ_R = {1 \over γ} \sqrt{H \over 2π \left( α+1 \right) R_\mathrm{P} }. $$ {#eq:optical-depth-at-photosphere}

![
  When an observer looks through the limb of a planet's atmosphere, the optical depth they see at the planet's radius $R_\mathrm{P}$ is a *transverse* depth $\tau_\mathrm{t}$.
  In general, this is not the same as the radial optical depth, notated as $\tau$ in the text and $\tau_\mathrm{rad}$ here for clarity.
  This schematic diagram shows how the transverse optical depth $\tau_\mathrm{t}$ through the atmosphere is different from the radial optical depth $\tau_\mathrm{rad}$ down into the atmosphere.
  Because the atmospheric temperature profile uses a radial optical depth, we need to correct for this discrepancy.
  The relation between the two is @eq:transverse-optical-depth.
](radial-optical-depth){#fig:transverse-radial-optical-depth-relation}

Finally, I obtain the temperature at the photosphere simultaneously with the radial optical depth from @eq:optical-depth-at-photosphere.
The photospheric temperature $T_\mathrm{R}$ differs from the irradiation temperature $T_\mathrm{irr}$, which is a model parameter.
The photospheric temperature therefore needs to be evaluated from the radiative temperature profile, which I will describe in @sec:the-atmospheric-treatment.
But the temperature profile depends on the optical depth, while the optical depth depends on the scale height and so also on the temperature.
I therefore solve simultaneously for $T_\mathrm{R}$ and $\tau_\mathrm{R}$ at the photosphere.
I evaluate the temperature at the photosphere from the radiative temperature gradient described in @sec:the-atmospheric-treatment.
At the same time, I evaluate the optical depth at the photosphere from @eq:optical-depth-at-photosphere.
After finding the ($T_\mathrm{R},\tau_\mathrm{R}$) pair that satisfies these equations, I set the external pressure boundary condition using @eq:pressure-at-photosphere.

In almost all other respects, the solver works as described in @sec:watery-planet-interiors and shown in [@fig:solver-flowchart].
The only additional step is this calculation of the pressure, temperature and optical depth boundary conditions as described above.
This process is repeated after each trial solution.
In this fashion my models converge on the correct values of $P_\mathrm{R}$, $T_\mathrm{R}$ and $τ_\mathrm{R}$ as the radius of the planet converges.

I also slightly altered the prescription for the mass grid described in @sec:effect-of-the-mass-grid-size.
I still choose the smallest step size $dm / M_\mathrm{P}$ to be $10^{-10}$, but I alter the factor by which this size grows at each step.
I tune this factor to ensure that half of the mass steps lie within the atmosphere and half lie within the interior.
This empirical prescription gives an appropriate resolution throughout the model.

### The atmosphere--envelope transition

The boundary between the irradiated atmosphere and the adiabatic interior should normally be defined by the Schwarzschild criterion for convective instability.^[A material for which $$ \left|{d \ln T \over d \ln P}\right|_\mathrm{ad} < \left| {d \ln T \over d \ln P} \right|_\mathrm{rad} $$ is unstable against convection. That is, the convective--radiative boundary occurs at the point where the radiative temperature gradient becomes larger than the adiabatic temperature gradient.]
This criterion depends on the thermal behaviour of water and requires assessing whether the radiative or adiabatic temperature gradient is steeper.
In [@sec:pressure-at-the-radiativeconvective-boundary] I assess several constant values for this transition pressure and show that the choice has a negligible effect on the final radius.
I therefore chose a representative constant pressure of $100\,$bar as a first approximation for this transition, rather than evaluating the Schwarzschild criterion explicitly.
This transition pressure is close to the value of approximately $50\,$bar from @Kurosaki2014.
For the rest of this chapter I denote this quantity by $P_\mathrm{env}$, meaning the pressure at the top of the envelope.

### The updated equation of state

For this work, I added the ideal-gas behaviour of water ([@eq:general-ideal-gas-law]) to the equation of state.
The domain of my EOS now extends from $1\,$Pa up to $10^{14}\,$Pa.
Previously I had extrapolated upon leaving the edge of the EOS domain; this was not a problem because I started our models at high pressure, but in order to represent the atmosphere appropriately I needed to extend the EOS to low pressures.
In order that the atmosphere is treated entirely as an ideal gas, I use the ideal gas EOS for all pressures less than $100\,$bar.

All other EOS behaviour is as described in @sec:an-improved-water-equation-of-state.
In particular, I maintained the same data sources and grid resolution for the base EOS.
Only in the region where $P < 100\,$bar does the EOS differ from that chapter.

## The atmospheric treatment

Here I outline the atmospheric temperature profile and how I link it to the internal and external heating. I use three different prescriptions for the temperature gradient $∇$ in @eq:temperature-gradient-generic, depending on the mode of energy transport.

Within the core, where temperature effects are negligible, I set $∇ = 0$ to make the core isothermal.
The edge of the core is specified as a fraction of the planet mass and fixed as a model parameter.
When solving the structural equations, I therefore switch to this isothermal treatment once $m < f M_\mathrm{P}$, where $m$ is the mass co-ordinate, $f$ is the core fraction and $M_\mathrm{P}$ is the total mass of the planet.

For convective transport within the watery envelope, I use the adiabatic temperature gradient from @eq:adiabatic-temperature-gradient as explained in the previous chapter.

Finally, for the atmosphere, I compared two different treatments.
The first a two-stream grey analytic temperature profile; the second is an isothermal fixed-height atmosphere.

### Two-stream temperature profile

I added a radiative temperature profile in the atmosphere by using an analytic two-stream temperature profile.
The profile I used is obtained from @Guillot2010, given by\marginnote{
  Here $T(\tau)$ is the temperature at an optical depth of $\tau$; $T_\mathrm{int}$ is the effective internal temperature;
  $T_\mathrm{irr}$ is the planet's irradiation temperature;
  $\mu_*$ = $\cos \theta_*$ is the angle of the normal at the surface to the incident radiation ($\mu_* = 1$ at the substellar point);
  $\gamma = {\kappa_\mathrm{th} \over \kappa_\mathrm{vis}}$ is the ratio of the thermal and visual opacities.
} $$ \begin{split}
T^4(\tau) &= {3 T_\mathrm{int}^4 \over 4} \left[ {2 \over 3} + τ \right] \\
& \quad + {3 T_\mathrm{irr}^4 \over 4} μ_*
\left[ {2 \over 3} + {μ_* \over γ} + \left( {γ \over 3 μ_*} - {μ_* \over γ}e^{-γτ/μ_*} \right) \right]
\end{split} $$ {#eq:two-stream-temperature-profile}
and set $\mu_* = 1/\sqrt{3}$, the appropriate level for isotropic irradiation.
This temperature profile is defined in terms of the radial optical depth $τ$.
Because I use the thermal opacity $\kappa_\mathrm{th}$ as the representative opacity for the atmosphere, the optical depth is for thermal radiation (@eq:optical-depth); this matches the definition of @Guillot2010.

There are two ways in which we could incorporate this temperature profile.
The first is to remove the temperature as an integration variable within the atmosphere.
Instead, the temperature can be calculated directly from the optical depth using @eq:two-stream-temperature-profile.
But this approach is inconsistent with the way the temperature profile is treated in the envelope: there, the temperature is evaluated as the solution of an ODE (@eq:temperature-gradient-generic).
The second option is therefore to instead take the derivative of @eq:two-stream-temperature-profile and use it as the right-hand-side of @eq:temperature-gradient-generic.

For convenience, I chose this second approach: the way my code \smallcaps{OGRE} is structured means that is easy to add a new differential equation to the model but harder to add an explicit relation.
Although this is more prone to numerical error than evaluating the temperature directly for a given $τ$, it is no more so than any of the structural equations, all of which require solving an ODE in the same way.
Nevertheless, I minimised the risk of this by using automatic differentiation to provide fast exact derivatives of the temperature profile.^[Automatic differentiation is a technique for obtaining exact derivatives of explicitly specified functions without using finite-differencing. I used the Julia package [ForwardDiff.jl](https://github.com/JuliaDiff/ForwardDiff.jl).]
For the two-stream atmosphere treatment, I therefore evaluate the temperature gradient $∇$ as $$ ∇ = {dT \over dm} = {dT \over dτ} {dτ \over dm}. $$ {#eq:two-stream-wrt-m}
where $dT \over dτ$ is the derivative of the temperature profile given above (@eq:two-stream-temperature-profile) and $dτ \over dm$ is @eq:optical-depth-gradient.

### Isothermal fixed-height atmosphere

I also compared the two-stream temperature profile to an isothermal fixed-height atmosphere.^[I use the term fixed-height because the thickness of the atmosphere is constant for a given planetary model, depending only on the temperature and gravity, rather than generated by solving for a self-consistent temperature profile.]
But I construct this isothermal atmosphere in a different way.
Instead of evaluating the radiative temperature profile and tracking the optical depth within the atmosphere, I begin by ignoring the atmosphere and constructing the interior as if it were bare, like in the previous chapter.
In practice I do this by setting the external pressure boundary condition to $100\,$bar so that the models begin at the radiative--convective boundary.
On top of this bare envelope, I then assume a constant-gravity isothermal layer of gas.
I take the thickness of this layer to be eight scale heights,^[Typical atmospheres are 5--10 scale heights thick [@Madhusudhan2015].] where the scale height is calculated for a given gravity and temperature.
The equation for the pressure scale height of a plane-parallel water vapour atmosphere is\marginnote{
  $R_\mathrm{H_2O}$ is the specific gas constant for water ($R_\mathrm{H_2O} = 461\,$J$⋅$K$^{-1}⋅$kg$^{-1}$).
} $$ H = {R_\mathrm{H_2O} T \over g}, $$ {#eq:scale-height}
I calculate the scale height $H$ and add an eight-scale-height thick ($8\,H$) isothermal atmospheric layer on top of the bare interior model.

### Source of opacity

My source for the opacity data was @Kurosaki2014.
In their paper they simulated the evolution of water-rich sub- and super-Earths.
They provided simple power-law expressions for the opacity of water vapour based on a fit to HITRAN^[@Rothman2013] data.
I have taken these opacities and used them in the two-stream analytic atmosphere.

The opacity I used is
$$ κ_\mathrm{th} = 3.07 × 10^2
    \left({P \over \mathrm{1\,bar}}\right)^{0.9}
    \left({T \over \mathrm{1000\,K}}\right)^{-4.0}
    \mathrm{cm}^2⋅\mathrm{g}^{-1}.
$$ {#eq:opacity}
which is a power-law fit to the Rosseland mean opacity.
In SI base units this becomes
$$ κ = C P^α T^β $$ {#eq:opacity-SI}
where $C = 9.71×10^8~$m$^2⋅$kg$^{-1}$, $α = 0.9$, $β = -4.0$, and $P$ and $T$ are in Pa and K respectively.
This is the same form as was used to derive the boundary conditions in @sec:boundary-conditions; consequently, I use the values of $\alpha$ and $\beta$ here in [@eq:pressure-at-photosphere;@eq:optical-depth-at-photosphere].

@Tbl:opacities shows sample values of the thermal opacity $κ_\mathrm{th}$ evaluated from @eq:opacity.
It also shows the visual opacity $κ_\mathrm{vis}$ from the same paper^[@Kurosaki2014] and the ratio of the two, $γ = {κ_\mathrm{vis} \over κ_\mathrm{th}}$.

| P / bar | T / K | $κ_\mathrm{th}$ / m$^2⋅$kg$^{-1}$ | $κ_\mathrm{vis}$ / m$^2⋅$kg$^{-1}$ | $γ = {\kappa_\mathrm{vis} \over \kappa_\mathrm{th}}$ |
|--------|--------|----------------|----------------|----------------|
| $0.01$ | $300$  | $6.01×10^1$    | $3.56×10^{-3}$ | $5.93×10^{-5}$ |
| $0.01$ | $1000$ | $4.87×10^{-1}$ | $2.20×10^{-3}$ | $4.52×10^{-3}$ |
| $0.01$ | $2000$ | $3.04×10^{-2}$ | $1.67×10^{-3}$ | $5.48×10^{-2}$ |
| $1$    | $300$  | $3.79×10^3$    | $3.56×10^{-1}$ | $9.39×10^{-5}$ |
| $1$    | $1000$ | $3.07×10^2$    | $2.20×10^{-1}$ | $7.17×10^{-3}$ |
| $1$    | $2000$ | $1.92$         | $1.67×10^{-1}$ | $8.69×10^{-2}$ |
| $100$  | $300$  | $2.39×10^5$    | $3.56×10^1$    | $1.49×10^{-4}$ |
| $100$  | $1000$ | $1.94×10^3$    | $2.20×10^1$    | $1.14×10^{-2}$ |
| $100$  | $2000$ | $1.21×10^2$    | $1.67×10^1$    | $1.38×10^{-1}$ |

Table: Opacities ($κ$) and opacity ratios ($γ$) calculated from the power-law forms in @Kurosaki2014 across a range of pressures and temperatures relevant to the atmosphere of a heated waterworld. {#tbl:opacities}

I caution that these opacities may be too simple for the following reasons:

-   They appear to include no treatment of collisionally-induced absorption.
-   They are a least-squares fit to mean line opacities only.
-   They use the HITRAN database, albeit a recent version, rather than the more comprehensive HITEMP database which contains many more transitions for water.
-   They are fitted to just three different temperatures, the lowest of which is $1000\,$K, and three different pressures, the lowest of which is $1\,$bar.
At the top of the atmosphere we expect the pressure and temperature to be lower than both of these.

Nevertheless, choosing a power-law opacity allows us to simplify the expressions for the surface optical depth and pressure to the forms in @sec:boundary-conditions.
We therefore have reasonable physically-motivated boundary conditions for the external boundary, and hence a plausible link between the transit radius of the planet and its internal structure model.

The opacity enters the structural equations through the optical depth gradient (@eq:optical-depth-gradient).
I compute $\kappa_\mathrm{th}$ using @eq:opacity and the pressure--temperature profile of the model.
My models therefore take into account the varying opacity of water vapour within the atmosphere, rather than assuming a constant $\kappa_\mathrm{th}$.

In contrast to the variable $\kappa_\mathrm{th}$, I fixed the visual--thermal opacity ratio $\gamma$ to $0.01$ based on representative values at $1000\,$K from @Kurosaki2014 (@tbl:opacities).
My justification for doing so is that if I instead allow $\gamma$ to vary, my models become unphysically large.^[For example, I was able to produce $1\,$M$_\oplus$ planets larger than $50\,$R$_\oplus$ by setting $\gamma = 10^{-6}$.]
I believe that this is because the power-law in @eq:opacity is made by fitting to only three temperatures: $1000\,$K, $2000\,$K and $3000\,$K.
Outside this range there is no guarantee that either $\kappa_\mathrm{th}$ or $\kappa_\mathrm{vis}$ is valid, and accurately assessing the value of $γ$ is difficult.
This is especially problematic near the photosphere because the density of the gas becomes very low ($10^{-4}\,$bar), far outside the range of the power-law relationship.
I concluded that the ratio of the two in the upper atmosphere at low pressure and temperature is unreliable, at least with my current opacity prescription.
I therefore fixed $\gamma=0.01$; @tbl:opacities shows that this is an appropriate choice for $1000\,$K water vapour, which is the lowest temperature for which the opacities are valid.

I also assessed what happened when I changed the fixed value of $\gamma$ and when I fixed $κ_\mathrm{th}$.
@Rogers2010 tested values of $γ = \left[ 0.1, 1, 10 \right]$ in their models of hydrogen-atmosphere planets, so I also tested these values.
And I trialled various fixed values for $\kappa_\mathrm{th}$ across the range in @tbl:opacities.
I defer these results to @sec:parameter-explorations, as I must first wrap up my theoretical development of the atmospheric models by explaining how I link the planet's heating to its structure.

### Internal heating

Because my code does not solve any equations of internal energy transport, I represent the internal energy generation as a temperature boundary condition.

To do this, I assume that the nucleus of the planet (but not the watery envelope) generates energy that is transported through the envelope to the base of the atmosphere.^[The Earth's internal energy generation rate is on the order of $1$ to
 $10\,$pW$\cdot$kg$^{-1}$ if we assume that energy generation occurs only in the mantle [@Davies1980].]
I represent this energy by an effective temperature $T_\mathrm{eff}$ at the radiative--convective boundary.
That is, I set the energy generation rate per unit mass in the Earth-like nucleus, $ɛ$, which has units of W$\cdot$kg$^{-1}$.
The luminosity of the nucleus is then\marginnote{
  $L$ is the luminosity of the Earth-like nucleus, $M_\mathrm{P}$ is the planet's mass, $ɛ$ is the luminosity of the nucleus per unit mass, and $f$ is the water content as a fraction of the planet's mass  ($f_\mathrm{nucleus} = 1 - f$).
} $$ L = M_\mathrm{P} (1 - f) ɛ, $$ {#eq:core-luminosity}
where
I assume that the planet radiates this energy isotropically; for convenience I take the radius at which the energy is radiated to be $R_\mathrm{P}$.
I then use the Stefan--Boltzmann black body relation,\marginnote{
  $\sigma_\mathrm{B}$ is the Stefan--Boltzmann constant.
} $$ T_\mathrm{eff}^4 = {L \over 4πR_\mathrm{p}^2 σ_\mathrm{B}}, $$ {#eq:effective-temperature}
to determine the effective temperature of the planet based solely on its internal heating.

This effective temperature is used as an input to the atmospheric temperature profile.
The effective temperature can be relatively low but thanks to the insulating effect of the atmosphere this results in a stronger heating effect than otherwise would be expected.
This prescription therefore provides a simple link between the internal energy generation and the internal heating of the atmospheric model, and hence the total radius of the planet.

In reality, because the internal heat is assumed to be deposited at the base of the atmosphere, @eq:effective-temperature should use the radiative--convective boundary radius $r(P = 100\,\mathrm{bar})$ rather than the planet's radius $R_\mathrm{P}$.
This prescription therefore assumes that the atmosphere is relatively thin.^[We can show that this effect is minimal for Earth-like planets if we assume an isothermal fixed-height atmosphere. The scale height $H$ of a water atmosphere on an Earth-like nucleus at $500\,$K is approximately $20\,$km (@sec:effect-of-the-mass-grid-size). Therefore a $10\,H$ atmosphere is approximately $200\,$km thick [@Madhusudhan2015], only $3$\% of the total radius.]

As in the previous chapter, my internal heating treatment also assumes that the energy generated within the planet is sufficient to drive convection through the planet's envelope.
This results in a temperature gradient that increases downward into the planet until we reach the isothermal nucleus.

### External heating

The irradiation temperature $T_\mathrm{irr}$ of a planet (@eq:irradiation-temperature) provides a proxy through we can characterise the radial change due to external heating from the star.
I have defined the irradiation temperature in the same way as @Guillot2010, and can therefore use it as a parameter in the two-stream analytic atmospheric model (@eq:two-stream-temperature-profile).
We can also use the irradiation temperature in the isothermal fixed-height atmosphere by equating it with the temperature of the entire atmosphere.

The definition of the irradiation temperature, @eq:irradiation-temperature, is based on the star's radius and temperature.
But in this chapter I do not evaluate the irradiation temperature from the properties of a host star, choosing instead to set it directly.
That is, I vary over different values of $T_\mathrm{irr}$ in my models.


## Results

Using the models that I have just described, I investigated the effects of the various model parameters on the mass--radius relation and internal structure of watery planets.
Below, I first summarise the key results, then elaborate on these by detailing which parameters I explored.
I also show a comparison intended to assess the relative effects of internal and external heating on an irradiated waterworld, and I compare the two-stream analytic atmosphere to an isothermal fixed-height atmosphere.

In this chapter I will show five key findings:

1. The presence of an atmosphere makes an observable contribution to the mass--radius relation due to the opacity $\kappa_\mathrm{th}$.
2. An Earth-like degree of internal heating is enough to significantly inflate a watery super-Earth when compared to a planet with no internal heating.
3. These watery super-Earths can be inflated by both internal or external sources of energy. But, all other things being equal, changing the external heating appears to affect their radius more than changing the internal heating.
4. An isothermal fixed-height atmosphere is a good approximation to an isothermal two-stream analytic atmosphere for planets more massive than $2\,$M$_\oplus$. But the fixed-height atmosphere is not a good approximation when there is a strong temperature gradient, such as that due to a strong opacity.
5. The water fraction of these planets also makes a significant contribution to their total radius.


### Parameter explorations

Here I present the results of changing various parameters. @Tbl:default-values shows the default values used unless specified otherwise. Each figure in this chapter is also labelled with the parameters used to generate those models.

| Parameter |        | Value |
|-----------|--------|-------|
| Planet mass range | $M_\mathrm{P}$ | $0.5$--$10\,$M$_⊕$ |
| Internal energy generation rate | $ɛ$ | $10^{-12}\,$W$⋅$kg$^{-1}$ |
| Irradiation temperature | $T_\mathrm{irr}$ | $300\,$K |
| Water mass fraction | $f$ | $0.3$ |
| Thermal opacity | $κ_\mathrm{th}$ | variable$^\star$ |
| Visual/thermal opacity ratio | $γ$ | $0.01$ |
| Atmosphere--envelope transition pressure | $P_\mathrm{env}$ | $100\,$bar |

Table: Default values used in the parameter exploration. $^\star$By "variable" I mean that the opacity is allowed to increase into the atmosphere according to @eq:opacity and the atmospheric temperature and pressure, rather than kept fixed. {#tbl:default-values}

##### Opacity and opacity ratio

The opacity of the atmosphere is an important parameter affecting the radius of the planet ([@fig:opacity]).
I generated mass--radius relations for planets with different opacity treatments: a variable opacity calculated from the pressure--temperature profile, and a fixed opacity.
The radius of the planet changes significantly if the opacity is increased.
For example, for a $2\,$M$_\oplus$ planet, the radius is $1.8\,$R$_\oplus$ if the opacity is fixed to $100\,$m$^2\cdot$kg$^{-1}$.
But increasing it to $1000\,$m$^2\cdot$kg$^{-1}$ gives a planetary radius of $2.2\,$R$_\oplus$.

If I fix the opacity to an appropriate value, I can reproduce the mass--radius relation for the variable--opacity case.
This value is approximately $100\,$m$^2\cdot$kg$^{-1}$ for the models in [@fig:opacity].

![
  The choice of opacity $\kappa_\mathrm{th}$ for a watery atmosphere can strongly affect the final radius of the planet.
  Allowing the opacity (@eq:opacity) to increase into the atmosphere with the pressure and temperature profile produces inflated radii over the zero-opacity case.
  But if we fix $\kappa_\mathrm{th}$ to an appropriate value ($100\,$m$^2\cdot$kg$^{-1}$ in this figure), we can also reproduce the same mass--radius relation as the variable-$\kappa_\mathrm{th}$ case.
](opacities){#fig:opacity}

This change in radius is because the opacity controls the rate at which the optical depth increases into the atmosphere, and therefore affects the degree to which heat can be trapped.
Compared to H/He atmospheres, H$_2$O absorbs more strongly in the infrared^[The opacity that @Rogers2010 use for hydrogen atmospheres gives an opacity $\kappa_\mathrm{th} = 3 \times 10^{-3}\,$m$^2\cdot$kg$^{-1}$; the water opacity from @eq:opacity under the same conditions is $3 \times 10^2\,$m$^2\cdot$kg$^{-1}$, five orders of magnitude higher.] and so the optical depth at the radiative--convective boundary is often on the order of $10^4$ or $10^5$.
This means that energy is readily absorbed in the water layers and converted into a temperature difference.

Setting $κ_\mathrm{th} = 0$ has the effect of making the atmosphere isothermal because $\tau$ is constant and the temperature is a function of $\tau$ [@eq:two-stream-temperature-gradient].
[@Fig:opacity] shows that the radius of a planet is smaller for $\kappa_\mathrm{th} = 0$ than when the atmosphere has non-zero opacity.

\newthought{In contrast}, the visual--thermal opacity ratio $γ$ appears to have a relatively weaker small effect on the final radius ([@fig:opacity-ratio]).
My models use a fixed $\gamma$ of $0.01$, which is typical for hot ($1000$--$2000\,$K) regions deeper within the atmosphere ($1$--$100\,$bar).
I also assessed the mass--radius relation for the values [$0.1$, $1$, $10$] which covers the range of $\gamma$ used by @Rogers2010 in their models of hydrogen envelopes.
The mass--radius relation does not change significantly over this range.

![
  The visual/thermal opacity ratio $\gamma$ does not strongly affect the mass--radius relation.
  Here I test several values on both sides of the $γ=1$ case, where the visual and infra-red opacity are identical.
  I caution that an accurate determination of $\gamma$ in cooler regions of the upper atmosphere ($P < 1\,$bar, $T < 1000\,$K) is difficult due to the domain of the opacity data used to generate the power-law opacities from @Kurosaki2014.
  For this reason I choose a fixed value of $\gamma = 0.01$ in my models.
  Here I show that testing several other values around $\gamma=1$ does not significantly alter the final radius of the planet.
](opacity-ratio){#fig:opacity-ratio}

##### Internal heating

I assessed the degree of internal heating needed to significantly change the radius of a water-rich planet ([@fig:internal-heat]).
I make two observations based on this figure.

![
  A watery planet's atmosphere is significantly inflated with relatively low levels of internal heat.
  Here I show the mass--radius relations for different levels of core heating $ɛ$.
  Unlike the case of a bare planet, we do not see a sharp transition in radius associated with the liquid--vapour transition.
](internal-heat){#fig:internal-heat}

The first thing I observe from [@fig:internal-heat] is that even an Earth-like level of internal heating ($\varepsilon = 1\,$pW$\cdot$kg$^{-1}$; that is, $10^{-12}\,$W$\cdot$kg$^{-1}$) is enough to grow the planet significantly.
Compared to the zero-heating case, a $2\,$M$_\oplus$ planet with $\varepsilon = 1\,$pW$\cdot$kg$^{-1}$ is $0.2$--$0.3\,$R$_\oplus$ larger.
This is because the energy generated internally is trapped in the lower levels of the atmosphere, leading to a large temperature change and therefore inflating the planet's radius.

The second point is that the dynamic range of $\varepsilon$ required to significantly change the planet's radius is quite large.
The contours shown in [@fig:internal-heat] span several orders of magnitude in energy output, but the change in radius is more modest.
This is a consequence of the fact that $T_\mathrm{eff} \propto \varepsilon^{1/4}$ (@eq:effective-temperature) and so the effective temperature change is much less.^[For example, an hundred-fold increase in the internal energy generation rate $\varepsilon$ corresponds to an effective temperature change of $100^{1/4} = 3.2\times$.]

##### External heating

External irradiation can have a significant effect on the radius.
@Fig:irradiation shows the extent of this inflation.
For example, above I described a $2\,$M$_\oplus$ planet with $\varepsilon = 1\,$pW$\cdot$kg$^{-1}$.
If we also increase this planet's irradiation temperature from $300$ to $1000\,$K, its radius increases by another $0.2$--$0.3\,$R$_\oplus$.
This is in addition to the increase in radius already included in the model when compared to a planet with no internal energy generation.

![
  Externally irradiated planets are also inflated above the bare planet case.
  Here I show the inflation due to external heating on top of an Earth-like rate of core energy generation.
](irradiation){#fig:irradiation}

##### Pressure at the radiative--convective boundary

I compared the mass--radius relation for models with different value of the atmosphere--envelope transition pressure $P_\mathrm{env}$.
I did this to assess whether my choice of a fixed $P_\mathrm{env}$ could bias my models.
I find that fixing the pressure at the radiative--convective boundary should not have significantly affected the final radius, because varying it produces very little change in the radius ([@fig:transition-pressure]).

![
  The pressure chosen for the radiative--convective boundary only marginally affects the final radius.
  Here I show the effect of changing the atmosphere--envelope transition pressure $P_\mathrm{env}$.
  Although a higher $P_\mathrm{env}$ gives a larger planet because more of the planet's mass is in the atmosphere, the effect is minimal.
](transition-pressure){#fig:transition-pressure}

##### Water fraction

I compared the mass--radius curves for planets with varying water fractions ([@fig:core-fraction]).
Here I find a strong link between the planet's water fraction and its radius.
For example, a $1\,$M$_\oplus$ planet with an Earth-like irradiation temperature and internal heating is twice the size if $50$% of its mass is instead taken to consist of a water envelope and atmosphere.
This is larger than the difference seen in @sec:effect-of-water-content because I now treat the atmospheric layer correctly, rather than ignoring it as in @sec:watery-planet-interiors.

![
  When an atmospheric layer is included, the water fraction becomes much more important in predicting the planet's final radius.
  Here I show mass--radius curves for planets with increasing water fractions.
  The extended steam atmosphere is larger for a planet with a higher water fraction.
](core-fraction){#fig:core-fraction}

### Comparing internal and external heating

Consider two planets of the same mass and composition.
One of them is heated internally and one is heated externally, but the degree of heating is the same.
How does the radius compare between the two cases?
To address this question, I have two different methods intended to evaluate the relative effectiveness of internal and external heating.
Both begin by modelling a planet that is heated by internal sources only.

##### Internally-heated only

I begin by creating a planetary model with no irradiation; that is, I set $T_\mathrm{irr} = 0$.
I fix the energy generation rate per unit mass in the nucleus $\varepsilon$.
Then I evaluate the radius of this planet as described in @sec:heated-planets.
This planet is only heated from within.
We now require a way to compare this heating with heating that comes from an external source.

##### Irradiated only: method A

I take an internally-heated planet as above and calculate its effective temperature (@eq:effective-temperature).
In general this value is quite low.^[For example, the effective temperature of the Earth calculated this way is about $35\,$K.]
If we then equate this temperature to the effective temperature produced by an irradiative source, we can set $T_\mathrm{irr} = T_\mathrm{eff}$.
I then create a second planetary model with no internal heating and this irradiation temperature; that is, I set $T_\mathrm{int}=0$ and $T_\mathrm{irr}$ as just described.
Finally, I calculate the radius of this irradiated model and compare it to the radius of the internally-heated model.

This method invariably produces planets that are smaller than the equivalent internally-heated model.
This is because, with no internal heating and with an irradiation temperature much less than $300\,$K, the irradiated planets have virtually negligible atmospheres.
@Fig:internal-external-heat shows the mass--radius relation for these planets (dotted line); changing the internal energy generation rate used in the internally-heated model over four orders of magnitude produced no discernible increase in the radii of equivalently-irradiated planets.^[In the example above, increasing the effective temperature of the Earth from $35\,$K to $350\,$K needs a thousand-fold increase in Earth's energy generation rate $\varepsilon$.]

This indicates that perhaps the effective temperature is not a good choice for the characteristic temperature of such a planet.
In reality, any internal energy input is trapped at the base of the opaque atmosphere, so the temperature through the atmosphere is much higher than $T_\mathrm{eff}$.
I therefore also trialled a second method for assessing the relative inflation of an irradiated planet.

##### Irradiated only: method B

I again take an internally-heated planet as above.
But instead of calculating its effective temperature, I take the temperature at the radiative--convective boundary $T(P=100\,\mathrm{bar})$ as being a representative temperature for the interior.
This differs from method A because this temperature is hotter than the planet's black body effective temperature, owing to the insulating effect of the thick, opaque atmosphere.
As above, I then create a second planetary model, setting $T_\mathrm{int}=0$ as before but then setting $T_\mathrm{irr} = T(P=100\,\mathrm{bar})$.

This method produces planets that are larger than the equivalent internally-heated planets.
[@Fig:internal-external-heat] shows this for some different heating scenarios (dashed lines).
For example, if we take a $4\,$M$_\oplus$ planet with $30$% water by mass and an Earth-like level of internal energy generation, its radius is approximately $2$R$_\oplus$.
If we then instead treat the temperature at the radiative--convective boundary as being provided by an irradiation flux at the top of the atmosphere, we find that the planet is $0.7\,$R$_\oplus$ larger.

\newthought{These two methods} produce very different results. The first method is a more direct comparison, because it effectively compares energy fluxes.
But I argue that the second method better accounts for the fact that energy is trapped in the lower layers of the atmosphere when it comes from the interior.
From [@fig:internal-external-heat], all other things being equal, it therefore appears that a watery super-Earth is more easily inflated by external heating than by equivalent internal heating.

![
  A planet's radius increases more when it is externally heated than when it is internally heated to an equivalent temperature.
  Here I show the results of the procedure described in @sec:comparing-internal-and-external-heating.
  I compare mass--radius diagrams from three sources: first, planets with varying degrees of internal heating (solid); second, planets where the planet's effective temperature is instead treated as its irradiation temperature (dotted); third, planets where the atmosphere--envelope temperature arising from internal heating is instead treated as the irradiation temperature (dashed).
](internal-vs-external){#fig:internal-external-heat}

### Atmospheric profiles

I examined the temperature profiles of heated watery planets to see how their temperature structures change with heating.

[@Fig:internal-heat-profiles;@fig:irradiation-profiles] show the atmospheric pressure--temperature profiles for $5\,$M$_\oplus$ planets with varying degrees of internal heating and irradiation.
The top panel in each figure shows the profile when the opacity $\kappa_\mathrm{th}$ is allowed to vary through the atmosphere.
The bottom panel shows two fixed-$\kappa$ cases.
The dashed lines are isothermal profiles ($\kappa_\mathrm{th}=0$), which remain at the photospheric temperature throughout; the solid lines are for $\kappa_\mathrm{th} = 100\,$m$^2\cdot$kg$^{-1}$.

![
  Internally heated planets have temperature profiles that consist of a rising temperature in the outer layers, an isothermal region in the middle, and a heated region at the base of the atmosphere approaching the radiative--convective boundary.
  Here I display different temperature--pressure profiles for the atmospheres of $5\,$M$_⊕$ planets with increasing core energy generation rates (and therefore internal temperatures $T_\mathrm{int}$).
  The top panel shows the case where the opacity $\kappa_\mathrm{th}$ is allowed to vary throughout the atmosphere; the bottom panel shows two fixed-$\kappa$ cases.
  When $\kappa_\mathrm{th} = 0$, the atmosphere is isothermal.
  As I increase the core energy generation rate, the temperature at the base of the atmosphere increases---but this does not correspond to a change in the outer atmosphere.
](internal-heat-profiles){#fig:internal-heat-profiles}

![
  In contrast to [@fig:internal-heat-profiles], increasing a planet's irradiation temperature increases the bulk temperature of the atmosphere due to the greenhouse effect of the steam atmosphere.
  The photospheric pressure also increases with increasing temperature.
  The temperature of the isothermal region in the middle atmosphere is approximately twice as high as the irradiation temperature.
  These models also use a non-zero core luminosity, which manifests itself as the departure from an isotherm near the base of the atmosphere, but this does not affect the temperature of the bulk of the atmosphere.
](irradiation-profiles){#fig:irradiation-profiles}

We see from these figures that the two modes of heating produce atmospheres with very different structures.
When heated internally, the temperature at the radiative--convective boundary increases but the bulk of the atmosphere remains at the same temperature ([@fig:internal-heat-profiles]).
This is because all the energy is deposited at the base of the atmosphere where the pressure, optical depth and opacity are all high.
On the other hand, externally heating the models results in a profile where the bulk of the atmosphere's temperature is increased.
It also increases the photospheric pressure, because this boundary condition depends on the temperature profile at the photosphere.

We also see that, if we assume constant opacity, we may produce profiles that are markedly different from the variable-opacity case.
For example, if we assume $\kappa_\mathrm{th} = 100\,$m$^2\cdot$kg$^{-1}$ as in @sec:parameter-explorations, we produce models where the upper atmosphere heats faster than in the variable-opacity case.
And for internally-heated planets, we can obtain significantly differently temperatures at the radiative--convective boundary.
Because these temperatures set the upper boundary condition for the interior part of my model, the interior may also be at a different temperature if we assume a fixed opacity.

### Comparison to a fixed-height atmosphere

Finally, I compared the results from the two-stream analytic atmosphere to an isothermal fixed-height atmosphere.
The fixed-height atmosphere (@sec:isothermal-fixed-height-atmosphere) comes from assuming that the atmosphere is isothermal and hence exponential in pressure with depth.
My two-stream atmosphere becomes exponential for constant $g$ and constant $T$ at $τ ≪ 1$.^[@Guillot2010]
Therefore, if we force the two-stream atmosphere to be isothermal by setting $κ_\mathrm{th} = 0$ (and therefore $dT/dm = 0$, by @eq:temperature-gradient-generic), we should approach the limit of the fixed-height atmosphere.

When I set $κ_\mathrm{th} = 0$ in this fashion, my models reproduce the extent of the fixed-height atmosphere for planets $\gtrsim 3\,$M$_\oplus$ ([@fig:atmospheric-thickness]).
However, they diverge at the low-mass end.
This is likely because the assumptions of constant gravity and temperature no longer hold; the boundary conditions and the atmospheric structure both depend on these assumptions.

![
  When we set the opacity $κ_\mathrm{th}$ to zero, forcing the atmosphere to become isothermal, this gives an atmosphere that is around the same thickness as an \textcolor{Crimson}{isothermal fixed-height atmosphere}.
  The only discrepancy is for low masses, where these models become very large.
  This is likely because the assumption of constant gravity in the atmosphere no longer holds and so the boundary conditions no longer correspond with the assumptions used to produce a fixed-height atmosphere.
  For comparison, I also show the radius of the \textcolor{CornflowerBlue}{"bare" planet} (the portion of the planet interior to the radiative--convective boundary at $P=100\,$bar).
](atmospheric-thickness){#fig:atmospheric-thickness}


## Summary and discussion

I have examined the mass--radius relation for watery planets consisting of three distinct layers: an isothermal iron/silicate core, an adiabatic watery envelope and a radiative atmosphere.
I employed a two-stream analytic atmospheric profile from @Guillot2010 to simplify the atmospheric structure and avoid a full radiative calculation, reducing the number of key parameters to two: the irradiation temperature and the internal temperature.
I used my improved temperature-dependent equation of state to fully capture the thermal behaviour of water in the convective region, as well as temperature-dependent prescriptions for opacity.
I then linked the internal heating of the planet to the temperature at the base of the atmosphere to test whether these planets could be significant inflated by internal sources of heating.

I found that:

- With internal energy generation per unit mass equal to that of the Earth, a waterworld can grow sizeably compared to the case with no internal energy generation.

- For equivalent amounts of heating, irradiation is a more influential parameter for determining the change in planetary radius.
Although internal heating still changes the temperature--pressure profile at the base of the atmosphere, irradiation increases the temperature throughout more of the atmosphere and therefore grows the planet more.

I also found the following:

- The use of an isothermal fixed-height approach to estimate the extent of a heated steam atmosphere gives results that are too small.
This is because the opacity of water results in heat being trapped in the atmosphere, meaning that the assumptions of constant temperature and gravity that underlie the fixed-height approach are no longer applicable.

- The thermal opacity $\kappa_\mathrm{th}$ is a key driver of trends in the mass--radius relation.
Because my water opacity model consists of a simple power-law fitted to few data points, I cannot necessarily claim that my models necessarily represent the full opacity-dependent behaviour of water.
But they do indicate that there is a significant relation to the planet's temperature that should be ignored.

- The assumption of constant atmospheric opacity, which has been made in some previous studies, is likely to produce incorrect radii for water-rich planets.
Opacity can drastically increase towards the base of the atmosphere as the optical depth and pressure become higher.

As expected, the presence of an irradiated atmosphere introduces an additional complication over the bare planet model of the previous chapter.
In particular, I observe a strong dependence on the water fraction of the planet.
This is a fundamental degeneracy with interior structure models that cannot be avoided.
However, this means that we can, with some reasonable assumptions on the structural composition of Earth-like planets, at least assess which layered structures are compatible with a given mass and radius.
See @sec:a-water-rich-super-earth for an example of this application.

### Limitations of the atmospheric model

The two-stream analytic atmosphere that I used has several limitations and assumptions.^[@Guillot2010] The two-stream approximation is valid in the limit where the incoming radiation is mostly in the visible and the outgoing radiation is mostly in the infrared, and these two wavebands are well-separated.
This is because of the simplifying assumption that the thermal emission from the atmosphere at visible wavelengths contributes negligible flux.
This may not be the case for heavily irradiated or strongly heated planets because a hotter atmosphere will emit more light in the visible.
But even in the extreme cases shown in [@fig:internal-heat-profiles], the bulk of the atmosphere is not much hotter than $1000$--$2000\,$K. \marginnote{
  The peak wavelength for a black body of temperature $1500\,$ is $2\,\mu$m.
} And it is apparent from [@fig:internal-heat-profiles;@fig:irradiation-profiles] that the region in which incident radiation is absorbed, near the top of the atmosphere, is characterised by a much lower temperature than the typical temperature of a Sun-like star.
For this reason, the two radiation fields used to calculate the two-stream grey atmosphere are mostly decoupled.
Some caution might be warranted if we were to use these models for planets around cooler stars, however.

@Guillot2010 notes that the two-stream model\marginnote{
  He also notes in that paper that a useful value for the convective--radiative boundary pressure is $10\,$bar; compare to our choice of $100\,$bar and see \cref{fig:transition-pressure}.
} diverges from numerical calculations away from temperatures significantly lower or higher than $1000\,$K due to changes in the mean opacities.
This highlights the important of the mean opacity in these calculations.
The model also assumes that the irradiation is distributed isotropically over the surface; a tidally locked planet could have very different atmospheric dynamics and would be better served by a three-dimensional atmospheric model.^[These tidally locked planets are sometimes called "eyeball planets" because they could have very different climates and surfaces on opposite sides with a transition ring around the edge, possibly giving the planet the appearance of a large eyeball.]

### How are these models useful?

A simple model for irradiated planets could be useful in population synthesis models of planetary populations, or in Bayesian analysis of large numbers of planets.
Such approaches benefit from being able to quickly evaluate the radius of a planet, as they involve assessing many models at once.
Until we have detailed spectral measurements of a planet's atmosphere, a full temperature model of the atmosphere may be unnecessarily complicated.
These two-stream models both account for temperature structure and include parameters necessary to incorporate at least the planet's irradiation temperature.
With knowledge of the host star and the planet's orbit, this is an easily calculable value.
These models could therefore be useful in studies of entire planetary populations to address questions such as if there are dividing lines beyond which planets are mostly gaseous.^[@Rogers2015]

The remainder of this dissertation deals with applications of these models.
In the next chapter, I examine the phase structures of these heated planets and assess whether migration could significantly change their size.
And I wrap up with an application of my model code to a super-Earth with a possible watery layer.
