# Amendments to "Internal and atmospheric structures of heated watery super-Earths"
## Scott Thomas

I have addressed the request for amendments by making the following changes to the dissertation.

1) A discussion of solar system icy bodies should be added to the introduction.

TODO

2) The explanation of interpolation across the boundaries between tables used in the equation of state must include a figure showing discontinuities in heat capacity and a discussion thereof.

TODO

3) The assumption of adiabatic internal structure must be justified early on because the models all depend on it. It should be demonstrated that neither radiation nor conduction could transport heat given an adiabatic temperature gradient so that convection is necessary. Whether convection might be inhibited by composition gradients or viscosity effects should be investigated.

I have included a new section in chapter 3 where I justify this assumption. By using some representative values for ice VII viscosity and conductivity, I show that convection is convincingly dominant over conduction in the super-Earth waterworlds under consideration. I also show that the viscosity of ice would have to be at least five orders of magnitude higher to suppress convection.

As for compositional effects, I had already discussed how impurities in water could affect the equation of state and therefore the models, but I stopped short of quantifying this effect because it would require gathering more equation of state data. I have included further consideration of compositional effects by mentioning how the compositional transition points within a waterworld may manifest as conductive boundary layers, possibly breaking the adiabatic assumption around those regions. As for other compositional effects that could arise if the assumption of purity is broken, such as light materials freezing out near the core and then rising, it is my understanding that these effects within the Earth serve to promote convection and not suppress it (see for example the discussion by Jones at <http://www1.maths.leeds.ac.uk/~cajones/papers/treatise.pdf>, which notes that such effects transport as much energy as thermal convection in the Earth).

Though I took the approach of using a representative example to show that conduction is almost certainly suppressed, it's not appropriate to do this for radiative transfer. This is because we do indeed expect that the planetary models switch from conductive to radiative heat transfer at the atmosphere--interior boundary: that's what chapter 4 of the dissertation is about. Fortunately, you will see that in response to point #5 I updated my models in that chapter to make this switch at the physically appropriate point. That is, a radiative temperature gradient is now used when appropriate in that chapter; therefore other regions are convective by definition. But for completeness I have also included a comparison to the Earth, where radiation within the solid/liquid interior is known to transmit a negligible amount of energy. This helps to justify the adiabatic assumption for the models in chapter 3, which include no atmosphere.

4) The assumptions made in the treatment, specifically of latent heat, of phase boundaries must be described in detail. A critical discussion of whether these assumptions are always reasonable and the physical motivation for the treatment of phase transitions in section 5.1.1 must be included.

TODO

5) In chapter 4 there are physical problems with the matching of a radiative atmosphere to an adiabatic interior. Instead of the arbitrary transition at a pressure of $100\,$bar the temperature gradients should be matched. A figure or figures demonstrating this must be included.

In order to accommodate this request, I needed to make significant changes to the differential equation solver. In particular I needed to add *event handling*. In the context of differential equation solvers, event handling refers to the ability to cause arbitrary changes in the system at specified points---in this case, to change the temperature gradient from a radiative one at the surface of the atmosphere to a convective one deeper within the atmosphere---and to do so when the radiative and convective temperature gradients match. This is more difficult than changing between different equations of state (for example at the water--silicate boundary) as the location of the match is not known *a priori*.

To accomplish this, I re-wrote the differential equation solver. The way it functions is broadly similar---it still uses the shooting method that I described in my thesis---but "under the hood" I have switched it to a sophisticated differential equation solving framework called DifferentialEquations.jl. This rewrite allowed me to make the desired change more easily and brought several other benefits such as:

- Adaptive stepping. The size of the mass step is now chosen automatically to give a bounded error in the final solution, rather than being pre-specified. This means that the atmospheric layers are constructed on a grid that is fine enough in mass to resolve large changes in radius, even when the pressure is changing rapidly. This allowed me to eliminate the dependence of the final radius on the mass grid size, which was an unpleasant numerical error in my original work (originally section 3.2.5 of the thesis).
- The integrator now uses a 5/4 Runge-Kutta method due to Tsitouras (2011), rather than the common RK4 method that I implemented at first. The new method comes with a free 4th-order interpolant which is useful for giving numerically precise results in the event handling mentioned above, as well as speeding up the integration scheme by requiring fewer points.
- A more flexible structure: equations of state can be easily changed; energy transport in the water layer can be forced to be radiative or convective if desired; and the solutions can be visualised more easily.

Having made these changes to the code, I updated chapters 3--5 accordingly:

