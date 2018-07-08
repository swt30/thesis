# Internal and atmospheric structures of heated watery super-Earths
## Scott Thomas

I have addressed the request for corrections by making the following changes to the dissertation.

1) A discussion of solar system icy bodies should be added to the introduction.

TODO

2) The explanation of interpolation across the boundaries between tables used in the equation of state must include a figure showing discontinuities in heat capacity and a discussion thereof.

TODO

3) The assumption of adiabatic internal structure must be justified early on because the models all depend on it. It should be demonstrated that neither radiation nor conduction could transport heat given an adiabatic temperature gradient so that convection is necessary. Whether convection might be inhibited by composition gradients or viscosity effects should be investigated.

TODO

4) The assumptions made in the treatment, specifically of latent heat, of phase boundaries must be described in detail. A critical discussion of whether these assumptions are always reasonable and the physical motivation for the treatment of phase transitions in section 5.1.1 must be included.

TODO

5) In chapter 4 there are physical problems with the matching of a radiative atmosphere to an adiabatic interior. Instead of the arbitrary transition at a pressure of $100\,$bar the temperature gradients should be matched. A figure or figures demonstrating this must be included.

In order to accommodate this request, I needed to make significant changes to the differential equation solver. In particular I needed to add *event handling*. In the context of differential equation solvers, event handling refers to the ability to cause arbitrary changes in the system at specified points---in this case, to change the temperature gradient from a radiative one at the surface of the atmosphere to a convective one deeper within the atmosphere---and to do so when the radiative and convective temperature gradients match.

To accomplish this, I re-wrote the differential equation solver. The way it functions is broadly similar---it still uses the shooting method that I described in my thesis---but "under the hood" I have switched it to a sophisticated differential equation solving framework called DifferentialEquations.jl. This rewrite allowed me to make the desired change more easily and brought several other benefits such as:

- Adaptive stepping. The size of the mass step is now chosen automatically to give a bounded error in the final solution, rather than being pre-specified. This means that the atmospheric layers are constructed on a grid that is fine enough in mass to resolve large changes in radius, even when the pressure is changing rapidly. This allowed me to eliminate the dependence of the final radius on the mass grid size, which was an unpleasant numerical error in my original work (originally section 3.2.5 of the thesis).
- The integrator now uses a 5/4 Runge-Kutta method due to Tsitouras (2011), rather than the common RK4 method that I implemented at first. The new method comes with a free 4th-order interpolant which is useful for giving numerically precise results in the event handling mentioned above, as well as speeding up the integration scheme by requiring fewer points.
- A more flexible structure: equations of state can be easily changed; energy transport in the water layer can be forced to be radiative or convective if desired; and the solutions can be visualised more easily.

Having made these changes to the code, I updated chapters 3--5 accordingly:

- I regenerated the figures in chapter 3 using the new solver. Because this chapter dealt with the portion of a planet below the atmosphere, there were only minor changes to the figures with no changes to the chapter's conclusions. I updated their captions and the accompanying text to reflect this.
- I removed section 3.2.5 describing how the mass grid size affects the final radius. This discussion was intended to show how I had detected and resolved the numerical error that appears when the mass points are too widely spaced. With the change to an adaptive stepping method, this is no longer necessary.
- I altered section 4.1.6 to describe how matching the radiative and convective temperature gradients allows us to switch between the atmosphere and interior at an appropriate point. Though I used this scheme for the rest of the work, I also kept section 4.3.1 that describes how the total radius is affected if we choose to fix this boundary at a given pressure. This section serves as a sensitivity analysis and shows that the actual depth of the transition has little effect on the bulk radius, suggesting that the results are robust to changes in the transition pressure.

Your initial criticism also indicated that the pressure range shown in figures 4.10 and 4.11 was misleading, as the maximum pressure shown ($100\,$bar) was also the pressure at which I chose to force a transition between atmosphere and interior structure. You argued that this range conveniently avoided showing any discontinuity in the temperature gradient that might exist because of this arbitrary boundary at $100\,$bar. To satisfy the requirement of demonstrating the matching of the temperature gradient, I therefore extended the range of pressures shown in these figures. It can be seen in the updated figures that the temperature profile is smooth and that the boundary between atmosphere and interior is no longer pre-assumed to lie at a given pressure of $100\,$bar.

6) Parentheses in equation (4.15) are misplaced. Check whether or not the formula is correct in any numerical codes and rerun as necessary.

The parentheses were misplaced only in the printed equation and did not affect any numerical code. I have corrected the printed equation accordingly.

7) The effects of a larger internal energy generation rate are interesting. Construct and include such models.

I increased the maximum internal energy generation rate to $10^{-8}\,$W/kg, $1000\times$ that of the Earth. See for example the updated figures in chapter 4. The previously observed trend, where low-mass planets become inflated as they are unable to hold onto a watery layer that has become a superheated gaseous atmosphere, continues to hold.

8) A more precise description of figure 4.9 is required, along with a precise definition of effective temperature when irradiation is included.

My use of "effective temperature" in this section was a little confusing. This phrase is used to indicate a temperature calculated from the amount of radiation emitted by an object if the object is assumed to emit as a black body. My understanding is that this definition is equally appropriate for objects that are internally or externally heated, but you are correct to observe that the term would need to be more precisely defined if the object were to be heated both internally and externally.

However, the point of this section and figure was to compare how a change in heating mechanism affects the size of a planet, and to use the effective (black body) temperature as a way to compare an equivalent amount of heating when the mechanism is changed. For this reason, I never actually constructed planets with mixed heating as described above. Instead I constructed planets with *either* internal heating *or* irradiation, then compared their sizes.

I therefore believe there is no problem with the phrase as I have used it. Any confusion probably arises because I use it twice, once to refer to the black-body temperature of a planet where the energy is generated internally and the second time to refer to the black-body temperature of a planet where the energy is generated externally, absorbed by the planet, and re-radiated. To make this clearer, I replaced uses of the phrase "effective temperature" with "black-body temperature". I also updated the section text and figure caption to better explain how I used the black-body temperature as a link to allow us to compare the relative effects of internal and external heating.
