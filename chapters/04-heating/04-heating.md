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

Tidal heating occurs when a planet is tidally distorted by its gravitational interaction with a host star.
This mode of heating is also important for moons,^[@Ross1989] especially those around giant planets that are only weakly illuminated.

The decay of radioactive elements in a planet's core is known to contribute to its internal energy.
For example, the Earth's value is...

Gravitational contraction also provides heat input to a planet's interior.
For example, the Earth's value is...

> TODO: fill in Earth values for parameters above

At the same time, a planet is heated externally by its host star.
The equilibrium temperature for a planet is calculated by assuming that the planet is in thermal equilibrium and that incident and outgoing radiation are balanced.
If the planet emits as a blackbody,\marginnote{
  I assume a blackbody with perfect emissivity $(ϵ=1)$.
} the equilibrium temperature $T_\mathrm{eq}$ is
$$ T_\mathrm{eq} = T_⊙ \left( 1-a \right)^{1/4} \sqrt{R_⊙ \over 2D} $$ {#eq:planet-equilibrium-temperature}
where $T_⊙$ is the stellar temperature, $a$ is the planet's albedo, $R_⊙$ is the stellar radius and $D$ is the star--planet distance.

> TODO: cite that?

If we are to extract as much information from our observations as possible, it makes sense to incorporate all that we know about the planet and its environment into our models.
An obvious additional piece of information to use is the planet's temperature.
Though not directly observable, this will be strongly influenced by the planet's environment.

We must therefore ask: which mode of heating is dominant?
We know that for the Earth, the balance is in favour of irradiation: internal heating only contributes a small amount to the energy balance of the planet.
But this is not necessarily the case for all planets.
Planets with thick opaque atmospheres might trap internal energy more effectively.
And water-rich icy moons could also be heated by tidal interactions while receiving very little irradiation.
It it therefore useful to understand whether *internal* heat can significantly contribute to the observed radius of a planet.

### The planet's atmosphere

There is another complication that comes with using these models: they do not yet treat the planet's atmosphere.
If we wish to link these results to real observations, we must include a prescription for the extent of the atmosphere.

We saw earlier that heating a planet can moderately inflate its interior.
The same will be true for its atmosphere, but to what extent?
To answer this question completely, we need atmospheric models.
But a full atmospheric treatment is difficult and introduces many free parameters.
As we do not have the resources to obtain spectra for every planet of interest, we must begin with simpler models.
These models can still be useful in studies of entire planetary populations to address questions such as if there are dividing lines beyond which planets are mostly gaseous.^[@Rogers2015]

In order to do this, we need a better link between the planet's radius and its surface pressure.

### A better treatment of surface pressure

Up until now, I have considered the surface pressure as a free parameter in my models.
In reality, the surface pressure is set by the depth beyond which atmospheric measurements can no longer probe.
And in principle the surface pressure could be observationally constrained through spectroscopic observations of the planetary atmosphere, though such observations are currently difficult for super-Earths.

The models in the previous chapter have surface pressures of tens or hundreds of bars.
@Madhusudhan2015 discussed planets with water-rich atmospheres, describing the use of measurements both in and out of opacity windows to determine the atmospheric thickness.
The pressure to which these measurements probe can be $0.1\,$bar or lower in regions of high opacity.
My models therefore begin deeper within the planet, and we must

In the case of a volatile layer such as water, the line between interior and atmosphere can become blurred.
The picture is complicated by atmospheric effects that can increase the opacity.
If a cloud layer forms in the atmosphere, the opacity surface may not necessarily be at the same depth or pressure as any solid surface of the planet.
Turbidity effects around the critical point may also affect the opacity.
It is for this reason that high-temperature exoplanets are interesting: at higher temperatures, a cloud deck is less likely to occur and atmospheric measurements are therefore able to probe deeper.
The previously-mentioned opacity windows may therefore be able to provide a view through the atmosphere to the planet's surface, or at least to a point where the assumption of interior convective mixing is more likely to hold.

## Updates to the models

To achieve the goal of incorporating atmospheric and heating information into the models, I did several things.
I extended the equation of state to lower pressures.
I added an atmospheric layer to the models.
And I treated the temperature gradient within this layer, which necessitated adding information on the optical depth and therefore the opacity of water vapour.
Finally, I added realistic boundary conditions to the models that have a link to the physical properties of the planet, its temperature and its transit radius.

My final model comprises the interior structure from @sec:watery-planet-interiors (an iron core, a silicate mantle, and a water envelope) plus a water atmosphere.
Here I outline the

### Structural equations

In the previous chapter\marginnote{
  The mass continuity equation,
  \begin{equation}
    {dr \over dm} = {1 \over 4πr^2ρ},
    \label{eq:mass-continuity-repeat}
  \end{equation}
  links $r$, the radius to a spherical shell, to the mass $m$ interior to the shell and the density $ρ$ of the shell.

  The equation of hydrostatic equilibrium,
  \begin{equation}
    {dP \over dm} = -{Gm \over 4πr^4},
    \label{eq:pressure-gravity-repeat}
  \end{equation}
  where $P$ is the pressure at the shell and $G$ is the gravitational constant, ensures a balance of pressure and gravity.
} I modelled planets using three structural equations: [@eq:mass-continuity; @eq:pressure-gravity; @eq:adiabatic-temperature-gradient].
In this chapter I left the first two of these equations unmodified.
They are reproduced to the right as [@eq:mass-continuity-repeat; @eq:pressure-gravity-repeat] for completeness.
I then modified @eq:adiabatic-temperature-gradient \marginnote{
  The temperature gradient,
  \begin{equation}
    {dT \over dm} = ∇,
    \label{eq:temperature-gradient-generic}
  \end{equation}
  where ∇ varies depending on the mode of energy transport (see \cref{sec:temperature-gradient}), describes how the temperature varies inside the planet.
} to a more generic form (@eq:temperature-gradient-generic), allowing for different temperature strcutures.
Finally, I added @eq:optical-depth-gradient \marginnote{
  The optical depth relation,
  \begin{equation}
    {dτ \over dm} = -{κ \over 4πr^2},
    \label{eq:optical-depth-gradient}
  \end{equation}
  links the optical depth $τ$ to the opacity $κ$.
} to track the optical depth within the atmosphere.
Together, [@eq:mass-continuity-repeat; @eq:pressure-gravity-repeat; @eq:temperature-gradient-generic; @eq:optical-depth-gradient] form a system of ordinary differential equations that I solve in the same manner as before.

### The optical depth

I added the optical depth--radius\marginnote{
  The definition of the optical depth is
  \begin{equation}
    dτ = -κρdr
    \label{eq:optical-depth}
  \end{equation}
  where τ is the dimensionless optical depth, $κ$ is the opacity (units of m$^2⋅$kg$^{-1}$), $ρ$ is the density and $r$ is the radius.
  Combining this with \cref{eq:mass-continuity-repeat} gives \cref{eq:optical-depth}.
} relation (@eq:optical-depth-gradient) to the structure equations.
The optical depth gradient depends indirectly on the density of the gas through the opacity $κ$, which is a state function of the gas.

Within the envelope, I ignore any further increase of the optical depth because it is unimportant for calculating the convective temperature profile.
In practice this is achieved by setting ${dτ \over dm} = 0$ within the envelope.

### The opacity

In order to evaluate @eq:optical-depth, we need the opacity of the gas, $κ$.
I took the thermal opacity, $κ_\mathrm{th}$, as the representative opacity for the atmosphere.^[@Rogers2010]

The optical depth relation uses either a constant opacity κ or allows the opacity to vary throughout the atmosphere.
Some previous studies have used a constant $κ_\mathrm{th}$
<!-- TODO: ref -->
In this study I did this, choosing an appropriate value of $κ$, but also examined the effects of allowing $κ$ to change throughout the atmosphere [@sec:opacity-and-opacity-ratio].
This choice is likely to be significant because the pressure varies over several orders of magnitude within the atmosphere
<!-- TODO: ref section  -->
but we must also contend with the fact that there is no comprehensive data source for water opacity.

### The atmosphere--envelope transition

I chose the boundary between the irradiated atmospheric layer and the adiabatic interior to be at a fixed pressure of $100\,$bar ($10^7\,$Pa).
The boundary between the irradiated atmosphere and the adiabatic interior should normally be defined by the Schwarzschild criterion for convective instability.
<!-- TODO: include criterion -->
This criterion depends on the thermal behaviour of water and requires assessing whether the radiative or adiabatic temperature gradient is steeper.
I instead chose a constant pressure of $100\,$bar as a first approximation.

This transition pressure is close to the value of approximately $50,$bar from Kurosaki
<!-- TODO: ref -->
For pressures below $100\,$Pa, I use the two-stream irradiated atmospheric temperature profile.
Once $P > 100\,$bar I switch to the adiabatic profile.
In order to verify that this is an appropriate choice, in section @sec:pressure-at-base I show that this choice of $P$ has little effect on the final radius of the planet.

### The temperature gradient

I use three different values for the temperature gradient $∇$ in @eq:temperature-gradient-generic.
The choice of gradient depends on the mode of energy transport.

Within the core, where temperature effects are negligible, I set $∇ = 0$ to make the core isothermal.
The edge of the core is specified as a fraction of the planet mass and fixed as a model parameter.
When solving the structural equations, I therefore switch to this isothermal treatment once $m < f M$, where $m$ is the mass co-ordinate, $f$ is the core fraction and $M$ is the total mass of the planet.

For convective transport within the watery envelope, I use the adiabatic temperature gradient from @eq:adiabatic-temperature-gradient.

Finally, for the atmosphere, I compared two different treatments.
The first is an isothermal scale-height atmosphere; the second is a two-stream analytic temperature profile.
For the two-stream atmosphere treatment, I evaluate the temperature gradient $∇$ explicitly:
$$ ∇ = {dT \over dm} = {dT \over dτ} {dτ \over dm} $$ {#eq:two-stream-wrt-m}
where the temperature profile with respect to $τ$, $dT \over dτ$, is the derivative of @eq:two-stream-temperature-profile and the optical depth--opacity relation, $dτ \over dm$, is @eq:optical-depth-gradient.
But for the scale-height atmosphere I ignore the atmospheric layer completely during the model-building, simply adding a scale-height atmosphere on top of the bare envelope that is generated by setting the boundary condition $P=100\,$bar.

### The ideal gas equation of state

For this study, I also added the ideal-gas behaviour of water to the equation of state.
The equation of state for water as an ideal gas is
$$ ρ = {P \over R_\mathrm{H_2O} T} $$
where $ρ$ is the density of water gas, P is the pressure of the gas, $R_\mathrm{H_2O}$ is the specific ideal gas constant for water and T is the gas temperature.

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
We do not continue to track the optical depth within the envelope and so do not enforce its continuity at the atmosphere--envelope boundary.

For the external boundary condition I make several assumptions.
I take $R = R_P$ at $M = M_P$, where $R_P$ and $M_P$ are the total mass and radius of the planet.
I assume that the outer atmosphere is isothermal and that the gravity is constant in this region.
This, in combination with the power-law opacity, yields an atmosphere whose pressure and optical depth are both exponentially dependent on the radius.

> TODO: include derivation of chord optical depth, exponential isothermal atmosphere and pressure at photosphere

We therefore have
$$ P_R = \left( { G M_P \left( α+1 \right) τ_R \over R_P^2 C T^β }\right) $$ {#eq:pressure-at-photosphere}
and
$$ τ_R = {1 \over γ} \sqrt{H_P \over 2π \left( α+1 \right) R_P. } $$ {#eq:optical-depth-at-photosphere}

My code solves simultaneously for $T$ and $τ$ at the transit optical depth of the planet, taking $T$ from @eq:two-stream-temperature-profile, to set the boundary conditions at the outer boundary.
It then use @eq:optical-depth-at-photosphere to set the external pressure boundary condition.
This condition is re-evaluated after each trial solution.
In this fashion it

I set $τ=1$ as the optical depth defining the photosphere of the planet.
At optical depths $τ<1$ I ignore the atmosphere as it is effecively transparent.
My models therefore begin at a chord optical depth of $τ=1$.
This corresponds to a radial optical depth of $τ$ of less than 1, and the exact value depends on

The integration is performed on a logarithmically-spaced mass grid.
Previously I had used a fixed grid, linearly spaced with several hundred points in the mass co-ordinate.
However, when I added the atmospheric layer during the course of this study, it became apparent that the fixed mass step was failing to capture the extent of the atmosphere correctly.
In the very outer layers of the atmosphere where the density is very low, a fixed step in mass corresponds to a very large step in radius.
But in order to capture the pressure and optical depth change within the atmosphere, we require several points per scale height.
Given that the atmosphere is close to exponential in pressure and optical depth within the outer layers, I switched to a logarithmically spaced mass grid instead.
The smallest mass step was approximately $ΔM = 10^{-12} M_p$, which is sufficient to avoid any numerical error in the outer atmosphere. From there I allow the mass step to increase in a logarithmic fashion, scaling the size of the steps so that half the points lie in the atmosphere and half lie in the envelope/core.

> TODO: Back-of-the-envelope calculation showing that a very small mass step is needed to accurately capture the atmospheric behaviour: we want N points per scale height where N ≈ several

> TODO: show radius results converging with different # of steps?

In all other respects, the solver works as described in @sec:watery-planet-interiors.


### Internal heating

Because my code does not specifically solve any equations of internal energy transport, I needed a way to convert from internal heating amounts to a single temperature for these atmospheric models.

I do this by assuming that the core and envelope of the planet radiate as a black body.
I set the energy generation rate per unit mass in the core, $ɛ$, which has units of W$\,$kg$^{-1}$.
The luminosity of the core is then
$$ L_\mathrm{core} = M_p f ɛ, $$ {#eq:core-luminosity}
where $L_\mathrm{core}$ is the total luminosity of the core in W, $M_p$ is the planet's total mass, $ɛ$ is the luminosity of the core per unit mass, and f is the fraction of the planet's mass found in the core.
I take the energy generated by the core and assume that it is radiated evenly from the planet's surface at a radius of R_p.
I then use the Stefan--Boltzmann black body relation,
$$ T_\mathrm{eff}^4 = {L_\mathrm{core} \over 4πR_p^2 σ_B}, $$ {#eq:effective-temperature}
to determine the effective temperature of the planet based solely on its internal heating.
This effective temperature can be relatively low
<!-- TODO: fill in with Earth value -->
but thanks to the insulating effect of the atmosphere this results in a stronger heating effect than otherwise would be expected.
This fits with our understanding of the ease of heating---it is easier to heat a planet from within than from without because the heat is trapped in the lower atmosphere.

This definition assumes that the atmosphere is relatively thin.
This might not be the case for small planets---I highlight where this may be an issue in the results section.
However, it provides a simple link between the internal energy generation and the internal heating of the atmospheric model.

My internal heating treatment also assumes that the energy generated within the planet is sufficient to drive convection through the planet's envelope.
This results in a temperature gradient that increases downward into the planet until we reach the isothermal core.

### External heating

The equilibrium temperature of a planet provides a proxy through we can characterise the radial change due to external heating from the star.
The two-stream atmospheric profile takes the irradiation temperature $T_\mathrm{irr}$ as a parameter.
To set this temperature, I use the equilibrium temperature of the planet due to external radiation.
In this paper I do not evaluate this from the properties of the star, choosing instead to set the equilibrium temperature directly in my models.
That is, I set $T_\mathrm{irr} = T_\mathrm{eq}$
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
That is, I set $T_\mathrm{irr} = T_\mathrm{P = 100\,bar}/2^{1/4}$

In both of these cases, I then evaluate the planet's radius, but this time setting the internal heating to zero and allowing its radius to be governed solely by the external heating.

Both these methods can be thought of as answering the question: how does the planet's radius change when the temperature generated at the base of the atmosphere is instead taken to come from a radiative source?
The first method assumes that the
The second method takes into account the fact that it is significantly easier to grow a planet by internal heating than by external heating.
<!-- TODO: that needs some justification. -->

## The atmosphere

I compared two different atmospheric treatments.

### Two-stream atmosphere

I added a radiative temperature profile by using the analytic two-stream temperature profile of @Guillot2010.
The temperature profile is defined in terms of the optical depth $τ$.
This optical depth is the optical depth with respect to thermal radiation, defined by
$$ dτ = -κ_\mathrm{th} ρ dr. $$ {#eq:optical-depth-definition}

The temperature profile I used is taken from @Guillot2010; it is Eq. 27 in that paper. The profile is
$$ \begin{split}
    T^4 &= {3 T_\mathrm{int}^4 \over 4} \left[ {2 \over 3} + τ \right] \\
        & \quad + {3 T_\mathrm{irr}^4 \over 4} μ_*
                \left[ {2 \over 3} + {μ_* \over γ} + \left( {γ \over 3 μ_*} - {μ_* \over γ}e^{-γτ/μ_*} \right) \right]
\end{split} $$ {#eq:two-stream-temperature-profile}

In my code, the temperature profile is calculated as the solution of an ODE and evaluated from the outer boundary condition by calculating the derivative dT/dm rather than being calculated directly.
This means that my code has symmetry in the way it calculates the temperature: it starts from a boundary condition and integrates inward.
Although this is more prone to numerical error than evaluating the temperature directly for a given $τ$, it is no more so than any of the structural equations, all of which require solving an ODE in the same way.
Nevertheless, I used automatic differentiation
<!-- TODO: ref -->
to provide fast exact derivatives of the temperature profile.
Automatic differentiation is a technique for obtaining exact derivatives of explicitly specified functions without using a finite-difference approach.

> TODO: plot showing that the direct approach and the integration approach are comparable.

### Scale-height atmosphere

I also compared this approach to a scale-height atmosphere.
To generate this atmosphere, I assumed a constant-gravity atmosphere lying on top of the envelope.
The equation for the pressure scale height of a plane-parallel atmosphere is
$$ H = {k_B T \over μ g}, $$ {#eq:scale-height-generic}
where $H$ is the scale height, $k_B$ is the Boltzmann constant, $T$ is the temperature, $μ$ is the mean mass of a gas molecule and $g$ is the surface gravity of the planet.
This can be written as
$$ H = {R_\mathrm{H_2O} T \over g}, $$ {#eq:scale-height}
where $R_\mathrm{H_2O}$ is the specific gas constant for water ($R_\mathrm{H_2O} = 461\,$J$⋅$K$^{-1}⋅$g$^{-1}$).
I use an $8H$ atmosphere with $T = T_\mathrm{irr}$ to calculate the thickness of a scale-height atmosphere on top of the bare envelope.

### Two-stream grey atmosphere

My source for the opacity data was @Kurosaki2014.
In their paper, @Kurosaki2014 simulated the evolution of water-rich sub- and super-Earths.
Because there is no empirical formula for the opacity of water vapour, they provided simple power-law expressions based on a power-law fit to HITRAN
<!-- TODO: ref -->
data.
I have taken these opacities and used them in the two-stream grey atmosphere.

The opacity I used is
\begin{equation}
  κ_\mathrm{th} = 3.07 × 10^2
    \left({P \over \mathrm{1\,bar}}\right)^{0.9}
    \left({T \over \mathrm{1000\,K}}\right)^{-4.0}
    \mathrm{cm}^2⋅\mathrm{g}^{-1}.
  \label{eq:opacity}
\end{equation}
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

: Opacities ($κ$) and opacity ratios ($γ$) calculated from the power-law forms in @Kurosaki2014 across a range of pressures and temperatures relevant to the atmosphere of a heated waterworld. {#tbl:opacities}

I caution that these opacities may be too simple for the following reasons:

-   They appear to include no treatment of collisionally-induced absorption.
-   They are a least-squares fit to mean line opacities only.
-   They are fitted to just three different temperatures, the lowest of which is $1000\,$K, and three different pressures, the lowest of which is 1$,$bar.
At the top of the atmosphere we expect the pressure and temperature to be significantly lower than both of these.

Nevertheless, they are based on real data and were the best I could find.
<!-- TODO: rephrase that! -->
By choosing a power-law opacity we are able to simplify the expressions for the surface optical depth and pressure to the forms in @sec:boundary-conditions.
We therefore have reasonable physically-motivated boundary conditions for the external boundary.

As well as determining $κ$ from the power-law formula above, I also assessed several different values for a fixed κ.
@Tbl:opacities shows that the thermal opacity $κ_\mathrm{th}$ varies over several orders of magnitude; we assessed several of these values.

The value of $γ$ is highly uncertain because it is the ratio of two uncertain values, $γ = {κ_\mathrm{vis} \over κ_\mathrm{th}}$.
When I allowed $γ$ to vary freely though the atmosphere of the planet, I obtained planets with unnaturally inflated atmospheres.
I therefore did not allow $γ$ to vary freely throughout the atmosphere, fixing its value at $γ = 0.01$ for most purposes and also assessing how changing this could alter the final radius.
@Rogers2010 tested values of $γ = \left[ 0.1, 1, 10 \right]$ in their models of hydrogen-atmosphere planets; we set $γ = 0.01$ based on the values of $κ$ from @Kurosaki2014 [@tbl:opacities].
Later I show that the choice of this parameter does not strongly affect the final radius.

## Model verification

To validate the planet structures, I first compared the results for "bare" planets---planets without any atmospheric layers, whose outer boundary conditions are fixed at $P=100\,$bar---against my previous results.
While doing this, I discovered that the results are sensitive to the mass grid used in the integration.
@Fig:grid-error shows how an incorrect grid does not adequately resolve the pressure/temperature change in the outer atmosphere.
The error is minor ($< 0.1\,R_⊕$) for smaller planets ($M_p < M_\oplus$) but can be large ($0.3\,R_⊕$) for planets nearer $10\,M_⊕$.
To clarify, all the plots in this dissertation use the corrected mass grid.

![
  The mass grid affects the final mass--radius diagrams.
  Here I show models of "bare" planets---planets without an atmosphere, only a watery envelope.
  To do this, I set the outer boundary pressure to $100\,$bar and therefore prevent any of the planet from being treated as atmosphere.
  I use two different treatments for the mass grid: the first, shown dashed, replicates the mass grid choice from my first paper [@Thomas2016]; the second, shown solid, uses a mass grid that resolves low-density regions near a heated surface more appropriately in the heated case.
  I find that the difference can be significant for larger planets.
](grid-error_fig){#fig:grid-error}

### Comparison to scale-height atmosphere

I also compared my results to that of a scale height atmosphere.
The scale height atmosphere assumes an atmosphere that is exponential in pressure with optical depth.
My choice of atmosphere (from @Guillot2010) becomes exponential for constant $g$ and constant $T$ at $τ ≪ 1$.
The scale height atmosphere also assumes that the atmosphere is isothermal.
Therefore, if we force the atmosphere to be isothermal by setting $κ_\mathrm{th} = 0$ (and therefore $dT/dm = 0$), we will
My models reproduce the extent of the scale-height atmosphere in this case for larger mass planets (@fig:atmospheric-thickness).
However, the difference becomes larger at the low-mass end.
This is likely because the assumption of constant gravity no longer holds.

![
  When we set the opacity $κ$ to zero, forcing the atmosphere to become isothermal, the atmospheric treatment results in an atmosphere that is around the same thickness as a scale-height atmosphere.
  The only discrepancy is for low masses, where these models become very large.
  This is likely because the assumption of constant gravity in the atmosphere no longer holds and so the boundary conditions no longer correspond with the assumptions used to produce a scale-height atmosphere.
  For comparison, I also show the radius of the "bare" planet (the portion of the planet interior to the surface at $P=100\,$bar).
](atmospheric-thickness_fig){#fig:atmospheric-thickness}

## Results

> TODO: change "we" and "our" from here onward

Our models show the following:

Planets with watery atmospheres can be significantly inflated when heated ([@fig:internal-heat;@fig:irradiation]).
This is true whether the heating mode is external or internal.
Though the degree of inflation is less than we initially thought based on our bare planet models (@sec:changes-from-previous-results), there is still a dependence on radius.

When heated internally, the energy generation rate must be increased by several orders of magnitude to significantly affect the radius ([@fig:internal-heat]).
However, the internal energy generation rate required to achieve this degree of inflation of a waterworld is still comparable to that produced by the Earth.

When heated externally, significant radial changes are produced with temperature increases of several hundred Kelvin ([@fig:irradiation]).

This radial dependence is pronounced for smaller planets ([@fig:internal-heat;@fig:irradiation]).
At the low-mass end ($< 1\,$M$_⊕$), heated planets can grow to be larger than higher-mass planets heated to the same extent.

Treating the atmosphere as being of a fixed opacity produces results that are lower than if we allow the opacity to vary freely into the planet ([@fig:opacity]).
However, the opacity ratio $γ$ has little effect on the final radius ([@fig:opacity-ratio]).

A planet's radius increases more when it is externally illuminated to a certain equilibrium temperature than when it is internally heated to the same temperature ([@fig:internal-external-heat]).

If we assume that the two-stream atmosphere accurately captures radial change due to..., and accept that the opacity of water is at least on the order of $30\,$m^2$⋅$kg$^{-1}$, then a scale-height atmosphere is a poor choice for modelling these planets.
<!-- TODO: include figure of scale-height comparison for free $κ$ -->
Only in the case where a planet's atmosphere is isothermal---that is, it has no opacity---does the scale-height atmosphere reproduce the behaviour of this model ([@fig:atmospheric-thickness]).

The water fraction is a strong predictor of total radius ([@fig:core-fraction]); this is in contrast to our previous results with bare planets [@Thomas2016].

The atmospheric temperature profiles ([@fig:internal-heat-profiles;@fig:irradiation-profiles]) show that an externally heated planet is inflated because the temperature becomes higher through the entire atmosphere.
In contrast, a planet that is internally heated has the same photospheric temperature but a larger surface temperature, meaning that most of the thermal expansion occurs at higher pressures.

The remainder of this section elaborates on these results by detailing how the mass--radius diagram is affected by changing various parameters in the model.


### Parameter explorations

Here we present the results of changing various parameters. @Tbl:default-values shows the default values used where no more specific value is chosen. Each figure is also labelled with the parameters used to generate those models.

| Parameter | Symbol | Value |
|-----------|--------|-------|
| Planet mass range | $M_p$ | [0.5, 10]$\,$M$_⊕$ |
| Internal energy generation rate | $ɛ$ | 10$^{-14}\,$W$⋅$kg$^{-1}$ |
| Irradiation temperature | $T_\mathrm{irr}$ | 300$\,$K |
| Core fraction by mass | $f$ | 0.7 |
| Thermal opacity | $κ_\mathrm{th}$ | free |
| Visual/thermal opacity ratio | $γ$ | 0.01 |
| Atmosphere/envelope transition pressure | $P_\mathrm{surf}$ | 100$\,$bar |

: Default values used in the parameter exploration. By "free" we mean that the opacity is left to increase into the atmosphere according to the atmospheric temperature and pressure (@eq:opacity) rather than kept fixed. {#tbl:default-values}

##### Opacity and opacity ratio

![
  The atmospheric opacity of water does not strongly affect the radius of a planet if it is fixed at an appropriate value (100$\,$m$^2$kg$^{-1}$ appears to be appropriate).
  But the opacity is important to include because it strongly affects the radius compared to the zero-opacity (isothermal) case.
](opacities_fig){#fig:opacity}

A fully "free" opacity
<!-- TODO: find a better name to avoid confusion with bound/free -->
gives a bigger radius than any choices across four orders of magnitude corresponding to the range of values we see in @tbl:default-values.
This is because the optical depth increases rapidly into the atmosphere.
Water vapour is very opaque to thermal radiation compared to H/He atmospheres
<!-- TODO: show this with numbers -->
and the optical depth at the transition pressure is often on the order of 10$^4$ or 10$^5$.
This means that energy is readily absorbed in the water layers and converted into a temperature difference.
<!-- TODO: show this with pictures -->

Setting $κ_\mathrm{th} = 0$ has the effect of making the atmosphere isothermal. This figure shows that, for a weakly illuminated atmosphere, there is little radial change from intermediate values of $κ$, suggesting that the temperature structure in the atmosphere does not strongly affect the planetary radius for these lower-opacity cases.

![
  The visual/thermal opacity ratio does not strongly affect the mass--radius relation.
  Here we test several values on both sides of the $γ=1$ case, where the visual and infrared opacity are identical.
  We caution that an accurate determination is difficult with the power-laws, which produce unreasonable results in low-density regions, and so are forced to choose a fixed value for our models; we therefore chose 0.01 and justify this choice by noting that the final choice of $γ$ appears to be less important than other parameters.
](opacity-ratio_fig){#fig:opacity-ratio}

In contrast, the visual--thermal opacity ratio γ appears unimportant to the final radius ([@fig:opacity-ratio]).
Accurately assessing the value of γ is difficult.
Although we can allow γ to vary throughout the atmosphere, the uncertainty in both κ_vis and κ_ir mean that their ratio will be highly uncertain.
Also, the opacities in @Kurosaki2014 are only fitted to data between 1 bar and 100 bar.
This is especially problematic near the surface because density becomes very low (10$^{-4}\,$bar) and
<!-- TODO: give example values -->
We therefore fixed $γ$ to 0.01 ($κ_\mathrm{irr} = κ_\mathrm{th}$) for these models.
This is an appropriate value for a heated atmosphere in the higher-density regions (@Tbl:default-values).

##### Internal heating

![
  A watery planet's atmosphere is significantly inflated with relatively low levels of internal heat.
  Here we show the mass--radius relations for different levels of core heating $ɛ$.
  Unlike the case of a bare planet, we do not see a sharp transition in radius associated with the liquid--vapour transition.
](internal-heat_fig){#fig:internal-heat}

@Fig:internal-heat shows that a planet can be inflated significantly by heating it internally.
By itself this is not particularly interesting---we could add any amount of heat to a planet to make it larger.
But considering that Earth prouduces about 10$^{-12}\,$W$⋅$kg$^{-1}$ from radioactive decay and gravitational settling, these results are interesting.

##### External heating

![
  Externally irradiated planets are also inflated above the bare-planet case.
  Here we show the inflation due to external heating on top of an Earth-like rate of core energy generation.
](irradiation_fig){#fig:irradiation}

An externally heated planet is larger than an unheated planet.
@Fig:irradiation shows the extent of this inflation.
<!-- TODO: need numbers -->

![
  A planet's radius increases more when it is externally heated than when it is internally heated to an equivalent temperature.
  Here we show the results of the procedure described in @sec:internal-external-heat.
  We compare mass--radius diagrams from three sources: first, planets with varying degrees of internal heating (solid); second, planets where the surface temperature arising from internal heating is treated as the planetary equilibrium temperature at the photosphere instead (dashed); third, planets where the core energy generation is treated as the sole contributor to the planet's equilibrium temperature without any atmospheric heating effects (dotted).
](internal-vs-external_fig){#fig:internal-external-heat}

Planets that are heated internally grow by less than when we instead treat them as being heated externally.
@Fig:internal-external-heat shows our comparison between these two methods of heating; we find highly inflated radii for smaller planets heated externally.
<!-- TODO: need numbers -->

##### Pressure at base

![
  The pressure chosen for the radiative--convective boundary only marginally affects the final radius.
  Here we show the effect of changing the atmosphere--envelope transition pressure P$_{surf}$.
  Although a higher P$_{surf}$ gives a larger planet because more of the planet's mass is in the atmosphere, the effect is minimal.
](transition-pressure_fig){#fig:transition-pressure}

We compared the mass--radius relation for models with different value of the atmosphere--envelope transition pressure $P_\mathrm{surf}$.
We did this to assess whether our choice of a fixed $P_\mathrm{surf}$ could bias our models.

We find that fixing the pressure at the radiative--convective boundary should not have significantly affected the final radius, because varying it produces very little change in the radius (@fig:transition-pressure).

##### Core fraction

![
  When an atmospheric layer is included, the water fraction becomes much more important in predicting the planet's final radius.
  Here we show mass--radius curves for planets with increasing water fractions.
  The extended steam atmosphere is larger for a planet with a higher water fraction.
  This is in contrast to our results with bare planets, whose radii were relatively insensitive to core fraction.
](core-fraction_fig){#fig:core-fraction}

Compared to our previous paper, where we found that the total radius was insensitive to the core fraction of the planet, here we find a strong link.
In that paper we suggested that this was indicative of only the very top layer of the planet becoming vapour or superionic fluid.
This conclusion still stands in the case of a bare planet---but once we include an atmosphere with the ideal gas equation of state, the entire atmosphere begins to expand and contract when heated.

### Atmospheric profiles

In order to gauge whether these models are accurately representing the behaviour of the atmosphere, we examined the atmospheric temperature profiles.
[@Fig:internal-heat-profiles;@fig:irradiation-profiles] show atmospheric profiles for planets heated internally and externally, respectively.

![
  Internally heated planets have temperature profiles that consist of a rapidly rising temperature in the outer layers, an isothermal region in the middle, and a heated region at the base of the atmosphr approaching the radiative--convective boundary.
  Here we display different temperature--pressure profiles for the atmospheres of 5$\,M_⊕$ planets with increasing core energy generation rates (and therefore the internal temperature $T_\mathrm{int}$).
  As we increase the core energy generation rate, the temperature at the base of the atmosphere increases---but this does not correspond to a change in the outer atmosphere.
](internal-heat-profiles_fig){#fig:internal-heat-profiles}

![
  In contrast to @fig:internal-heat-profiles, increasing a planet's irradiation temperature cause an increase in the bulk temperature of the atmosphere due to the greenhouse effect of the opaque steam atmosphere.
  The photospheric pressure also increases with increasing temperature.
  The temperature of the bulk of the atmosphere is approximately twice as high as the irradiation temperature in this case.
  These models use a non-zero core luminosity, which manifests itself as the departure from an isothermal atmosphere near the base.
](irradiation-profiles_fig){#fig:irradiation-profiles}

## Discussion and conclusion

We have examined the mass--radius relation for watery planets consisting of three distinct layers: an isothermal iron/silicate core, an adiabatic watery envelope and a radiative atmosphere.
We employed a two-stream atmospheric profile from @Guillot2010 to simplify the atmospheric structure and avoid a full radiative calculation, reducing the number of key parameters to two: the irradiation temperature and the internal temperature.
We used our improved temperature-dependent equation of state to fully capture the thermal behaviour of water in the convective region, as well as temperature-dependent prescriptions for opacity.
We then linked the internal heating of the planet to the temperature at the base of the atmosphere to test whether these planets could be significant inflated by internal sources of heating.

We found that:

- The amount of internal energy generation needed to grow the atmosphere of a watery planet by an appreciable amount is about equivalent to that of Earth's.
- For equivalent amounts of heating irradiation is more important for detrmining the ..., Although internal heating can still change the temperature--pressure profile of such a planet, the bulk of the radial change comes from the expansion of the outer atmosphere.

We also found the following:

- Our previous models overpredicted the radius of heated watery planets without atmospheric layers.
- The use of a scale-height approach to estimate the extent of a heated steam atmosphere gives results that are too small, as the opacity of water results in heat being trapped in the atmosphere, meaning that the assumptiopm
- The thermal opacity is a key driver of trends in the mass--radius relation. Because our water opacity model consists of a simple power-law fitted to few data-points, we cannot claim that our models provide accurate radii, but they do indicate that there is a significant relation to the planet's temprature that cannot be ignored.

The assumption of constant opacity in a watery atmosphere is likely to be incorrect.
Opacity can drastically increase towards the base of the atmosphere as the optical depth and pressure become higher.

As expected, the presence of an irradiated atmosphere introdues an additional complication over the bare-planet model of our previous work.
In particular, we now observe a strong dependence on the core mass (and therefore water mass) of the planet.
This is a fundamental degeneracy with interior structure models that cannot be avoided, though reasonable constraints can be placed on the water content of a planet... (can they??)
<!-- TODO: references -->

The two-stream gray atmosphere we used has several limitations.
It only...

The photospheric transit radius definition assumes that...
Most importantly...

The other limitation comes from the assumption of an adiabatic temperature profile in the planet's envelope.
If
However, we believe that this is not a

A simple model for irradiated planets could be useful in population synthesis models of planetary populations, or in Bayesian analysis of large numbers of planets.
Such models benefit from being able to quickly evaluate the radius of a planet, as they involve assessing many models at once.
Until we have detailed spectral measurements of a planet's atmosphere, a full temperature model of the atmosphere may be unnecessarily complicated.
These two-stream models both account for temperature structure and include parameters necessary to incorporate at least the planet's irradiation temperature.
With knowledge of the host star and the planet's orbit, this is an easily calculable value.

To summarise, in this chapter I have proposed and assessed updated models for heated watery planets with adiabatic interiors and two-stream atmospheres.
The model includes parameters that control the degree of internal heating, and changes to these parameters affect
I have assessed whether this model is suitable for understanding the radial change of such planets when they are heated.
Based on the features of the solutions I see, I argue that this is indeed the case.

> TODO: Section on Earth's energy budget?

> TODO: Compare to tidal heating models?