- I regenerated the figures in chapter 3 using the new solver. Because this chapter dealt with the portion of a planet below the atmosphere, there were only minor changes to the figures with no changes to the chapter's conclusions. I updated their captions and the accompanying text to reflect this.
- I removed section 3.2.5 describing how the mass grid size affects the final radius. This discussion was intended to show how I had detected and resolved the numerical error that appears when the mass points are too widely spaced. With the change to an adaptive stepping method, this is no longer necessary.
- I altered section 4.1.6 to describe how matching the radiative and convective temperature gradients allows us to switch between the atmosphere and interior at an appropriate point. Though I used this scheme for the rest of the work, I also kept section 4.3.1 that describes how the total radius is affected if we choose to fix this boundary at a given pressure. This section serves as a sensitivity analysis and shows that the actual depth of the transition has little effect on the bulk radius, suggesting that the results are robust to changes in the transition pressure.

Your initial criticism also indicated that the pressure range shown in figures 4.10 and 4.11 was misleading, as the maximum pressure shown ($100\,$bar) was also the pressure at which I chose to force a transition between atmosphere and interior structure. You argued that this range conveniently avoided showing any discontinuity in the temperature gradient that might exist because of this arbitrary boundary at $100\,$bar. To satisfy the requirement of demonstrating the matching of the temperature gradient, I therefore extended the range of pressures shown in these figures. It can be seen in the updated figures that the temperature profile is smooth now that the boundary between atmosphere and interior is no longer pre-assumed to lie at a given pressure of $100\,$bar. This demonstrates the convective--radiative boundary matching discussed in point #4: the planets now have a convective interior and radiative atmosphere.

6) Parentheses in equation (4.15) are misplaced. Check whether or not the formula is correct in any numerical codes and rerun as necessary.

The parentheses were misplaced only in the printed equation and I have corrected it accordingly.

7) The effects of a larger internal energy generation rate are interesting. Construct and include such models.

I increased the maximum internal energy generation rate to $10^{-8}\,$W$\cdot$kg$^{-1}$, $1000\times$ that of the Earth. See for example the updated figures in chapter 4 and 5. The previously observed trend, where low-mass planets become inflated as they are unable to hold onto a watery layer that has become a superheated gaseous atmosphere, continues to hold.

I was not able to create consistent models of 1$\,$M$_\oplus$ planets with this higher degree of internal heating, for example in the first full-page panel figure in Chapter 5. The planets produced by my ODE solver in this regime suffered from runaway atmospheric growth and failed to converge. By this I mean that a) the solver reached the $r=0$ point before $m=0$ i.e. it produced an invalid solution to the system of ODEs with the specified boundary conditions and b) this convergence failure could not be resolved by increasing the planet's radius further, as we would normally do when the internal boundary condition of a trial solution did not match.

I believe that this failure to converge is a result of incomplete heat capacity and/or opacity data in the very low-pressure fringes of the atmosphere. Resolving this issue would require gathering more data on the heat capacity and opacity of water that I do not have access to, so further work here is out of the scope of this dissertation.

Because I agree with you that it is interesting to construct and include higher-energy models, and because 3$\,$M$_\oplus$ and larger planets had no issues, I have chosen to leave this higher degree of internal heating in place. I have therefore added text to chapter 5 about the caveat above, indicating that the results for the 1$\,$M$_\oplus$ case are only valid for internal heating coefficients $\varepsilon < 10^{-8}\,$W$\cdot$kg$^{-1}$. I am happy with the rest of the results, as the numerical solver converged correctly in all other cases.

8) A more precise description of figure 4.9 is required, along with a precise definition of effective temperature when irradiation is included.

My use of "effective temperature" in this section was a little confusing. The phrase indicates a temperature calculated from the total amount of radiation emitted by an object if the object is assumed to emit as a black body. My understanding is that this definition is equally appropriate for objects that are internally or externally heated, but you are correct to observe that the term would need to be more precisely defined if the object were to be heated *both* internally and externally.

However, the point of this section and figure was to compare how a change in heating mechanism affects the size of a planet, and to use the effective (black-body) temperature as a way to compare an equivalent amount of heating when the mechanism is changed. For this reason, I never actually constructed planets with mixed heating as described above. Instead I constructed planets with *either* internal heating *or* irradiation, then compared their sizes.

I therefore believe there is no problem with the phrase as I have used it. Any confusion probably arises because I use it twice, once to refer to the black-body temperature of a planet where the energy is generated internally and the second time to refer to the black-body temperature of a planet where the energy is generated externally, absorbed by the planet, and re-radiated. To make this clearer, I replaced uses of the phrase "effective temperature" with "black-body temperature". I also updated the section text and figure caption to better explain how I used the black-body temperature as a link to allow us to compare the relative effects of internal and external heating.
