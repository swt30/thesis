# Heating and the atmosphere

In the previous chapter, I presented the initial results for the interior structures of heated planets and showed that the interior radius can change significantly with heating.
But upon reading that chapter it should quickly have become apparent that these models are limited.
What about the atmosphere?
Isn't it inappropriate to leave the surface pressure as a free parameter?
How do we make the link to a planet's observable radius?
And instead of setting the surface temperature explicitly, shouldn't we be linking this to the planet's host star and its environment?

This chapter addresses these questions.
Here I present an extension to my models that takes into account the planet's atmosphere.
I incorporate a simple two-stream radiative transfer model to give an atmospheric temperature profile.
Then I compare the effects of heating via two different modes, internal and external, to assess whether watery planets are preferentially inflated by one mode of heating.

## Heated planets

A planet may be heated in several ways, both internal and external.

The Earth's net surface energy flux, which comes from internal sources, is about $40\,$TW.^[@Davies1980]
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
The so-called "chondritic coincidence"^[@Suess1956; @Urey1956] refers to the fact this energy generation rate per unit mass is about the same as observed in chondrites.

Cooling and contraction supply the remainder of a planet's internal energy budget.
In the Earth, the other half of the internal energy is supplied by cooling.

At the same time, a planet is heated externally by its host star.
One measure of this heating is the *equilibrium temperature*.
The equilibrium temperature for a planet is calculated by assuming that the planet is in thermal equilibrium and that incident and outgoing radiation are balanced.
If the planet emits as a blackbody, the equilibrium temperature $T_\mathrm{eq}$ is
$$ T_\mathrm{eq} = T_⊙ \left( 1-a \right)^{1/4} \sqrt{R_⊙ \over 2D} $$ {#eq:planet-equilibrium-temperature}
where $T_⊙$ is the stellar temperature, $a$ is the planet's albedo, $R_⊙$ is the stellar radius and $D$ is the star--planet distance.^[@Burrows2010; I have assumed a blackbody with perfect emissivity $(ϵ=1)$ emitting across half the surface of the planet.]

In the previous chapter we saw that the temperature of the planet affects its radius.
The planet's temperature is controlled by both internal and external energy sources, but they may have different effects on the radius.
We must therefore ask: which mode of heating is dominant?
We know that for the Earth, the balance is in favour of irradiation: internal heating only contributes a small amount to the energy balance of the planet.^[$40\,$TW of energy is produced internally but more than $150\,000\,$TW is supplied by irradiation [@Wengenmayr2012].]
But this is not necessarily the case for all planets.
For example, half of Jupiter's energy budget comes from internal heating.
Planets with thick opaque atmospheres might trap internal energy more effectively, exaggerating the heating effects of internal sources.
And water-rich icy moons could also be heated by tidal interactions while receiving very little irradiation.
It is therefore useful to understand whether *internal* heat can significantly contribute to the observed radius of a planet.

### The planet's atmosphere

We saw earlier that heating a planet can moderately inflate its interior.
The same will be true for its atmosphere, but to what extent?
There is another complication that comes with using my models in the previous chapter: they did not treat the planet's atmosphere.
If we wish to link these results to real observations, we must include a prescription for the extent of the atmosphere.

To answer this question completely, we need atmospheric models.
An ideal atmospheric model would include line-by-line opacities, clouds and chemical networks, and it would then be combined with an interior model like the one in the previous chapter.
But though a full atmospheric treatment is desirable, it is also difficult: it introduces many free parameters, it is computationally expensive, and ultimately it is beyond the scope of this dissertation.
I therefore conducted an initial exploration of this problem with an analytic atmospheric temperature model instead and investigated the effect on the observed radius.


### A better treatment of surface pressure

A key requirement for building a coupled interior--atmosphere model is the knowledge of realistic boundary conditions.
The previous chapter used an arbitrary pressure for the surface of the models, but in reality the pressure is set by the depth beyond which atmospheric measurements can no longer probe.
And in principle this pressure could be observationally constrained through spectroscopic observations of the planetary atmosphere, though such observations are currently difficult for super-Earths.

Before we continue, some definitions are in order.
Normally we would understand the *surface* of a terrestrial planet as being defined by a sharp transition from a thin atmospheric layer to a rocky centre.
But for volatile-rich planets like these waterworlds, such a definition is no longer useful.
In this chapter I therefore use the following nomenclature:

- The **photospheric surface** of a water-rich planet is defined by the depth to which light can no longer penetrate, which for this work I take to be a chord optical depth of $\tau = 1$ ([@sec:boundary-conditions]).
- The **atmosphere** of the planet is the outer portion of the model, which follows a radiative temperature profile.
- The **radiative--convective boundary** is the transition between the radiative and convective regimes. It defines the base of the atmosphere.
- The **envelope** of my waterworld models refers to the water layer at depths greater than that of the radiative--convective boundary. It follows an adiabatic (convective) temperature profile.
- The **mantle** and **core** refer respectively to the silicate and iron layers of the Earth-like nucleus.
- The **interior** of the planet includes the watery envelope, the mantle, and the core.

\begin{marginfigure}
  \includegraphics{full-structure-sketch}
  \caption{Sketch of my final planetary models for this chapter, showing the layered structure. The planetary radius R$_p$ is taken as the radius to the photospheric surface, which is also where the external boundary conditions are defined.}
  \label{fig:full-structure-sketch}
\end{marginfigure}

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

## Updates to the models

To achieve the goal of incorporating atmospheric and heating information into the models, I did several things.
I extended the equation of state to lower pressures.
I added an atmospheric layer to the models.
And I treated the temperature gradient within this layer, which necessitated adding information on the optical depth and therefore the opacity of water vapour.
Finally, I added realistic boundary conditions to the models that have a link to the physical properties of the planet, its temperature and its transit radius.

My final model ([@fig:full-structure-sketch]) comprises the interior structure from @sec:watery-planet-interiors (an iron core, a silicate mantle, and a water envelope) plus a water atmosphere.
Here I outline the full structural treatment, the atmospheric model and my updated prescription for the boundary conditions.

### Structural equations

In the previous chapter I modelled planets using three structural equations: [@eq:mass-continuity; @eq:pressure-gravity; @eq:adiabatic-temperature-gradient].
In this chapter I left the first two of these equations unmodified.
They are reproduced here as [@eq:mass-continuity-repeat; @eq:pressure-gravity-repeat] for completeness.

The mass continuity equation,
$$ {dr \over dm} = {1 \over 4πr^2ρ}, $$ {#eq:mass-continuity-repeat}
links $r$, the radius to a spherical shell, to the mass $m$ interior to the shell and the density $ρ$ of the shell.

The equation of hydrostatic equilibrium,
$$ {dP \over dm} = -{Gm \over 4πr^4}, $$ {#eq:pressure-gravity-repeat}
where $P$ is the pressure at the shell and $G$ is the gravitational constant, ensures a balance of pressure and gravity.

I then modified @eq:adiabatic-temperature-gradient to a more generic form (@eq:temperature-gradient-generic), allowing for different temperature structures.

The temperature gradient,
$$ {dT \over dm} = ∇, $$ {#eq:temperature-gradient-generic}
where ∇ varies depending on the mode of energy transport (see @sec:the-temperature-gradient), describes how the temperature varies inside the planet.

Finally, I added @eq:optical-depth-gradient to track the optical depth within the atmosphere.
Together, [@eq:mass-continuity-repeat; @eq:pressure-gravity-repeat; @eq:temperature-gradient-generic; @eq:optical-depth-gradient] form a system of ordinary differential equations that I solve in the same manner as before.

The optical depth relation,
$$ {dτ \over dm} = -{κ \over 4πr^2}, $$ {#eq:optical-depth-gradient}
links the optical depth $τ$ to the opacity $κ$.

### The optical depth and opacity

I added the optical depth--radius\marginnote{
  The definition of the optical depth is
  \begin{equation}
    dτ = -κρdr
    \label{eq:optical-depth}
  \end{equation}
  where τ is the dimensionless optical depth, $κ$ is the opacity (units of m$^2⋅$kg$^{-1}$), $ρ$ is the density and $r$ is the radius.
  Combining this with \cref{eq:mass-continuity-repeat} gives \cref{eq:optical-depth-gradient}.
} relation (@eq:optical-depth-gradient) to the structure equations.
Within the envelope, I ignore any further increase of the optical depth because it is unimportant for calculating the convective temperature profile.
In practice this is achieved by setting ${dτ \over dm} = 0$ within the envelope.

In order to evaluate @eq:optical-depth, we need the opacity of the gas, $κ$.
The optical depth gradient depends directly on the density of the gas, which as we have seen is related to its temperature and pressure through the equation of state.
It also depends indirectly on the gas's temperature and pressure through the opacity $κ(P,T)$, which is another state function of the gas.
I took the thermal opacity, $κ_\mathrm{th}$, as the representative opacity for the atmosphere.^[@Rogers2010]

The meaning of "opacity" can vary from author to author.
Here, for consistency with the work of @Rogers2010 and @Kurosaki2014, whose work I build on later in this chapter, I denote the opacity $\kappa_\mathrm{th}$ to be the quantity with units of m$^2\cdot$kg$^{-1}$.^[It is sometimes called the mass attenuation coefficient, but is distinct from the attenuation coefficent whose units are m$^{-1}$.]
The opacity $\kappa$ is related to the absorption cross-section of the material by the formula $n\sigma = \kappa\rho$ where $n$ is the number density of absorbers, $\sigma$ is the absorption cross-section per absorber and $\rho$ is the density of the material.

The optical depth relation can take either a constant opacity $κ$ or allow the opacity to vary throughout the atmosphere.
Some previous studies have used a constant $κ_\mathrm{th}$: for example, the optical depth--temperature curves presented in @Guillot2010 are for a constant opacity.
In this study I instead allowed $κ$ to change throughout the atmosphere, but I also examined the effects of using a constant $κ$  ([@sec:opacity-and-opacity-ratio]).
This choice is likely to be significant because the pressure varies over several orders of magnitude within the atmosphere; the opacity should then also vary.

### The atmosphere--envelope transition

I chose the boundary between the irradiated atmospheric layer and the adiabatic interior to be at a fixed pressure of $100\,$bar ($10^7\,$Pa).
For pressures below $100\,$bar, I use the two-stream irradiated atmospheric temperature profile.
Once $P > 100\,$bar I switch to the adiabatic profile.

The boundary between the irradiated atmosphere and the adiabatic interior should normally be defined by the Schwarzschild criterion for convective instability.^[A material for which $$ \left|{d \ln T \over d \ln P}\right|_\mathrm{ad} < \left| {d \ln T \over d \ln P} \right|_\mathrm{rad} $$ is unstable against convection. That is, the convective--radiative boundary occurs at the point where the radiative temperature gradient becomes larger than the adiabatic temperature gradient.]
This criterion depends on the thermal behaviour of water and requires assessing whether the radiative or adiabatic temperature gradient is steeper.
In [@sec:pressure-at-base] I assess several constant values for this transition pressure and show that the choice has a negligible effect on the final radius.
I therefore chose a representative constant pressure of $100\,$bar as a first approximation for this transition, rather than evaluating the Schwarzschild criterion explicitly.
This transition pressure is close to the value of approximately $50\,$bar from @Kurosaki2014.

### The temperature gradient

I use three different prescriptions for the temperature gradient $∇$ in @eq:temperature-gradient-generic, depending on the mode of energy transport.

Within the core, where temperature effects are negligible, I set $∇ = 0$ to make the core isothermal.
The edge of the core is specified as a fraction of the planet mass and fixed as a model parameter.
When solving the structural equations, I therefore switch to this isothermal treatment once $m < f M_p$, where $m$ is the mass co-ordinate, $f$ is the core fraction and $M_p$ is the total mass of the planet.

For convective transport within the watery envelope, I use the adiabatic temperature gradient from @eq:adiabatic-temperature-gradient as explained in the previous chapter.

Finally, for the atmosphere, I compared two different treatments.
The first is an isothermal atmosphere, which I construct by calculating the scale height $H$; the second is a two-stream analytic temperature profile.
For the two-stream atmosphere treatment, I evaluate the temperature gradient $∇$ explicitly:
$$ ∇ = {dT \over dm} = {dT \over dτ} {dτ \over dm} $$ {#eq:two-stream-wrt-m}
where the temperature profile with respect to $τ$, $dT \over dτ$, is the derivative of @eq:two-stream-temperature-profile^[@Guillot2010] and the optical depth--opacity relation, $dτ \over dm$, is @eq:optical-depth-gradient.
But for the isothermal scale-height atmosphere I instead construct the interior as if it were bare, setting the external pressure boundary condition to $100\,$bar.
I then calculate the scale height $H$ and add an eight-scale-height thick ($8\,H$) isothermal atmospheric layer on top of the interior model.^[Typical atmospheres are 5--10 scale heights thick [@Madhusudhan2015].]

### The ideal gas equation of state

For this study, I also added the ideal-gas behaviour of water to the equation of state.
The domain of my EOS now extends from 1$\,$Pa up to $10^{14}\,$Pa.
Previously I had extrapolated upon leaving the edge of the EOS domain; this was not a problem because I started our models at high pressure, but in order to represent the atmosphere appropriately I needed to extend the EOS to low pressures.

All other EOS behaviour is as described in @sec:an-improved-water-equation-of-state.
In particular, I maintained the same data sources and grid resolution for the base EOS.
Only in the region where $P < 100\,$bar does the EOS differ from that chapter.

### Boundary conditions

For the internal boundary condition, I again take $R_{M=0} = 0$ so that the mass enclosed is zero at the physical centre of the planet.
In practice we specify this by requiring both that $0 <= R_{M=0} < 1000\,$m and that $ΔR_P < 1000\,$m where $ΔR_P$ is the change in the total planetary radius $R_P$ between iterations of the root-finding technique.
The final radius therefore is therefore precise to within 1$\,$km.

For the transitions between layers, I enforce continuity of all internal variables: pressure, temperature and mass enclosed.
I do not continue to track the optical depth within the envelope and so do not enforce its continuity at the atmosphere--envelope boundary.

For the external boundary condition I make several assumptions.^[Here I follow the derivation of @Rogers2010.]
I take $R = R_P$ at $M = M_P$, where $R_P$ and $M_P$ are the total mass and radius of the planet.
I assume that the outer atmosphere is isothermal and that the gravity is constant in this region.
This, in combination with the power-law opacity, yields an atmosphere whose pressure and optical depth are both exponentially dependent on the radius.

I assume that the atmosphere in the neighbourhood of the photosphere can be assumed to be an ideal gas; this assumption is also included in the equation of state. The pressure of the water vapour is then
$$ P = ρ k_\mathrm{B} T \over \mu_\mathrm{eff} $$ {#eq:ideal-gas-pressure}
where $μ_\mathrm{eff}$ is the effective molar mass of the gas.
I assume a constant gravity in the region of interest.
I take a power-law opacity of the form $κ = C P^α T^β$.

Then taking the equation of hydrostatic equilibrium $dP/dr = -ρg$ and the radial optical depth $dτ/dr = -κρ$ gives expressions for $P$ and $τ$ that are exponential in the radius $r$:
$$ P(r) = P_\mathrm{R} e^{-(r - R_\mathrm{p})/H_\mathrm{p}} $$ {#eq:pressure-exponential-atmosphere}
and
$$ τ(r) = τ_\mathrm{R} e^{-(α + 1)(r - R_\mathrm{p})/H_\mathrm{p}} $$ {#eq:optical-depth-exponential-atmosphere}
where the pressure scale height is
$$ H_\mathrm{p} = {R^2_\mathrm{p} k_\mathrm{B} T \over G M_\mathrm{p} μ_\mathrm{eff} }. $$ {#eq:pressure-scale-height}
Then the pressure at the planet's radius is
$$ P_R = \left( { G M_\mathrm{p} \left( α+1 \right) τ_R \over R_P^2 C T^β }\right). $$ {#eq:pressure-at-photosphere}
Finally I take the transit radius of the planet as being at a transverse (chord) optical depth $\tau_\mathrm{t} = 1$.
The relationship between the transit and radial optical depths^[I do not include this derivation here but it is from @Hansen2008 and was used by @Rogers2010. [@Fig:transverse-radial-optical-depth-relation] shows the difference between the two optical depths.] is
$$ τ_\mathrm{t} \approx γ τ_\mathrm{R} \sqrt{2π(α + 1)y \over H_\mathrm{P}} e^{-(α + 1)(y - R_\mathrm{p})/H_\mathrm{p}}. $$ {#eq:transverse-optical-depth}
Setting $τ_\mathrm{t} = 1$ gives
$$ τ_R = {1 \over γ} \sqrt{H_P \over 2π \left( α+1 \right) R_P. } $$ {#eq:optical-depth-at-photosphere}

![
  When an observer looks through the limb of a planet's atmosphere, the optical depth they see at the planet's radius $R_\mathrm{p}$ is a *transverse* depth $\tau_\mathrm{t}$.
  In general, this is not the same as the radial optical depth $\tau_\mathrm{rad}$.
  This schematic diagram shows how the transverse optical depth $\tau_\mathrm{t}$ through the atmosphere is different from the radial optical depth $\tau_\mathrm{rad}$ down into the atmosphere.
  Because the atmospheric temperature profile uses a radial optical depth, we need to correct for this discrepancy.
  The relation between the two is @eq:transverse-optical-depth.
](radial-optical-depth_big_fig){#fig:transverse-radial-optical-depth-relation}

My code solves simultaneously for $T$ and $τ$ at the transit optical depth of the planet, taking $T$ from @eq:two-stream-temperature-profile, to set the boundary conditions at the outer boundary.
It then use @eq:optical-depth-at-photosphere to set the external pressure boundary condition.
This condition is re-evaluated after each trial solution.
In this fashion it converges on the correct values of $P_R$, $T_R$ and $τ_R$ as the radius of the planet converges.

I set $τ=1$ as the optical depth defining the photosphere of the planet.
At optical depths $τ<1$ I ignore the atmosphere as it is effecively transparent.
My models therefore begin at a chord optical depth of $τ=1$.
This corresponds to a radial optical depth of $τ$ of less than 1; the exact value depends on the opacity of the atmosphere.

The integration is performed on a logarithmically-spaced mass grid.
Previously I had used a fixed grid, linearly spaced with several hundred points in the mass co-ordinate.
However, when I added the atmospheric layer during the course of this study, it became apparent that the fixed mass step was failing to capture the extent of the atmosphere correctly.
In the very outer layers of the atmosphere where the density is very low, a fixed step in mass corresponds to a very large step in radius.
But in order to capture the pressure and optical depth change within the atmosphere, we require several points per scale height.
Given that the atmosphere is close to exponential in pressure and optical depth within the outer layers, I switched to a logarithmically spaced mass grid instead.
The smallest mass step was approximately $ΔM = 10^{-10} M_p$, which is sufficient to avoid any numerical error in the outer atmosphere. From there I allow the mass step to increase in a logarithmic fashion, scaling the size of the steps so that half the points lie in the atmosphere and half lie in the envelope/core.

How large should the smallest mass step be?
Approximating the atmosphere by a plane-parallel scale-height atmosphere (@eq:pressure-scale-height), a $1\,$R$_\oplus$ and $1\,$M$_\oplus$ planet at $T=500\,$K has a scale height of $H = {RT \over g_\oplus} \approx 20\,$km.
To resolve the atmosphere accurately we would like on the order of 10 steps per scale height.
From @eq:mass-continuity-repeat, setting $dr = 2\,$km, $\rho = 1\,$kg$\cdot$m$^{-3}$ and $r = R_\oplus$, we get ${dm \over M_\oplus} \approx 10^{-7}\,$M$_\oplus$.
A mass step of $10^{-10}\,$M$_\mathrm{p}$ is therefore more than adequate to resolve the atmospheric structure.

In all other respects, the solver works as described in @sec:watery-planet-interiors.

### Internal heating

Because my code does not specifically solve any equations of internal energy transport, I needed a way to convert from internal heating amounts to a single temperature for these atmospheric models.

I do this by assuming that the core and envelope of the planet radiate as a black body.
I set the energy generation rate per unit mass in the core, $ɛ$, which has units of W$\,$kg$^{-1}$.^[The Earth's internal energy generation rate is on the order of $1$-$10\,$pW$\cdot$kg$^{-1}$ if we assume that energy generation occurs only in the mantle [@Davies1980].]
The luminosity of the core is then
$$ L_\mathrm{core} = M_p f ɛ, $$ {#eq:core-luminosity}
where $L_\mathrm{core}$ is the total luminosity of the core in W, $M_p$ is the planet's total mass, $ɛ$ is the luminosity of the core per unit mass, and f is the fraction of the planet's mass found in the core.
I take the energy generated by the core and assume that it is radiated evenly from the planet's surface at a radius of R$_\mathrm{p}$.
I then use the Stefan--Boltzmann black body relation,
$$ T_\mathrm{eff}^4 = {L_\mathrm{core} \over 4πR_p^2 σ_B}, $$ {#eq:effective-temperature}
to determine the effective temperature of the planet based solely on its internal heating.
This effective temperature can be relatively low but thanks to the insulating effect of the atmosphere this results in a stronger heating effect than otherwise would be expected.

This definition assumes that the atmosphere is relatively thin.
This might not be the case for small planets---I highlight where this may be an issue in the results section.
However, it provides a simple link between the internal energy generation and the internal heating of the atmospheric model.

My internal heating treatment also assumes that the energy generated within the planet is sufficient to drive convection through the planet's envelope.
This results in a temperature gradient that increases downward into the planet until we reach the isothermal core.

### External heating

The equilibrium temperature of a planet provides a proxy through we can characterise the radial change due to external heating from the star.
The two-stream atmospheric profile takes the irradiation temperature $T_\mathrm{irr}$ as a parameter.
To set this temperature, I use the equilibrium temperature of the planet due to external radiation.
In this chapter I do not evaluate this from the properties of the star, choosing instead to set the equilibrium temperature directly in my models.
That is, I set $T_\mathrm{irr} = T_\mathrm{eq}$.
This value is different from the skin temperature of the planet, which is usually taken to be lower than the equilibrium temperature by a factor of $2^{1/4}$.

### Comparing internal and external heating

I use two different methods in order to directly compare the relative effects of internal and external heating.
In both, I set the core energy generation rate $ɛ$ with no irradiation.
Then I evaluate the radius of the planet using these boundary conditions as described above.

In the first method, I then evaluate the equilibrium temperature of the planet as if it were unilluminated.
I then equate this with the irradiation temperature in @eq:two-stream-temperature-profile.
That is, I then set $T_\mathrm{irr} = T_\mathrm{eff}$ where $T_\mathrm{eff}$ is defined in @eq:effective-temperature.

In the second method, I instead evaluate the temperature at the surface of the planet $T_\mathrm{P = 100\,bar}$ and set the irradiation temperature to this.
If I then assume that this temperature is instead induced by an external source of energy and that it is the temperature at the planet's radius $R_p$, this is then the photospheric skin temperature of the planet.
I divide by $2^{1/4}$ to give a characteristic equilibrium temperature for the planet's atmosphere, which I equate with the irradiation temperature.
That is, I set $T_\mathrm{irr} = T_\mathrm{P = 100\,bar}/2^{1/4}$.

In both of these cases, I then evaluate the planet's radius, but this time setting the internal heating to zero and allowing its radius to be governed solely by the external heating.

Both these methods can be thought of as answering the question: how does the planet's radius change when the temperature generated at the base of the atmosphere is instead taken to come from a radiative source?
I argue that the second method better accounts for the trapping of energy and subsequent heating of the lower atmosphere that would normally be handled by a radiative transfer code.
The first method, where we imagine that the black-body temperature of a planet is really its irradiation temperature, ignores this greenhouse effect.

## The atmosphere

As well as comparing internal and external heating, I also compared two different atmospheric treatments.

### Two-stream atmosphere

I added a radiative temperature profile by using the analytic two-stream temperature profile of @Guillot2010.
The temperature profile is defined in terms of the optical depth $τ$.
This optical depth is the optical depth with respect to thermal radiation, defined by @eq:optical-depth.

The temperature profile I used is taken from @Guillot2010; it is equation 27 in that paper. The profile is
$$ \begin{split}
    T^4 &= {3 T_\mathrm{int}^4 \over 4} \left[ {2 \over 3} + τ \right] \\
        & \quad + {3 T_\mathrm{irr}^4 \over 4} μ_*
                \left[ {2 \over 3} + {μ_* \over γ} + \left( {γ \over 3 μ_*} - {μ_* \over γ}e^{-γτ/μ_*} \right) \right]
\end{split} $$ {#eq:two-stream-temperature-profile}

In my code, the temperature profile is calculated as the solution of an ODE and evaluated from the outer boundary condition by calculating the derivative ${dT \over dm}$, rather than being calculated directly.
This means that my code is symmetric in the way it calculates the temperature: it starts from a boundary condition and integrates inward.
Although this is more prone to numerical error than evaluating the temperature directly for a given $τ$, it is no more so than any of the structural equations, all of which require solving an ODE in the same way.
Nevertheless, I used automatic differentiation to provide fast exact derivatives of the temperature profile.^[Automatic differentiation is a technique for obtaining exact derivatives of explicitly specified functions without using a finite-difference approach; I used the Julia package ForwardDiff.jl.]

### Scale-height atmosphere

I also compared this approach to a scale-height atmosphere.
To generate this atmosphere, I assumed a constant-gravity atmosphere lying on top of the envelope.
The equation for the pressure scale height of a plane-parallel atmosphere is
$$ H = {k_B T \over μ g}, $$ {#eq:scale-height-generic}
where $H$ is the scale height, $k_B$ is the Boltzmann constant, $T$ is the temperature, $μ$ is the mean mass of a gas molecule and $g$ is the surface gravity of the planet.
This can be written as
$$ H = {R_\mathrm{H_2O} T \over g}, $$ {#eq:scale-height}
where $R_\mathrm{H_2O}$ is the specific gas constant for water ($R_\mathrm{H_2O} = 461\,$J$⋅$K$^{-1}⋅$kg$^{-1}$).
I use an $8H$ atmosphere with $T = T_\mathrm{irr}$ to calculate the thickness of a scale-height atmosphere on top of the bare envelope.

### Two-stream grey atmosphere

My source for the opacity data was @Kurosaki2014.
In their paper, @Kurosaki2014 simulated the evolution of water-rich sub- and super-Earths.
Because there is no empirical formula for the opacity of water vapour, they provided simple power-law expressions based on a power-law fit to HITRAN^[@Rothman2013] data.
I have taken these opacities and used them in the two-stream grey atmosphere.

The opacity I used is
$$ κ_\mathrm{th} = 3.07 × 10^2
    \left({P \over \mathrm{1\,bar}}\right)^{0.9}
    \left({T \over \mathrm{1000\,K}}\right)^{-4.0}
    \mathrm{cm}^2⋅\mathrm{g}^{-1}.
$$ {#eq:opacity}
In SI base units this becomes
$$ κ = C P^α T^β $$ {#eq:opacity-SI}
where $C = 9.71×10^8~$m$^2⋅$kg$^{-1}$, $α = 0.9$, $β = -4.0$, and $P$ and $T$ are in Pa and K respectively.
@Tbl:opacities shows sample values of the thermal opacity $κ_\mathrm{th}$.
It also shows the visual opacity $κ_\mathrm{vis}$ and the ratio of the two, $γ = {κ_\mathrm{vis} \over κ_\mathrm{th}}$.

| P / bar | T / K | $κ_\mathrm{th}$ / m$^2⋅$kg$^{-1}$ | $κ_\mathrm{vis}$ / m$^2⋅$kg$^{-1}$ | $γ$ |
|--------|--------|---------------|-----------|------------------|
| $0.01$ | $300$  | $60.1$        | $0.00356$ | $5.93×10^{-5}$   |
| $0.01$ | $1000$ | $0.487$       | $0.00220$ | $0.00452$        |
| $0.01$ | $2000$ | $0.0304$      | $0.00167$ | $0.0548$         |
| $1$    | $300$  | $3790$        | $0.356$   | $9.39×10^{-5}$   |
| $1$    | $1000$ | $307$         | $0.220$   | $0.00717$        |
| $1$    | $2000$ | $1.92$        | $0.167$   | $0.0869$         |
| $100$  | $300$  | $2.39×10^5$   | $35.6$    | $0.000149$       |
| $100$  | $1000$ | $1940$        | $22.0$    | $0.0114$         |
| $100$  | $2000$ | $121$         | $16.7$    | $0.138$          |

Table: Opacities ($κ$) and opacity ratios ($γ$) calculated from the power-law forms in @Kurosaki2014 across a range of pressures and temperatures relevant to the atmosphere of a heated waterworld. {#tbl:opacities}

I caution that these opacities may be too simple for the following reasons:

-   They appear to include no treatment of collisionally-induced absorption.
-   They are a least-squares fit to mean line opacities only.
-   They are fitted to just three different temperatures, the lowest of which is $1000\,$K, and three different pressures, the lowest of which is $1\,$bar.
At the top of the atmosphere we expect the pressure and temperature to be lower than both of these.

> TODO: waiting on opacity data from Madhu (/Sid?) to compare with any other data available (I've compared with @Rogers2010 below, but that's for a H/He atmosphere)

Nevertheless, they are based on HITRAN, which is currently one of the best available experimental data sets for the absorption of molecular species in astrophysical contexts.
Choosing a power-law opacity also allows us to simplify the expressions for the surface optical depth and pressure to the forms in @sec:boundary-conditions.
We therefore have reasonable physically-motivated boundary conditions for the external boundary, and hence a plausible link between the transit radius of the planet and its internal structure model.

As well as determining $κ$ from the power-law formula above, I also assessed several different values for a fixed $κ$.
@Tbl:opacities shows that the thermal opacity $κ_\mathrm{th}$ varies over several orders of magnitude; I assessed several of these values.

The value of $γ$ is highly uncertain because it is the ratio of two uncertain values, $γ = {κ_\mathrm{vis} \over κ_\mathrm{th}}$.
When I allowed $γ$ to vary freely though the atmosphere of the planet, I obtained planets with unnaturally inflated atmospheres.
I therefore did not allow $γ$ to vary freely throughout the atmosphere, fixing its value at $γ = 0.01$ for most purposes and also assessing how changing this could alter the final radius.
@Rogers2010 tested values of $γ = \left[ 0.1, 1, 10 \right]$ in their models of hydrogen-atmosphere planets; I set $γ = 0.01$ based on the values of $κ$ from @Kurosaki2014 [@tbl:opacities].
Later I show that the choice of this parameter does not strongly affect the final radius.

## Model verification

To validate the planet structures, I first compared the results for "bare" planets---planets without any atmospheric layers, whose outer boundary conditions are fixed at $P=100\,$bar---against my previous results.^[To clarify, all the plots in this dissertation use the corrected mass grid described in @sec:boundary-conditions. But my first paper [@Thomas2016] did not. The conclusions have not changed, but the scale of the radial inflation with heating has decreased from that paper.]
While doing this, I discovered that the results are sensitive to the mass grid used in the integration.
@Fig:grid-error shows how an incorrect grid does not adequately resolve the pressure/temperature change in the outer atmosphere.
The error is minor ($< 0.1\,R_⊕$) for smaller planets ($M_p < M_\oplus$) but can be large ($0.3\,R_⊕$) for planets nearer $10\,M_⊕$.

![
  The mass grid affects the final mass--radius diagrams.
  Here I show models of "bare" planets---planets without an atmosphere, only a watery envelope.
  To do this, I set the outer boundary pressure to $100\,$bar and therefore prevent any of the planet from being treated as atmosphere.
  I use two different treatments for the mass grid: the first, shown dashed, replicates the mass grid choice from my first paper [@Thomas2016]; the second, shown solid, uses a mass grid that resolves low-density regions near a heated surface more appropriately in the heated case.
  I find that the difference can be significant for larger planets.
](grid-error){#fig:grid-error}

### Comparison to scale-height atmosphere

I also compared my results to that of a scale height atmosphere.
The scale height atmosphere assumes an atmosphere that is exponential in pressure with optical depth.
My choice of atmosphere (from @Guillot2010) becomes exponential for constant $g$ and constant $T$ at $τ ≪ 1$.
The scale height atmosphere also assumes that the atmosphere is isothermal.
Therefore, if we force the atmosphere to be isothermal by setting $κ_\mathrm{th} = 0$ (and therefore $dT/dm = 0$), we should approach the limit of the scale-height atmosphere.
My models reproduce the extent of the scale-height atmosphere in this case for higher-mass planets (@fig:atmospheric-thickness).
However, the difference becomes larger at the low-mass end.
This is likely because the assumptions of constant gravity and temperature no longer hold; the boundary conditions and the atmospheric structure both depend on these assumptions.

![
  When we set the opacity $κ$ to zero, forcing the atmosphere to become isothermal, the atmospheric treatment results in an atmosphere that is around the same thickness as a scale-height atmosphere.
  The only discrepancy is for low masses, where these models become very large.
  This is likely because the assumption of constant gravity in the atmosphere no longer holds and so the boundary conditions no longer correspond with the assumptions used to produce a scale-height atmosphere.
  For comparison, I also show the radius of the "bare" planet (the portion of the planet interior to the surface at $P=100\,$bar).
](atmospheric-thickness){#fig:atmospheric-thickness}

## Results

My models show the following:

Planets with watery atmospheres can be significantly inflated when heated ([@fig:internal-heat;@fig:irradiation]).
This is true whether the heating mode is external or internal.
The degree of inflation is higher when compared to models of the interior alone (@sec:comparison-to-scale-height-atmosphere).

When heated internally, the energy generation rate must be increased by several orders of magnitude to significantly affect the radius ([@fig:internal-heat]).
However, the internal energy generation rate required to achieve this degree of inflation of a waterworld is still comparable to that produced by the Earth.

When heated externally, significant radial changes are produced with temperature increases of several hundred Kelvin ([@fig:irradiation]).

This radial dependence is pronounced for smaller planets ([@fig:internal-heat;@fig:irradiation]).
At the low-mass end ($< 1\,$M$_⊕$), heated planets can grow to be larger than higher-mass planets heated to the same extent.

Treating the atmosphere as being of a fixed opacity produces results that are lower than if we allow the opacity to vary freely into the planet ([@fig:opacity]).
However, the opacity ratio $γ$ has little effect on the final radius ([@fig:opacity-ratio]).

A planet's radius increases more when it is externally illuminated to a certain equilibrium temperature than when it is internally heated to the same temperature ([@fig:internal-external-heat]).

If we assume that the two-stream atmosphere accurately captures radial change due to internal and external heating, and accept that the opacity of water is at least on the order of $30\,$m^2$⋅$kg$^{-1}$, then a scale-height atmosphere is a poor choice for modelling these planets.
Only in the case where a planet's atmosphere is isothermal---that is, it has no opacity---does the scale-height atmosphere reproduce the behaviour of this model ([@fig:atmospheric-thickness]).

The water fraction is correlated with total radius ([@fig:core-fraction]); this is in contrast to our previously published results for bare planets,^[@Thomas2016] but these models used a linear mass grid and are likely to have overestimated the size of the outer layers for larger planets.

The atmospheric temperature profiles ([@fig:internal-heat-profiles;@fig:irradiation-profiles]) show that an externally heated planet is inflated because the temperature becomes higher through the entire atmosphere.
In contrast, a planet that is internally heated has the same photospheric temperature but a larger surface temperature, meaning that most of the thermal expansion occurs at higher pressures.

The remainder of this section elaborates on these results by detailing how the mass--radius diagram is affected by changing various parameters in the model.


### Parameter explorations

Here I present the results of changing various parameters. @Tbl:default-values shows the default values used where no more specific value is chosen. Each figure is also labelled with the parameters used to generate those models.

| Parameter | Symbol | Value |
|-----------|--------|-------|
| Planet mass range | $M_p$ | [0.5, 10]$\,$M$_⊕$ |
| Internal energy generation rate | $ɛ$ | 10$^{-14}\,$W$⋅$kg$^{-1}$ |
| Irradiation temperature | $T_\mathrm{irr}$ | 300$\,$K |
| Core fraction by mass | $f$ | 0.7 |
| Thermal opacity | $κ_\mathrm{th}$ | variable |
| Visual/thermal opacity ratio | $γ$ | 0.01 |
| Atmosphere/envelope transition pressure | $P_\mathrm{surf}$ | 100$\,$bar |

: Default values used in the parameter exploration. By "variable" I mean that the opacity is left to increase into the atmosphere according to the atmospheric temperature and pressure (@eq:opacity) rather than kept fixed. {#tbl:default-values}

##### Opacity and opacity ratio

![
  The atmospheric opacity of water does not strongly affect the radius of a planet if it is fixed at an appropriate value (100$\,$m$^2$kg$^{-1}$ appears to be appropriate).
  But the opacity is important to include because it strongly affects the radius compared to the zero-opacity (isothermal) case.
](opacities){#fig:opacity}

A variable opacity gives a larger radius than any choices across four orders of magnitude corresponding to the range of values seen in @tbl:default-values.
This is because the optical depth increases rapidly into the atmosphere.
Water vapour is very opaque to thermal radiation compared to H/He atmospheres^[The opacity that @Rogers2010 use for hydrogen atmospheres gives an opacity $\kappa_\mathrm{th} = 3 \times 10^{-3}\,$m$^2\cdot$kg$^{-1}$; the water opacity from @eq:opacity under the same conditions is $3 \times 10^2$, five orders of magnitude higher.] and the optical depth at the transition pressure is often on the order of 10$^4$ or 10$^5$.
This means that energy is readily absorbed in the water layers and converted into a temperature difference.
This can be seen clearly in [@fig:internal-heat-profiles]: with this atmospheric treatment, internally heated planets are very hot at the base of the atmosphere.

Setting $κ_\mathrm{th} = 0$ has the effect of making the atmosphere isothermal. This figure shows that, for a weakly illuminated atmosphere, there is little radial change from intermediate values of $κ$, suggesting that the temperature structure in the atmosphere does not strongly affect the planetary radius for these lower-opacity cases.

![
  The visual/thermal opacity ratio does not strongly affect the mass--radius relation.
  Here I test several values on both sides of the $γ=1$ case, where the visual and infra-red opacity are identical.
  I caution that an accurate determination is difficult with the power-laws, which produce unreasonable results in low-density regions, and so I am forced to choose a fixed value for my models; I therefore chose 0.01 and justify this choice by noting that the final choice of $γ$ appears to be less important than other parameters.
](opacity-ratio){#fig:opacity-ratio}

In additional, the visual--thermal opacity ratio γ appears unimportant to the final radius ([@fig:opacity-ratio]).
Accurately assessing the value of $γ$ is difficult.
Although we can allow $γ$ to vary throughout the atmosphere, the uncertainty in both $κ_vis$ and $κ_ir$ mean that their ratio will be highly uncertain.
Also, the opacities in @Kurosaki2014 are only fitted to data between $1\,$bar and $100,$bar.
This is especially problematic near the photospheric surface because density becomes very low ($10^{-4}\,$bar), far outside the range of the power-law relationship.
I therefore fixed $γ$ to 0.01 ($κ_\mathrm{irr} = κ_\mathrm{th}$) for these models.
This is an appropriate value for a heated atmosphere in the higher-density regions (@Tbl:default-values).

##### Internal heating

![
  A watery planet's atmosphere is significantly inflated with relatively low levels of internal heat.
  Here I show the mass--radius relations for different levels of core heating $ɛ$.
  Unlike the case of a bare planet, we do not see a sharp transition in radius associated with the liquid--vapour transition.
](internal-heat){#fig:internal-heat}

@Fig:internal-heat shows that a planet can be inflated significantly by heating it internally.
By itself this is not particularly interesting---we could add any arbitrary amount of heat to a planet to make it larger.
But considered in the context of the Earth's internal energy generation rate of $1\,$pW$\cdot$kg$^{-1}$, this degree of inflation is achievable with a very modest degree of internal heating.
A $2\,$M_$\oplus$, $30$% water planet with Earth-like internal heat generation is inflated by $0.2$--$0.3\,$R_$\oplus$ compared to a similar planet with no internal energy generation.

##### External heating

![
  Externally irradiated planets are also inflated above the bare-planet case.
  Here I show the inflation due to external heating on top of an Earth-like rate of core energy generation.
](irradiation){#fig:irradiation}

An externally heated planet is larger than an unheated planet.
@Fig:irradiation shows the extent of this inflation.
The $2\,$M_$\oplus$, planet mentioned above is inflated by another $0.2$--$0.3\,$R_$\oplus$ when heated from $300$ to $1000\,$K.
This is in addition to the increase in radius from the base case with no internal energy generation.

![
  A planet's radius increases more when it is externally heated than when it is internally heated to an equivalent temperature.
  Here I show the results of the procedure described in @sec:comparing-internal-and-external-heating.
  I compare mass--radius diagrams from three sources: first, planets with varying degrees of internal heating (solid); second, planets where the surface temperature arising from internal heating is treated as the planetary equilibrium temperature at the photosphere instead (dashed); third, planets where the core energy generation is treated as the sole contributor to the planet's equilibrium temperature without any atmospheric heating effects (dotted).
](internal-vs-external){#fig:internal-external-heat}

Planets that are heated internally grow more when I instead treat them as being heated externally.
@Fig:internal-external-heat shows my comparison between these two methods of heating.
I find highly inflated radii for smaller planets heated externally.
For example, if we take a $4\,$M$_\oplus$ planet with $30$% water by mass and an Earth-like level of internal energy generation, its radius is approximately $2$R$_\oplus$.
If we then instead treat the temperature at the envelope--mantle boundary as being provided by an irradiation flux, we find that the planet is $0.5\,$R$_\oplus$ larger.

##### Pressure at base

![
  The pressure chosen for the radiative--convective boundary only marginally affects the final radius.
  Here I show the effect of changing the atmosphere--envelope transition pressure P$_{surf}$.
  Although a higher P$_{surf}$ gives a larger planet because more of the planet's mass is in the atmosphere, the effect is minimal.
](transition-pressure){#fig:transition-pressure}

I compared the mass--radius relation for models with different value of the atmosphere--envelope transition pressure $P_\mathrm{surf}$.
I did this to assess whether my choice of a fixed $P_\mathrm{surf}$ could bias my models.

I find that fixing the pressure at the radiative--convective boundary should not have significantly affected the final radius, because varying it produces very little change in the radius (@fig:transition-pressure).

##### Core fraction

![
  When an atmospheric layer is included, the water fraction becomes much more important in predicting the planet's final radius.
  Here I show mass--radius curves for planets with increasing water fractions.
  The extended steam atmosphere is larger for a planet with a higher water fraction.
](core-fraction){#fig:core-fraction}

Here I find a strong link between the planet's radius and its water fraction.
This is in contrast to my published results with bare planets, whose radii were relatively insensitive to core fraction.
In that paper we suggested that this was indicative of only the very top layer of the planet becoming vapour or super-ionic fluid.
In light of this further work on the atmospheric layer, it is likely that the trend in our first paper was instead caused by the model grid not resolving this outer atmospheric layer correctly.

### Atmospheric profiles

In order to gauge whether these models are accurately representing the behaviour of the atmosphere, I examined the atmospheric temperature profiles.
[@Fig:internal-heat-profiles;@fig:irradiation-profiles] show atmospheric profiles for planets heated internally and externally, respectively.
We see from these figures that the two modes of heating produce atmospheres with very different structures.


![
  Internally heated planets have temperature profiles that consist of a rapidly rising temperature in the outer layers, an isothermal region in the middle, and a heated region at the base of the atmosphere approaching the radiative--convective boundary.
  Here I display different temperature--pressure profiles for the atmospheres of 5$\,M_⊕$ planets with increasing core energy generation rates (and therefore the internal temperature $T_\mathrm{int}$).
  As I increase the core energy generation rate, the temperature at the base of the atmosphere increases---but this does not correspond to a change in the outer atmosphere.
](internal-heat-profiles){#fig:internal-heat-profiles}

![
  In contrast to [@fig:internal-heat-profiles], increasing a planet's irradiation temperature cause an increase in the bulk temperature of the atmosphere due to the greenhouse effect of the opaque steam atmosphere.
  The photospheric pressure also increases with increasing temperature.
  The temperature of the bulk of the atmosphere is approximately twice as high as the irradiation temperature in this case.
  These models also use a non-zero core luminosity, which manifests itself as the departure from an isothermal atmosphere near the base, but this does not affect the temperature of the bulk of the atmosphere.
](irradiation-profiles){#fig:irradiation-profiles}

## Discussion and conclusion

I have examined the mass--radius relation for watery planets consisting of three distinct layers: an isothermal iron/silicate core, an adiabatic watery envelope and a radiative atmosphere.
I employed a two-stream atmospheric profile from @Guillot2010 to simplify the atmospheric structure and avoid a full radiative calculation, reducing the number of key parameters to two: the irradiation temperature and the internal temperature.
I used my improved temperature-dependent equation of state to fully capture the thermal behaviour of water in the convective region, as well as temperature-dependent prescriptions for opacity.
I then linked the internal heating of the planet to the temperature at the base of the atmosphere to test whether these planets could be significant inflated by internal sources of heating.

I found that:

- The amount of internal energy generation needed to grow the atmosphere of a watery planet by an appreciable amount is about equivalent to that of Earth's.
- For equivalent amounts of heating, irradiation is more important for determining the change in planetary radius. Although internal heating can still change the temperature--pressure profile of such a planet, the bulk of the radial change appears to comes from the expansion of the outer atmosphere.

I also found the following:

- The models in our paper^[@Thomas2016] overpredicted the radius of heated watery planets without atmospheric layers.

- The use of a scale-height approach to estimate the extent of a heated steam atmosphere gives results that are too small, as the opacity of water results in heat being trapped in the atmosphere, meaning that the assumptions of constant temperature and gravity that underlie the scale-height approach are no longer applicable.

- The thermal opacity is a key driver of trends in the mass--radius relation.
Because my water opacity model consists of a simple power-law fitted to few data-points, I cannot necessarily claim that my models necessarily represent the full opacity-dependent behaviour of water.
But they do indicate that there is a significant relation to the planet's temperature that should be ignored.

- The assumption of constant atmospheric opacity, which has been made in some previous studies, is likely to produce incorrect radii.
Opacity can drastically increase towards the base of the atmosphere as the optical depth and pressure become higher.

As expected, the presence of an irradiated atmosphere introduces an additional complication over the bare-planet model of the previous chapter.
In particular, I now observe a strong dependence on the core mass (and therefore water mass) of the planet.
This is a fundamental degeneracy with interior structure models that cannot be avoided.
However, this means that we can, with some reasonable assumptions on the structural composition of Earth-like planets, at least assess which layered structures are compatible with a given mass and radius.
See chapter 6 for an example of this application.

### Limitations of the atmospheric model

The two-stream grey atmosphere that I used has several limitations and assumptions.^[@Guillot2010]

The two-stream approximation is valid in the limit where the incoming radiation is mostly in the visible and the outgoing radiation is mostly in the infrared, and these two wavebands are well-separated.
This is because of the simplifying assumption that
This may not be the case for heavily irradiated or strongly heated planets because a heated atmosphere emits more light in the visible.
But even in the extreme cases shown in [@fig:internal-heat-profiles], the bulk of the atmosphere is not much hotter than $1000$--$2000\,$K. \marginnote{
  The peak wavelength for a black body of temperature $1500\,$ is $2\,\mu$m.
} And it is apparent from [@fig:internal-heat-profiles;@fig:irradiation-profiles] that the region in which incident radiation is absorbed, near the top of the atmosphere, is characterised by a much lower temperature than the typical temperature of a Sun-like star.
For this reason, the two radiation fields used to calculate the two-stream grey atmosphere are mostly decoupled.
Some caution might be warranted if we were to use these models for planets around colder stars, however.

@Guillot2010 notes that the two-stream model\marginnote{
  He also notes in that paper that a useful value for the convective--radiative boundary pressure is $10\,$bar; compare to our choice of $100\,$bar and see \cref{fig:transition-pressure}
} diverges from numerical calculations away from temperatures significantly lower or higher than $1000\,$K due to changes in the mean opacities.
This highlights the important of the mean opacity in these calculations.
The model also assumes that the irradiation is distributed isotropically over the surface; a tidally locked planet could have very different atmospheric dynamics and would be better served by a three-dimensional atmospheric model.^[These tidally locked planets are sometimes called "eyeball planets" because they could have very different climates and surfaces on opposite sides with a transition ring around the edge, possibly giving the planet the appearance of a large eyeball.]

> TODO: maybe a little discussion of radiative/convective timescales would be useful here too; Tristan's paper has plenty of useful information near the end

### How are these models useful?

These models can still be useful in studies of entire planetary populations to address questions such as if there are dividing lines beyond which planets are mostly gaseous.^[@Rogers2015]

> TODO: a little more argument for the benefit of analytic models

A simple model for irradiated planets could be useful in population synthesis models of planetary populations, or in Bayesian analysis of large numbers of planets.
Such approaches benefit from being able to quickly evaluate the radius of a planet, as they involve assessing many models at once.
Until we have detailed spectral measurements of a planet's atmosphere, a full temperature model of the atmosphere may be unnecessarily complicated.
These two-stream models both account for temperature structure and include parameters necessary to incorporate at least the planet's irradiation temperature.
With knowledge of the host star and the planet's orbit, this is an easily calculable value.

To summarise, in this chapter I have proposed and assessed updated models for heated watery planets with adiabatic interiors and two-stream atmospheres.
The model includes parameters that control the degree of internal heating, and changes to these parameters affect the radius of these heated planets.
I have assessed whether this model is suitable for understanding the radial change of such planets when they are heated.
Based on the features of the solutions I see, I argue that this is indeed the case.

The remainder of this dissertation deals with applications of these models.
In the next chapter, I examine the phase structures of these heated planets and assess whether migration could significantly change their size.
And I wrap up with an application of my model code to a super-Earth with a possible watery layer.
