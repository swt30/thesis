# Watery planet interiors

Having created an improved equation of state for water, the next step was to build structural models of watery planets and ask the question: does temperature matter?

In this chapter I develop the framework to apply my equation of state to interior structure models.
After outlining the theory of exoplanet interior structural models, I present my code, \smallcaps{ONION}, which solves the system of structural equations for a one-dimensional planet.
Then I show the results of building models with this code.
First I examine the effects of my equation of state on homogeneous isothermal spheres.
Next I add in temperature dependence and model the interiors of inhomogeneous layered planets.
Finally I discuss how, and under what circumstances, my equation of state produces results that differ from other models.

## Theory

Guided by the motivation presented in the introduction, I constructed models of heated watery planets with the aim of taking full account of the thermal effects in these models.

By *thermal effects* I mean several things in particular.
First, I mean the thermal expansion of a heated water layer on the surface or within the planet's interior: this contrasts with those models that treat the planets as cold spheres.
Second, I mean any temperature gradient established within the planet: this is in contrast to the isothermal case.
And third, we expect phase transitions within the water layer if the temperature and pressure cross one of the boundaries between different phases of water seen in [@fig:water-phases].
This is treated later in @sec:phase-structure-and-migration.

### Model assumptions

In constructing planetary models, I have assumed the following.

First, the planet is spherically symmetric.
This reduces the structural equations to one dimension.
It is possible to construct higher-dimensional models of planets.
In fact this is particularly useful when investigating atmospheric behaviour: full three-dimensional global circulation models can reveal interesting details about the behaviour of the atmospheres of large planets, such as the existence of zonal winds or hot spots, that one-dimensional models will miss.^[e.g. @Kataria2016]
But such models are beyond the scope of this work.

Second, the planet is in a state of hydrostatic equilibrium.
That is, pressure and gravity are balanced throughout, allowing us to use the equation of hydrostatic equilibrium as a structural equation.

Third, the planet is in thermal equilibrium or quasi-equilibrium.
By this I mean simply that the temperature equations are time-independent: there is no time evolution of the structure, and both external and internal heating are assumed to be constant.
Although the planet may still be generating some internal energy due to gravitational contraction, the cooling time is assumed to be very long.
Similarly, any radiogenic heating is assumed to be produced by elements with a very long half-life.

Finally, the planet is non-rotating and non-magnetic.
These situations only complicate the models; I have ignored them for the time being.

With these assumptions, the structure of a planetary interior is governed by a linked set of ordinary differential equations.

### Structural equations

We first consider the isothermal case where the temperature $T$ is constant throughout the planet.
In this case the structural equations are the mass continuity equation,\marginnote{
  Here $r$ is the radius of a spherical shell, $m$ is the mass interior to that shell and $\rho$ is the density of the shell.
} $$ {dr \over dm} = {1 \over 4πr^2ρ}, $$ {#eq:mass-continuity}
and the equation of hydrostatic equilibrium,\marginnote{
  Here $P$ is the pressure at the shell and G is the gravitational constant.
} $$ {dP \over dm} = -{Gm \over 4πr^4}. $$ {#eq:pressure-gravity}
The equation of state,
  $$ ρ = ρ(P, T), $$ {#eq:eos}
is also used to calculate the density of the material in question from its pressure and temperature.

Together, these equations define a structural model: a linked set of ordinary differential equations.
To generate a model of a homogeneous isothermal planet, it is sufficient to solve this system of equations.
But this is not the whole story.
We require a temperature treatment for the planet to take advantage of the improved temperature-dependent equation of state.

### The temperature gradient

Previous models of super-Earth interiors have treated temperature gradients within the planet in a number of ways.
From simple to complex, these include:

1.  Isothermal models, which use only the equations above and an isothermal equation of state of the form $ρ = ρ(P)$.^[This is the approach taken by @Seager2007.]
2.  Simple temperature prescriptions:
    a)  One may assume a fixed temperature--pressure relation $T = T(P)$ so as to reduce the equation of state to the form $ρ = ρ(P)$ and then use the equations above.^[For example, @Zeng2013 chose the melting curve of water for this purpose.]
    b)  Or one may choose a temperature profile $T = T(r)$ for the planet (perhaps scaled appropriately to an internal or external boundary temperature) and then use the equations above.
3.  An adiabatic or conductive temperature gradient or some combination of the two.^[For example, @Valencia2010 used a convective interior with conductive boundary layers.]
4.  A full treatment, which adds an energy transport equation to the equations above then self-consistently solves this with a prescription for luminosity.^[For example, @Wagner2011 modelled an adiabatic core underneath a radiogenically heated mantle.]

I did not explicitly handle energy transport in the manner of the fourth option.
Instead I chose the third approach and assumed an adiabatic (isentropic) temperature gradient throughout the planet.
The equation for the adiabatic temperature gradient^[@Milone2014] is\marginnote{
  Here $g = Gm/r^2$ is the gravity at the shell, $c_P$ is the isobaric heat capacity and $α$ is the volumetric thermal expansion coefficient defined in \cref{eq:thermal-expansion}.
} $$ { dT \over dr} = -{T α g \over c_P}. $$ {#eq:adiabatic-temperature-gradient-radial}
My sources for these latter two coefficients are detailed in @sec:thermal-expansion-and-heat-capacity-of-water.

@Eq:adiabatic-temperature-gradient-radial combined with @eq:mass-continuity gives the temperature gradient in terms of the mass co-ordinate,
  $$ {dT \over dm} = -{T α G m \over 4 π r^4 ρ c_P}. $$ {#eq:adiabatic-temperature-gradient}

Is the assumption of an adiabatic temperature gradient appropriate?
In order to answer this, we need to show that convective heat transfer is dominant over conductive and radiative heat transfer---and if not, use those gradients instead.

##### Convection vs conduction

We can assess whether a planetary layer is likely to be convective or conductive by calculating its Rayleigh number,\marginnote{
  Here, $g$ is the acceleration due to gravity, $\alpha$ is the volumetric thermal expansion coefficient, $\Delta T$ is the temperature differential across the layer, $h$ is the layer thickness, $\nu$ is the coefficient of kinematic viscosity and $\kappa$ is the thermal diffusivity. This is the Rayleigh number for a fluid layer heated from below; later in \cref{sec:heating-and-the-atmosphere} we will indeed assume that internal heating comes from deep in the planet and that the water layer is not itself luminous.
} $$ Ra = {g \alpha \Delta T h^3 \over \nu \kappa}, $$ {#eq:rayleigh-number}
which is the ratio of buoyant and viscous drag forces [@Milone2014]. Rayleigh numbers over the critical threshold for convection $Ra_\mathrm{c}$, typically taken as $1000$--$2000$, indicate that buoyancy forces dominate and so the layer will convect.

I will not be assessing the above equation for every model constructed in this dissertation, and an order-of-magnitude calculation will quickly show why: the Rayleigh number of a icy super-Earth far exceeds the critical threshold for convection. Taking as a representative example the case of an icy planet with a similar temperature structure to the Earth, here is a rough sketch of the Rayleigh number of its water layer.

- For an Earth-sized and Earth-mass planet, the acceleration due to gravity $g$ is ~$\,10\,$m$\cdot$s$^{-2}$.
- Ice VII is a good representative choice for the high-pressure phase of water inside a solid Earth-sized planet. The volumetric thermal expansion coefficient $\alpha$ of ice VII is ~$\,10^{-4}\,$K$^{-1}$ [@Fei1993].
- Assume that our representative waterworld has a thick ice layer similar to the Earth's mantle. Then the temperature difference $\Delta T$ is ~$\,3000\,$K across a characteristic layer height $h$ of ~$\,3 \times 10^6\,$m.
- The coefficient of kinematic viscosity $\nu$ can also be expressed as ${\eta \over \rho}$ where $\eta$ is called the dynamic viscosity and $\rho$ is the density [@Milone2014]. In [@fig:simple-eos-comparison] we see that a representative density of ice is $10^3$--$10^4\,$Pa over the GPa--TPa range; I take $\rho\,$~$\,10^3$ to account for the planet's increased temperature over the zero-temperature EOS shown in that figure. Then taking the dynamic viscosity of ice VII as $10^{14}\,$Pa$\cdot$s [@Poirier1981], this gives $\nu\,$~$\,10^{11}\,$m$^2\cdot$s$^{-1}$.
- The thermal conductivity of ice VII is ~$\,10\,$W$\cdot$m$^{-1}\cdot$K$^{-1}$ [@Chen2011].
- Putting this together with [@eq:rayleigh-number] we find that $Ra\,$~$\,10^8$, five orders of magnitude higher than the critical Rayleigh number of $10^{3}$.

Convective energy transport therefore almost certainly dominates within the bulk of the icy planet we have just considered. In order for viscosity effects to suppress convection, the kinematic viscosity of ice $\nu$ would have to be five orders of magnitude larger.^[Within the icy moons of Jupiter and beyond, kinematic viscosity decreases with depth (that is, with increasing temperature and pressure) and only varies by about an order of magnitude anyway [@Hussmann2006; @Nimmo2018].] Therefore I proceed by assuming that convection holds throughout the planet. Although this is a reasonable assumption, convection could potentially be suppressed if the planet were much more weakly heated or if the ice layer were much thinner. Therefore, in a more detailed model it might also be sensible to allow thin conductive layers at key transition points like at the planet's crust. Such layers would be expected to sustain conductive heat transfer because they are thin and occur at points where the composition of the planet is changing. This is the approach taken by @Valencia2006 when modelling super-Earth and super-Mercury planets and it is inspired by the boundary layers used in Earth models and the "stagnant lid" models for solar system icy bodies.

Phase transitions may also affect convection. As a rule of thumb, exothermic phase transitions^[Here these are defined for the transition from the less dense phase i.e. down into the planet.] intensify convection and endothermic ones suppress it [@Milone2014].
The key phase transitions seen in my models---from high-pressure or superionic fluid to ice VI or VII---are exothermic and therefore unlikely to suppress convection.^[See @sec:phase-structure-and-migration for further discussion of phase transitions within my models.]

##### Convection vs radiation

In contrast to the above, a single representative order-of-magnitude calculation is not appropriate for showing whether radiation is likely to be a dominant mode of energy transport throughout the entire planet.
This is because radiative transfer is almost certain to be dominant at some point in the outer layers of every waterworld: as the planet's solid/liquid interior transitions into a gaseous atmosphere, radiation becomes a viable method of carrying increasing amounts of energy.
Though this chapter does not yet treat the atmosphere of the planet, we will see in @sec:heating-and-the-atmosphere that a radiative temperature gradient is needed to represent the atmosphere.
We will therefore treat this radiative atmosphere appropriately when we come to it.

For the icy planetary interior models in this chapter, however, radiation is unimportant to the energy transport of the planet.
This is by analogy with the Earth, where only long-wavelength ($\geq 1\,$km) radio waves can propagate, transporting negligible amounts of heat compared to conduction and convection [@Milone2014].
We expect similar behaviour to hold with ice/liquid waterworlds because these materials are effectively opaque to shorter-wavelength radiation.

## Models

Together, [@eq:mass-continuity; @eq:pressure-gravity; @eq:eos; @eq:adiabatic-temperature-gradient] define a structural model: three ordinary differential equations and an equation of state linking pressure, temperature and density.

The choice of how to solve this system depends on one's aim.
A common approach has been to treat it as a boundary value problem; that is, to integrate the structural equations from initial conditions at the surface or centre of the planet.
For example, @Seager2007 approached the isothermal problem ([@eq:mass-continuity; @eq:pressure-gravity; @eq:eos] only) from the inside out, choosing appropriate central pressures at the $(r=0, m=0)$ boundary and building their models outward from there.

### Solving the boundary value problem

Boundary value problems are common in stellar structure codes and can be solved in several ways.
The approach of @Seager2007 just described is called a *shooting method*.^[For a general implementation of a shooting method, see chapter 18 of @Press2007.]
Building on this idea, the method of *double shooting* or *shooting to a fitting point* integrates both inwards and outwards from assumed boundary conditions at the core and exterior of the planet.
The solutions must match where they meet, and so after each trial solution the boundary conditions are adjusted based on the discrepancy.

This double shooting method is increasingly slow to converge as the number of structural equations increase.
The correct values for the inner boundary (at the centre of the planet) must be arrived at iteratively based on an initial guess.
With more structural equations, the iterative procedure must span more dimensions, so performing gradient descent to find the correct solution is slower.
It is therefore only useful for simple models, and more sophisticated approaches may be needed.

The relaxation method is one such approach.
I mentioned above the idea of shooting to a fitting point.
We could also imagine increasing the number of fitting points, using two or three or more points at which the solution must match, and supplying a predicted value at each of these.
If we have a pre-existing structure model on which to base the values at these fitting points, then our initial guesses will be relatively good and we can attempt to iterate toward a solution that satisfies the matching condition at each of these points.
Taking this idea to its extreme, we might then use every point in the discretised mesh as a fitting point.
This transforms the problem: instead of solving a coupled system of ordinary differential equations, we must now solve a much larger system of non-differential equations.
We can use standard linear algebra techniques to do this, and we can also use a shooting method to provide the initial guess for the structure.
The relaxation method comes into its own when we want to perform evolutionary calculations because we can use the previous structural model as the initial guess.


\newthought{I investigated several} boundary value problem (BVP) and more general ordinary differential equation (ODE) solvers to handle the problem defined by [@eq:mass-continuity; @eq:pressure-gravity].
There are several reasons to desire a generic method of solving these equations.
Generic ODE solvers are well-tested, they are optimised for performance, and using one would save development time.^[Perhaps even more importantly, they are likely written by someone more competent at scientific programming than us.]

To handle this problem, any ODE solver needs to meet the following requirements:

- It needed to solve boundary value problems with systems of equations.
- It needed to handle the numerical singularity at $\left(r=0,m=0\right)$ where the denominators of [@eq:mass-continuity; @eq:pressure-gravity; @eq:adiabatic-temperature-gradient] approach $0$.
- It needed to be able to switch between different equations of state depending on the planet's structure.^[This is sometimes referred to as the solver having support for events. An "event" is any situation in which the system of equations is altered, such as the transition between layers.]

Most of the solvers I evaluated fell short in one of two ways: either they could not handle the singularity at the centre of the core where $r=0$, $m=0$, or they could not handle the transition between equations of state at layer boundaries.
I also desired to retain some control over the solver itself rather than treating the solution of the ODE as a black box.
The differential equation solver I found that best met my needs was DifferentialEquations.jl [@Rackauckas2017].
Working from this differential equation solver as a base, I developed a package that solves systems of equations for planetary structures.

### A boundary value solver in Julia

My solver is called \smallcaps{ONION}.^[Because planets, like onions and ogres, have layers.]
I prototyped it in Python and later ported it to Julia, a new scientific programming language that offers much better numerical performance.

I used the shooting method, described above, to solve for the planet's structure.
At first I was concerned that this method would prove insufficient for the coupled system of ODEs due to the numerical singularity at the centre of the planet.
I trialled both single and double shooting approaches, but the single shooting method proved to work acceptably.
In fact, the singularity proved to be a useful signal for failed convergence (see @sec:conditions-for-convergence below).

Compared to @Seager2007, who integrate from the centre of the planet outwards, my code integrates from the outside in.^[Several others take this approach too [e.g. @Rogers2010; @Madhusudhan2012a]]
This has the advantage of allowing us to specify the surface temperature and pressure as boundary conditions rather than specifying a central pressure and temperature.
These surface boundary conditions are more closely linked to observable parameters than the boundary conditions at the core.

I used a Lagrangian system, where the mass interior to a given shell is the independent variable; this is already reflected in [@eq:mass-continuity; @eq:pressure-gravity; @eq:adiabatic-temperature-gradient], which are written in the form $dx/dm = \dots$.
It is in contrast to the Eulerian co-ordinate system used by @Seager2007, who take the radius $r$ as the independent variable.
The Lagrangian formulation is more stable under numerical integration;^[@Rogers2012] I also found it more convenient to be able to specify differentiated planets in terms of mass fractions rather than radial distances.

### Conditions for convergence

The shooting method uses a series of trial solutions.
For the initial trial solution, I specify the surface boundary conditions: total planetary mass $M$, surface pressure $P(M)$, and surface temperature $T(M)$.
I further allow for multi-layer planets by specifying the composition and mass fractions of each layer, $\{x_i\}$.
I also specify a search bracket for the radius $[R_1(M), R_2(M)]$.
The code uses a Runge--Kutta integrator [@Tsitouras2011] to solve the system of differential equations above.

Specifying the parameters $\{M, R, \{x_i\}\}$ gives an overdetermined system.
The trial solution will therefore fail to meet the inner boundary condition, which is that $r=0$ where $m=0$.
After creating one trial solution by integrating the system of ODEs from the outside, we need to adjust one of the parameters to approach a self-consistent solution.

I therefore chose to iterate the initial radius $R$ until I obtain a value which is consistent with the given $M$ and $\{x_i\}$.
In each successive trial, my code iteratively adjusts the radius boundary condition $R(M)$, using a bisection root-finding method to ensure that the radius approaches zero as the mass approaches zero.
In this way it converges on the correct value for the total radius, giving a self-consistent solution.
I further required that $r$ remains positive: this avoids any numerical difficulty arising from the behaviour of the equations at $r=0$.
@Fig:solver-flowchart summarises this process.

![
  A flowchart summarising how my structural solver \smallcaps{ONION} works.
](solver-flowchart_big_fig){#fig:solver-flowchart}

I was unable to use a faster method, such as the secant method, to solve for the correct radius.
This is because the equations break down at the very centre and are not valid for $r<0$ or $m<0$, so I am unable to integrate past the central point and use this information to derive a gradient to correct the next iteration.
Instead, I terminate the integration if $r < 0$ before $m = 0$, using this as a signal that I have chosen an initial radius that is too small---that is, we have hit the centre before we have accounted for all the mass in the model.
I then stop the integration, bisect the search region, and try again.
In contrast, if the initial radius is too large, we will run out of mass before we reach $r=0$, at which point I also terminate and refine the initial guess.
I consider the model to have converged successfully if the final value of $r$ is less than $1000\,$m.
@Fig:solver-flowchart summarises how the solver works.

It is trivial to use this method to solve for another parameter instead of the radius.
Because my intention was to investigate the change in observable parameters, I choose to leave the planet's radius as the free parameter.
But it is also possible to leave another parameter free, such as the core mass, layer thickness or even the composition.
For an example of this, see [@sec:a-water-rich-super-earth], in which my models are used to analyse the potential composition of a water-rich super-Earth.

### Mass--radius relations for differentiated planets

I used my models to produce mass--radius relations for homogeneous spheres of water as well as differentiated multi-layer models.
I did this first for the homogeneous isothermal case [in the manner of @Zapolsky1969] and then extended my models to include an adiabatic temperature gradient.
My differentiated multi-layer models include a water layer on top of a silicate mantle and an iron core.
To do this, they treat the equation of state, @eq:eos, as piecewise in the mass co-ordinate.
For example, consider a model which has a $5$% (by mass) water layer on top of a silicate mantle.
For this model, my code begins evaluating @eq:eos using the water equation of state.
It then switches to the silicate equation of state once $m$, the mass interior to the spherical shell in [@eq:mass-continuity;  @eq:pressure-gravity; @eq:adiabatic-temperature-gradient], drops below $95$% of the planetary mass.
It is possible to choose the integration grid such that this occurs exactly at the end of an integration step.
However, in practice a sufficiently fine grid is also acceptable.

I ignored thermal effects within the iron and silicate layers.
The effect of thermal expansion in these solids is thought to be low.^[@Seager2007; @Grasset2009]
It would be simple to to include the expansion effects of these materials, but I did not collate the equation of state data to enable me to do so.
Because I ignored thermal expansion in these layers, I modelled them as isothermal.^[This follows from setting $α = 0$ in @eq:adiabatic-temperature-gradient so that $dT / dm = 0$.]

I aimed to accurately capture the density change of water at its phase boundaries.
My equation of state for water therefore included its phase transitions, which appear as density discontinuities in pressure--temperature space.
When calculating the adiabatic temperature profile, I enforced temperature and pressure continuity at these phase boundaries.
In practice, I did this by ensuring that the equation for the adiabatic temperature gradient, @eq:adiabatic-temperature-gradient, was finite and continuous.
This effectively split the adiabatic temperature profile into several different sections, consisting of one separate adiabat for each phase and meeting at the phase boundaries of water.
By handling each phase separately, I avoided the numerical difficulty of taking a derivative (@eq:thermal-expansion) across a density discontinuity.
I explain this procedure more in @sec:phase-structure-and-migration where I consider the phase structure of the final models.

### Model verification

Before proceeding further, I first verified these models by making mass--radius diagrams as described in the previous section and comparing them with previous works.

##### The isothermal case

I checked that my models work in the isothermal case by replicating the mass--radius relations of @Seager2007.
My models reproduce the mass--radius relations when I constructed homogeneous isothermal $300\,$K planets using the equations of state specified in their paper, as shown in [@fig:seager-mr-comparisons].
I set the surface pressure of my models to zero, following the boundary condition they used.^[The surface pressure hardly affects the results because the equations of state are for the solid phase only.]
This identical mass--radius relation verified that my integrator works correctly, and I therefore began to investigate where the differences lie upon including temperature effects.

![
  Validation of isothermal models.
  My structural models exactly reproduce previous results in the isothermal case.
  Here I show mass--radius relations for homogeneous isothermal spheres.
  If I adopt identical equations of state to those used by @Seager2007, I obtain the same result.
  This serves as a verification that my code correctly solves the structural equations.
  These models used zero surface pressure and have no temperature dependence: the equations of state are isothermal and are taken at $300\,$K.
](seager-mr-comparisons){#fig:seager-mr-comparisons}

##### The adiabatic case
I verified my adiabatic multi-layer models by comparing them with those of @Valencia2007a, who constructed similar models using the ice VII equation of state for water ([@fig:valencia-mr-comparison]).
When I set high surface pressures ($10^{10}\,$Pa) I force the surface layer of water to begin as ice VII or close to it and therefore produce a very similar mass--radius relation.
However, I predict inflated radii at lower surface pressures and therefore conclude that surface temperature and surface pressure are both important factors for determining the radius of a planet with a water layer.

![
  Validation of adiabatic models.
  My mass--radius relations reproduce those for dry planets well, and predict inflated radii for planets with water layers.
  Here I show mass--radius relations for two classes of models: dry planets ($33$% Fe and $67$% MgSiO$_3$ by mass), and wet planets ($17$% Fe, $33$% MgSiO$_3$, and $50$% water).
  I compared the mass--radius relations with the work of @Valencia2007a who constructed models with ice VII layers.
  At a surface pressure of $10^{10}\,$Pa the water layer in the wet planets is mostly ice VII and so my results are similar in this case.
  Small differences are likely due to my different equation of state choice for ice VII.
  However, at lower surface pressures, water can have an extended lower density shell that results in a larger planet than otherwise expected.
  The surface temperature in these models is $550\,$K, matching the characteristic temperature used by @Valencia2007a in their models.
](valencia-mr-comparison){#fig:valencia-mr-comparison}

There are minor differences between my mass--radius relations and the mass--radius relations presented by @Valencia2007a.
I slightly underpredict the radii of lower-mass planets in models with surface pressures of $10^{10}\,$Pa.
These differences are likely due to my choice of equation of state: I use only simple isothermal prescriptions for iron and magnesium silicate and include more phases of water than just ice VII.
I also did not include any treatment of conductive boundary layers in my models.
In general, however, my results agree well with theirs.

I also compared my results with the evolutionary models of @Lopez2012.
I was able to reproduce their mass--radius relation for Earth-like planets, and also when adding extended water layers ([@fig:lopez-mr-comparison]).
And although I can match the radius of an arbitrary planet by choosing an appropriate surface pressure, I slightly underpredict the radii of small planets compared with their results.
This may be a result of different equation of state choices or different temperature gradients during the course of their evolutionary calculations.

![
  Comparison with evolutionary models.
  Here I plot dry (Earth-like) and wet ($50$% water on an Earth-ratio core/mantle) mass--radius relations.
  Shown for comparison are models by @Lopez2012, who build on work by @Fortney2007 and @Nettelmann2011 by using a thermal evolution approach to track the entropy within each planet as it cools.
  Surface temperature significantly alters the mass--radius relation in my models.
  The surface temperature in these models is $700\,$K but the shaded band shows models with surface temperatures from $500$ to $900\,$K, a significant spread, which is caused by temperature-dependent density changes of water at lower pressures.
  I chose a surface pressure of $10^7\,$Pa to approximately match the radii of @Lopez2012.
  Their method does not begin from an explicit surface pressure, as ours does.
](lopez-mr-comparisons){#fig:lopez-mr-comparison}

@Fig:lopez-mr-comparison also provides a first indication of how changes in surface temperature can affect the mass--radius relation.
I highlight the magnitude of these differences and note that they are still significant at pressures of $10^6\,$Pa ($10\,$bar) and up, well into the pressure region where many atmospheric models terminate.
I explore the effects on our models of changing surface temperature, surface pressure and composition in the next section.


## Results

Having selected an appropriate temperature-dependent equation of state and built planetary interior structure models that included it, we are now in a position to investigate how this changes the mass--radius relationship of watery planets.
I explored the model parameter space, comparing the mass--radius relationships for these watery super-Earths across a range of surface pressures, surface temperatures and interior compositions.
In particular, I investigated the dependence on the following parameters:

1. Planet surface temperature, with the water layer temperature profile taken as
    a) isothermal, or
    b) adiabatic.
2. Planet surface pressure.
3. Planet composition, i.e. water mass fraction.


### Effect of surface temperature on isothermal and adiabatic interiors

I found that thermal expansion can lead to significant changes in the radii of water-rich super-Earths.
I constructed super-Earths in two different ways.
First I modelled them as isothermal spheres containing an Earth-like core ($33$% Fe and $67$% MgSiO$_3$) underneath a water layer of $30$% of the planet's mass.
Then I instead allowed the temperature to increase adiabatically into the water layer.

@Fig:isotherms-vs-adiabats shows that the assumption that thermal expansion effects are negligible, which was made in some previous studies, is not the case.
This is true in two senses.
First, a significant temperature dependence exists when we adopt an adiabatic interior temperature profile compared with an isothermal one.
Second, the surface temperature also affects the radius of a planet within both types of models.

![
  Dependence of watery super-Earth radii on surface temperature and internal temperature profile.
  An increased surface temperature results in an increased planetary radius.
  This effect is especially pronounced in the full adiabatic temperature treatment.
  Here I show super-Earths with an Earth-like core under a $30$% water layer by mass.
  I treated the temperature in two different ways: an isothermal treatment with a fixed constant temperature and an adiabatic treatment where I fixed the surface temperature but allowed the temperature to increase inwards according to the adiabatic relation (@eq:adiabatic-temperature-gradient).
  The adiabatic models are warmer and therefore significantly larger overall, but even the isothermal planets display some radius change due to temperature.
  The effects of this temperature dependence are comparable to current uncertainties on measured masses and radii for some of the best-characterised exoplanets.
  The surface pressure in these models is $10^7\,$Pa ($100\,$bar), and the temperature increases in steps of $100\,$K.
  The larger gap between $500$ and $600\,$K in the adiabatic case is due to a density discontinuity between the liquid and vapour phases.
](isotherms-vs-adiabats){#fig:isotherms-vs-adiabats}

The adiabatic models have a larger radius for a given mass when compared with the isothermal case.
This is to be expected: the average temperature is higher along an adiabat than an isotherm fixed at the surface temperature, and the density of water generally decreases with temperature.
The increase in radius is significant at higher surface temperatures, as shown in [@fig:isotherms-vs-adiabats].
For example, a $4\,$M$_⊕$ $30$% water planet with a $600\,$K surface has a radius of $1.68\,$R$_⊕$ if its water layer is isothermal, but $1.79\,$R$_⊕$ if it is adiabatic.
Across the super-Earth mass range I considered, the adiabatic radii increases by up to $0.11\,$R$_⊕$ when compared with the isothermal case.
The difference becomes particularly pronounced at higher surface temperatures, at which point the water layer may consist of supercritical fluid rather than liquid, solid, or vapour ([@fig:water-phases]).

A significant dependence on surface temperature also exists when using the adiabatic models.
That is, changing the surface temperature affects the radius of a model water super-Earth even when its temperature profile is already being treated as adiabatic.
In the case of a $10\,$M$_⊕$ planet, increasing the surface temperature from $300$ to $1000\,$K gave a radius increase of $0.15\,$R$_⊕$.
For an Earth-mass planet the increase was approximately $0.2\,$R$_⊕$ for the same temperature range.

I have highlighted above the change in the adiabatic models, which I claim are a more realistic representation of the actual temperature structure within the planet.
But even the isothermal models show a significant increase in radius with the planet's temperature.
For a $10\,$M$_⊕$ planet, the change in radius is $0.04\,$R$_⊕$ from $300$ to $1000\,$K.
For a $1\,$M$_⊕$ planet it is $0.1\,$R$_⊕$, nearly $10$% of the planet's radius.
Because these models are isothermal, this is due to the thermal expansion of the planet as a whole rather than of one small part of the water layer near the surface.

I do not necessarily expect an adiabatic temperature gradient throughout the whole planet because the entire interior may not all be convective.
For example, @Valencia2007a included conductive boundary layers in their models.
In that case, the true temperature-dependent behaviour of the mass--radius diagram might lie between the adiabatic and isothermal cases.
Despite this, [@fig:isotherms-vs-adiabats] shows that the surface temperature can still play an important role in determining the radius of a planet if it has a substantial water layer.
This is true even in the extreme isothermal case where there is no temperature gradient at all within the planet.

These models have a surface pressure of $10^7\,$Pa ($100\,$bar) so this effect is not due to the strong liquid--vapour transition at $1\,$bar.
In fact, we still see these effects past the critical pressure of water ($2.206×10^7\,$Pa).
The critical point, which is visible in [@fig:water-phases; @fig:eos-phase-space], is the point in temperature--pressure space beyond which there is no distinct phase transition from liquid to vapour.
This indicates that a liquid--vapour transition is not required to produce a significantly inflated radius when the water layer is heated.
I discuss the effect of pressure on these models further in the next section.

### Effect of surface pressure

The surface pressure can strongly affect the temperature-dependent thickness of the water layer ([@fig:surface-pressure-variation]).
For example, at high temperatures ($1000\,$K), increasing the surface pressure of a $30$% water and $1\,$M$_⊕$ planet from $1\,$bar to $1000\,$bar compresses the water layer significantly, decreasing the planet's radius from $1.8\,$R$_\oplus$ to $1.3\,$R$_\oplus$.
And at low pressures we see a bifurcation in the temperature--radius contours where a surface temperature increase of $100\,$K or less can inflate the radius of a watery super-Earth by more than $20$%.
This is the result of a transition across the liquid--vapour phase boundary, which exists at pressures up to the critical pressure of water ($2.206×10^7\,$Pa).
My interior structure code is most likely not the best choice for modelling such a quasi-atmospheric layer: I did not handle radiative energy transfer at this stage.
They require a more sophisticated treatment of the temperature profile than the adiabatic assumption in this chapter.
See @sec:heating-and-the-atmosphere for more detail on the behaviour of these vapour layers.

![
  Dependence of radii on surface pressure.
  The effect of temperature on the radius of watery planets decreases with increasing surface pressure, but remains significant (greater than about $0.1\,$R$_⊕$) for pressures below $1000\,$bar.
  Here I show mass--radius relations for spheres with an Earth-like core under a $30$% water layer, changing only the surface pressure each time.
  The temperature dependence remains even beyond the critical pressure of water ($2.206×10^7\,$Pa), at which point the surface water exists as a supercritical fluid.
  Only at very high pressures ($10^9$ or $10^{10}\,$Pa; $10\,000$ or $100\,000$ bar) does this temperature dependence vanish.
](surface-pressure-panels){#fig:surface-pressure-variation}

Despite observing highly inflated radii when the temperature is increased across the liquid--vapour phase boundary, we still see temperature-dependent variation in the planet's radius past the critical pressure of water.
This is because the density of water is still strongly temperature-dependent in the super-critical regime.
In fact, we might reasonably expect the same inflated radii in any situation where the pressure of the water layer places it in a region of the water phase diagram that has significant temperature dependence.
If the water layer is heated to thousands of Kelvin, this temperature dependence may only begin to disappear around $10^{10}\,$Pa ($100\,000\,$bar, [@fig:eos-contours]).
With a surface pressure of $10^8\,$Pa ($1000\,$bar), a watery super-Earth with a surface temperature of $1000\,$K still has a radius that is up to $0.1\,$R$_⊕$ larger than one with a surface temperature of $300\,$K.
This is comparable to or greater than the best current uncertainties on measured super-Earth radii ([@fig:isotherms-vs-adiabats]), and indicates that the surface temperature is a key parameter to consider when one attempts to model planets with significant water mass.

### Effect of water content

I find that changing the water content affects the temperature-dependent behaviour discussed in earlier sections ([@fig:composition-variation]).
I constructed planets with water, silicate, and iron layers, fixing the silicate:iron mass ratio to the Earth value of 2:1 and allowing the water shell to vary in mass.
These models correspond to an Earth-like nucleus with an extended water layer at the surface.

The effects of surface temperature on radius vary in magnitude across all my models with water layers, but still exist even when I set the water layer mass to just $1$% of the mass of the entire planet.
For a $1\,$M$_⊕$ super-Earth with a surface pressure of $10^7\,$Pa ($100\,$bar), the radial change when the surface temperature increases from $300$ to $1000\,$K is $0.3\,$R$_⊕$ (for a $50$% water planet) and $0.1\,$R$_⊕$ (for a $1$% water planet).
This similarity holds across the entire range of planetary masses I considered.

![
  Dependence of radii on water mass fraction.
  Even low-mass water layers result in planets that are strongly affected by temperature changes, especially when water on the surface is hot enough to be in the vapour or supercritical phase.
  Here I show mass--radius relations for multi-layer planets: an iron core with silicate and (in all but the first panel) water layers.
  I show the Earth-like iron-silicate core in each panel for comparison.
  All the watery planets are larger than the dry case owing to the lower density of water.
  Surface temperature variation affects the radius of a watery planet by a different amount in each case, and it can nearly double the radius for low-mass planets.
  Because the iron and silicate layers are isothermal, this variation is due solely to temperature effects in the water layer.
  I fixed the silicate:iron mass ratio at $2$:$1$ and set the surface pressure to $10^7\,$Pa ($100\,$bar).
  The temperature contours are in steps of $100\,$K from $300$--$1000\,$K.
](water-fraction-panels){#fig:composition-variation}

## Discussion

In this chapter I have presented planetary interior structure models of water-rich super-Earths.
The models incorporate a temperature-dependent water equation of state and use an adiabatic treatment for the temperature gradient.
I directly calculated the thermal expansion coefficient $α$ from the equation of state, rather than treating it as a constant, and I used a variable heat capacity based on experimental data.
My conclusions are as follows.

First, when one models a solid planet, adding a water layer comes with a substantial thermal dependence.
By this I mean that the temperature of the planet may substantially alter the radius of the planet as the water layer expands and contracts.
Previous studies have shown that including a temperature gradient in Earth-like planets produces a minimal change in its radius.^[@Howe2014; @Grasset2009; @Seager2007]
I showed that this assumption no longer holds once large water layers are considered, even setting aside the unrealistic case of a $100$% water planet.
For example, consider the case of a $2\,$M$_⊕$ planet with an Earth-like core underneath a water layer of $5$% of the planet's total mass.
If the surface pressure is $10^7\,$Pa ($100\,$bar), the difference in the planet's radius when the surface is heated from $300\,$K to $1000\,$K is approximately $0.3\,$R$_⊕$ ([@fig:composition-variation]).
This effect is on top of any thermal expansion of iron and silicate: my models treated the rocky layers as isothermal.
It is also in addition to any uncertainty in the equation of state itself.
Such changes in radii are significant considering that current observations can already measure super-Earth radii to precisions better than $0.1\,$R$_⊕$ (e.g. [@fig:isotherms-vs-adiabats]).

The strength of the planet radius--temperature relation also depends on the surface pressure.
This is a result of the decreasing thermal expansion of water with pressure: the coefficient of thermal expansion is much smaller in high-pressure ice than in the liquid, vapour, or supercritical fluid phases.
At pressures of more than about $10^{10}\,$Pa ($100\,000\,$bar) any temperature change becomes irrelevant: the uncertainty in current planetary radius measurements is larger than any conceivable radial change owing to temperature effects, so more precise structural models may not be useful.
However, there is still a significant radial dependence on temperature at lower surface pressures.
At $10^8\,$Pa ($1000\,$bar), a watery super-Earth with a surface temperature of $1000\,$K can be up to $0.1\,$R$_⊕$ larger than one with a surface temperature of $300\,$K.
It is therefore important to include temperature effects in the interior models if an accurate radius is required as part of the model.

This pressure dependence manifests itself most strongly below the critical point of water.
At pressures below this critical pressure, a phase transition still exists between liquid and vapour.
There is therefore a bifurcation in the mass--radius diagram: a small increase in surface temperature causes a larger change in radius as the surface water vaporises.
This is visible as a gap in the contours in [@fig:surface-pressure-variation;@fig:composition-variation].
I caution that it is likely not appropriate to attempt to treat such vapour layers using the approach in this chapter, which is intended for interior structures.^[The next chapter will treat the atmosphere of the planet.]
However, a lesser version of this effect is still visible at higher pressures.

I therefore conclude that, in some cases, planetary heating may alter the interpretation of a planet's radius if a water layer is part of the model.
This is especially true if the planet consists entirely of water, but this is an unlikely physical scenario.
More importantly, the result is still significant even if the surface of the water layer is at moderately high pressures and lies underneath a heavy atmosphere.
All that is required for the water layer's density to change significantly from the isothermal case is for a temperature increase of a few hundred Kelvin.
Moreover, even isothermal watery planets have some degree of radial temperature dependence: up to $0.3\,$R$_⊕$ across the mass range of super-Earths and in the temperature range of $300$ to $1000\,$K.

The temperature dependence is also important to take into account in approaches such as that of @Kipping2013 or @Madhusudhan2015, where a watery interior model is used to place a lower bound on the atmospheric height of an observed planet.
I have shown that the radius of an adiabatic watery planet may be significantly higher than the zero-temperature or isothermal case.
Incorporating a surface temperature estimate into this approach should therefore give better constraints.

From an observational perspective, these results are most interesting at intermediate pressures.
At low pressures ($10^5\,$Pa or $1\,$bar) we cannot yet claim that we accurately capture the behaviour of what is now essentially an atmosphere, because we include no prescription for radiative energy transport in our models.
At high pressures ($10^{10}\,$Pa or $100\,000\,$bar) any temperature dependence in the water equation of state disappears.
The physical scenario most relevant for these models is therefore that of a water layer (ocean, ice or supercritical fluid) underneath a thin or moderate atmosphere.
Others have already included volatile layers on top of interior structure models.^[@Rogers2010a]
Adding more complete temperature dependence to the interior portion of these planetary models is a worthwhile future direction if we wish to treat them as water-rich.

I have included no atmospheric layers in these models.
Other studies have provided more complete treatments of atmospheric layers.
For example, @Rogers2010a included a gas layer on top of an isothermal interior structure model in order to interpret the structure of the planet GJ 1214b.
And @Valencia2013 used internal structure models coupled with an atmospheric layer, exploring the dependence of radii on various model parameters including equilibrium temperature and water content.
Given that we set the surface pressure to between $10^5$ and $10^{10}\,$Pa ($1$ and $100\,000\,$bar), these models must therefore represent the layers interior to an atmosphere of some sort.
In the next chapter, I consider how an atmosphere changes these models and ask: how can we link this to the heating of the planet?
