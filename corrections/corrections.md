# Amendments to "Internal and atmospheric structures of heated watery super-Earths"
## Scott Thomas

I have addressed the request for amendments by making the following changes to the dissertation. Here are my point-by-point responses to the corrections, followed by a list of changes with page references.

1)  *A discussion of solar system icy bodies should be added to the introduction.*

    I have inserted a new section 1.3.3 (**p32**) that discusses the literature on internal structure models of icy bodies in our solar system. This is a broad and deep topic, so I kept the review focused on those aspects that I thought were most relevant to the rest of this dissertation. I discussed the following points:

    - How our solar system shows us that it is possible to form bodies rich in water, and the observed diversity in these icy solar system bodies
    - Why the thermal properties of water were, and continue to be, important when studying them---for example, how it permits subsurface oceans to exist under a frozen surface, and what happens if other material like ammonia or salts are also present
    - How observations tell us that many of these objects do indeed harbour subsurface oceans, and what this tells us about their internal heating


2)  *The explanation of interpolation across the boundaries between tables used in the equation of state must include a figure showing discontinuities in heat capacity and a discussion thereof.*

    This figure was already included in the dissertation (Figure 2.9). In this figure I showed slices through the pressure--volume--temperature surface of water heat capacity in the liquid/vapour region, which is where the heat capacity differences of water are at their greatest. I have extended section 2.2.5 to include some discussion of the discontinuities shown in that figure (**p52--53**). I have also inserted a reference to this section in the later discussion of phase boundaries (section 5.1.2, where I discuss my treatment of the adiabat, **p115**). This is so I can contrast my treatment of the volumetric expansion coefficient with my treatment of the heat capacity. The former needs special treatment because it is itself a derivative of a discontinuous quantity, while the latter is a tabulated value and can be used directly.


3)  *The assumption of adiabatic internal structure must be justified early on because the models all depend on it. It should be demonstrated that neither radiation nor conduction could transport heat given an adiabatic temperature gradient so that convection is necessary. Whether convection might be inhibited by composition gradients or viscosity effects should be investigated.*

    I have included a new section in chapter 3 where I justify this assumption (**p61--63**). By using some representative values for ice VII viscosity and conductivity, I show that convection is convincingly dominant over conduction in the super-Earth waterworlds under consideration. I also show that the viscosity of ice would have to be at least five orders of magnitude higher to suppress convection, which is unlikely to be the case in a large heated planet.

    I used a representative example to show that conduction is almost certainly dominated by convection, but it's not appropriate to do the same for radiation. This is because we do indeed expect that the planetary models switch from conductive to radiative heat transfer at the atmosphere--interior boundary: that's what chapter 4 of the dissertation is about! But you will see that, in response to your point #5, I have updated my models in that chapter to make this switch at the physically appropriate point (**p89**). That is, a radiative temperature gradient is now used when appropriate in that chapter; therefore (when conduction is excluded as above) other regions are convective by definition. For completeness I have also included a comparison to the Earth, where radiation within the solid/liquid interior is known to transmit a negligible amount of energy. This helps to justify the adiabatic assumption for the models in chapter 3, which include no atmosphere.

    As for compositional effects, I have discussed elsewhere in the dissertation how impurities in water could affect the equation of state and therefore the models. But I stopped short of quantifying this effect because it would require gathering more equation of state data. Instead, I have included further consideration of compositional effects by discussing how the compositional transition points within a waterworld may manifest as conductive boundary layers (**p63**), possibly breaking the adiabatic assumption around those regions. As for other compositional effects that could arise if the assumption of purity is broken, such as light materials freezing out near the core and then rising, it is my understanding that these effects serve to promote convection and not suppress it. See for example the discussion by Jones at <http://www1.maths.leeds.ac.uk/~cajones/papers/treatise.pdf>, which also notes that such effects transport as much energy as thermal convection in the Earth.


4)  *The assumptions made in the treatment, specifically of latent heat, of phase boundaries must be described in detail. A critical discussion of whether these assumptions are always reasonable and the physical motivation for the treatment of phase transitions in section 5.1.1 must be included.*

    After reviewing literature on phase transitions, I am satisfied in saying that the assumptions I made when constructing adiabats are equivalent to the assumption of no latent heat of phase transition. I have written an extensive discussion of this in chapter 5 (**p111--116**). It includes the following:

    - An explicit acknowledgement that the way in which I have constructed the adiabat is equivalent to ignoring latent heat.
    - A discussion of the changes that occur in an adiabat that crosses a phase boundary.
    - A more complete description of the problem originally described in section 5.1.1, separating the concern into two parts: a numerical issue produced by the discretisation of the phase space when constructing the EOS, and the physical issue of the latent heat itself.
    - An explanation of why this second part cannot be resolved from my equation of state alone and instead requires a separate source of data, either the latent heat of transition itself or the specific entropy.
    - As physical justification for ignoring the latent heat when constructing the adiabat, reference to sources which show that the entropy change across the high-pressure ice boundaries in question are minimal.
    - Further discussion of the situations where the assumption of no latent heat would no longer be reasonable.

    I also added a sidenote in chapter 3 (**p63**) about exothermic and endothermic phase changes and their effects on convection, which supports my choice of the adiabatic temperature profile.

    I had hoped to be able to provide a more complete treatment by using actual measurements of entropy or latent heat, but this information is not yet available for the range of pressures and temperatures I consider in my EOS. I had actually discussed this problem with Stephane Mazevet at a conference in 2016---he had indicated that he was also working on an improved water equation of state that included entropy in different water phases. The preprint for this work was just published in October 2018^[Mazevet et al 2018, arXiv 1810.05658] but, upon reading it, I see that Mazevet *et al.* still do not treat entropic differences *between* phases. Instead they make an assumption equivalent to mine, that of no latent heat of phase transition. I therefore have to put this down as one for future work: the information that would allow us to account for entropic differences between phases is not yet present and so my hand is forced and I must treat them as nonexistent. And although this is a little unsatisfying, my justification in the text explains that it is at least a reasonable assumption for our purposes.


5)  *In chapter 4 there are physical problems with the matching of a radiative atmosphere to an adiabatic interior. Instead of the arbitrary transition at a pressure of $100\,$bar the temperature gradients should be matched. A figure or figures demonstrating this must be included.*

    In order to accommodate this request, I needed to make significant changes to the differential equation solver. In particular I needed to add *event handling*. In the context of differential equation solvers, event handling refers to the ability to cause arbitrary changes in the system at specified points---in this case, to change the temperature gradient from a radiative one at the surface of the atmosphere to a convective one deeper within the atmosphere---and to do so when the radiative and convective temperature gradients match. This is more difficult than changing between different equations of state (for example at the water--silicate boundary) as the location of the match is not known *a priori*.

    To accomplish this, I re-wrote the differential equation solver. The way it functions is broadly similar---it still uses the shooting method originally described in my dissertation---but "under the hood" I have switched it to a sophisticated differential equation solving framework called DifferentialEquations.jl. This rewrite allowed me to make the desired change more easily and brought several other benefits such as:

    - Adaptive stepping. The size of the mass step is now chosen automatically to give a bounded error in the final solution, rather than being pre-specified. This means that the atmospheric layers are constructed on a grid that is fine enough in mass to resolve large changes in radius, even when the pressure is changing rapidly. This allowed me to eliminate the dependence of the final radius on the mass grid size, which was an unpleasant numerical error in my original work (originally section 3.2.5 of the dissertation).
    - The integrator now uses a 5/4 Runge-Kutta method^[Tsitouras C, 2011, Comp Math Appl 62, 2, 770-775], rather than the common RK4 method that I implemented at first. The new method comes with a free 4th-order interpolant which is useful for giving numerically precise results in the event handling mentioned above, as well as speeding up the integration scheme by requiring fewer points.
    - A more flexible structure: equations of state can be easily changed; energy transport in the water layer can be forced to be radiative or convective if desired; and the solutions can be visualised more easily.

    Having made these changes to the code, I updated chapters 3--5 accordingly:

    - I regenerated the figures in chapter 3 using the new solver. Because this chapter dealt with the portion of a planet below the atmosphere, there were only minor changes to the figures with no changes to the chapter's conclusions. I updated their captions and the accompanying text to reflect this.
    - I removed the previous section 3.2.5 describing how the mass grid size affects the final radius. This discussion was intended to show how I had detected and resolved the numerical error that appears when the mass points are too widely spaced. With the change to an adaptive stepping method, this is no longer necessary because the dependency on grid size no longer exists.
    - I altered section 4.1.6 to describe how matching the radiative and convective temperature gradients allows us to switch between the atmosphere and interior at an appropriate point (**p89**). Though I used this scheme for the rest of the work, I also kept section 4.3.1 that describes how the total radius is hardly affected if we choose to fix this boundary at a given pressure. This section serves as a sensitivity analysis and shows that the actual depth of the transition has little effect on the bulk radius, suggesting that the results are robust to changes in the transition pressure.
    - I updated figures throughout chapters 4 and 5 and updated the text to match where appropriate. The conclusions were unchanged except in two places:
        - Originally figure 5.8 had shown a discontinuity in planetary radius for the coldest set of models -- I was unable to reproduce this and so removed discussion of it.
        - The planetary radius in the new models was more sensitive to internal heating than to irradiation, suggesting that I was not resolving the outer atmosphere correctly before when the planet was externally heated. I updated text and figure captions accordingly (e.g. caption of figure 5.8 on p126; third bullet point on p106).

    Your initial criticism also indicated that the pressure range shown in figures 4.10 and 4.11 was misleading, as the maximum pressure shown ($100\,$bar) was also the pressure at which I chose to force a transition between atmosphere and interior structure. You argued that this range conveniently avoided showing any discontinuity in the temperature gradient that might exist because of this arbitrary boundary at $100\,$bar. To satisfy the requirement of demonstrating the matching of the temperature gradient, I therefore extended the range of pressures shown in these figures (**p103--104**). It can be seen in the updated figures that the temperature profile is smooth and that the boundary between atmosphere and interior is no longer pre-assumed to lie at a given pressure of $100\,$bar. This demonstrates the convective--radiative boundary matching discussed in point #4: the planets now have a convective interior and radiative atmosphere.


6)  *Parentheses in equation (4.15) are misplaced. Check whether or not the formula is correct in any numerical codes and rerun as necessary.*

    The parentheses were misplaced only in the printed equation and I have corrected it accordingly (**p90**).


7)  *The effects of a larger internal energy generation rate are interesting. Construct and include such models.*

    I increased the maximum internal energy generation rate to $10^{-8}\,$W$\cdot$kg$^{-1}$, $1000\times$ that of the Earth. See for example the updated figures in chapter 4 and 5. The previously observed trend, where low-mass planets become inflated as they are unable to hold onto a watery layer that has become a superheated gaseous atmosphere, continues to hold.

    I was not able to create consistent models of 1$\,$M$_\oplus$ planets with this higher degree of internal heating, for example in the first full-page panel figure in Chapter 5. The planets produced by my ODE solver in this regime suffered from runaway atmospheric growth and failed to converge. By this I mean that a) the solver reached the $r=0$ point before $m=0$ i.e. it produced an invalid solution to the system of ODEs with the specified boundary conditions and b) this convergence failure could not be resolved by increasing the planet's radius further, as we would normally do when the internal boundary condition of a trial solution did not match.

    I believe that this failure to converge is a result of incomplete heat capacity and/or opacity data in the very low-pressure fringes of the atmosphere. Resolving this issue would require gathering more data on the heat capacity and opacity of water vapour that I do not have access to, so further work here is out of the scope of this dissertation.

    Because I agree with you that it is interesting to construct and include higher-energy models, and because 3$\,$M$_\oplus$ and larger planets had no issues, I have chosen to leave this higher degree of internal heating in place. I have therefore added text to chapter 5 about the caveat above (**p121**), indicating that the results for the 1$\,$M$_\oplus$ case are only valid for internal heating coefficients $\varepsilon < 10^{-8}\,$W$\cdot$kg$^{-1}$. I am happy with the rest of the results, as the numerical solver converged correctly in all other cases.


8)  *A more precise description of figure 4.9 is required, along with a precise definition of effective temperature when irradiation is included.*

    My use of "effective temperature" in this section was confusing. The phrase indicates a temperature calculated from the total amount of radiation emitted by an object if the object is assumed to emit as a black body. My understanding is that this definition is equally appropriate for objects that are internally or externally heated, but you are correct to observe that the term would need to be more precisely defined if the object were to be heated *both* internally and externally.

    However, the point of this section and figure 4.9 was to compare how a change in heating mechanism affects the size of a planet. I use the effective (black-body) temperature as a way to compare an equivalent amount of heating when the mechanism is changed. For this reason, I never actually constructed planets with mixed heating as described above. Instead I constructed planets with *either* internal heating *or* irradiation, then compared their sizes. This is what is shown in figure 4.9.

    I therefore believe there is no problem with the phrase as I have used it. Any confusion probably arises because I use it twice, once to refer to the black-body temperature of a planet where energy is generated internally and the second time to refer to the black-body temperature of a planet where energy is generated externally, absorbed by the planet, and re-radiated. To make this clearer, I replaced uses of the phrase "effective temperature" with "black-body temperature". I also updated the section text and figure caption to better explain how I used the black-body temperature as a link to allow us to compare the relative effects of internal and external heating.

## List of changes

Substantive changes to the dissertation are listed here. I also corrected typos and grammatical errors where I found them and reformatted some figures without changing their content. Figures whose content was altered are included in this list where appropriate. Page, figure and section numbers refer to the updated dissertation except where noted. Key pages where changes were made in response to the points above are listed in **bold**.

- **p32**: Added section 1.3.3, discussion of cold icy satellites in our solar system. Figure 1.13 was added as part of this section.
- p35: Altered first paragraph of section 1.4 to mention the discussion added above.
- p35: Added a new key research question (point 1) about the water equation of state, as this is an important part of my dissertation.
- p36 and elsewhere throughout the dissertation: Changed name of my code to ONION, as it was altered during the rewrite process.
- **p52--53**: Added paragraph beginning "As well as the discontinuities..." to discuss discontinuities shown in the heat capacity figure immediately above.
- **p61--63**: Added text beginning "Is the assumption of an adiabatic temperature gradient appropriate?" and continuing through to the end of page 63, showing that convective energy transport dominates over conduction and radiation.
- p65: Updated paragraph before "A boundary value solver in Julia" to provide citation for the new differential equation software I built my solver on.
- p66: In the first paragraph of 3.2.3, added citation for the modified Runge--Kutta method used in the differential equation solver.
- p68: Removed "4" from "RK4 integration" as I no longer use the RK4 method.
- p69: Removed the section previously numbered 3.2.5 about how changing the fixed grid size affected the final radius and how I chose a logarithmically-spaced grid to resolve the outer layers appropriately. This is now handled automatically by the solver.
- p70,71,73,75,76: Regenerated figures based on updated planetary modelling code. The figures in this chapter did not change much and the conclusions were unaltered.
- p76: Updated numbers in paragraph beginning "The effects of surface temperature..." to match recalculated figures.
- p89: Deleted paragraph before section 4.1.6 that discussed the mass grid size (see p69 above).
- **p89**: Updated first paragraph of section 4.1.6 to describe how my new modelling code switches from a radiative to a convective temperature profile when the gradients match, and defining the transition pressure as the pressure at this depth rather than a fixed pressure of 100$\,$bar like before.
- **p90**: Fixed parentheses in equation (4.15).
- p91: Rewrote section 4.2.2 to describe more clearly what the "isothermal fixed-height atmosphere" model is and how it differs from the full treatment described above.
- **p94** and throughout the chapter: Replaced uses of the phrase "effective temperature" with "black-body temperature". Clarified that equation (4.21) is the black-body temperature of a planet heated solely from the inside as determined from its surface flux.
- p96: Updated numbers in text in first two paragraphs of "Opacity and opacity ratio" section to match figures.
- p97--105: Regenerated all figures in this chapter based on updated planetary modelling code.
- p98: Rewrote the "Pressure at the radiative--convective boundary" section to indicate that it now serves as a sensitivity analysis on the position of this boundary.
- **p100-102**: Tidied up the text in section 4.3.2 to better explain how I compare the relative inflation of internally and externally heated planets. Replaced "effective temperature" with "black body temperature" where appropriate. Rewrote the caption and legend of figure 4.9 to more precisely describe where black body, irradiation, and radiative--convective boundary temperatures are used in this comparison. Clearly stated the conclusion that internal heating is a stronger driver of inflation than external heating for these planets.
- **p103--104**: Updated figures based on changed modelling code. Extended the pressure range in order to demonstrate the smooth transition from radiative to convective gradient instead of cutting off the scale at $100\,$bar.
- p105: Updated figure 4.12 in section 4.3.4 with the updated modelling code to show how forcing a zero-opacity atmosphere roughly reproduces the isothermal case. Stated in the section that this is as expected; removed a comment about the models diverging at the low-mass end that is no longer the case.
- p106: Updated the last point under "I found that" to match the conclusion above about internal heating being a stronger driver of inflation than irradiation.
- p106: Updated the first point under "I also found the following:". Stated as above that the zero-opacity atmosphere reproduces an isothermal scale-height atmosphere as expected. Also highlighted the importance of the water opacity, to lead into the point following it which also discusses opacity.
- **p111**: Rewrote final paragraph of section 5.1 to introduce latent heat.
- **p111--112**: Added new section 5.1.1 "The adiabatic temperature gradient at phase transitions" that explains expected changes in the adiabat and their link to the latent heat/entropy difference across the transition.
- **p112--113**: Added new section 5.1.2 "My treatment of the adiabat" that explains that my treatment is equivalent to assuming no latent heat of phase transition and explains why I had to make this choice.
- **p113--115**: In the section beginning "The way in which I achieve continuity of temperature and pressure...", explained that sharp changes in the thermal expansivity are because it ceases to be well-defined at the boundary and that it cannot be used to infer the shape of the adiabat across a phase boundary. Kept the description of how I force continuity of temperature and pressure at each phase boundary.
- **p115**: At end of the first paragraph on this page, added a reference to section 2.2.5, where I showed and discussed discontinuities in the heat capacity.
- **p115--116**: Added paragraphs beginning "Although the assumption of no latent heat..." discussing why this choice is expected to have little impact on the final planetary structures and radii, and situations in which this may no longer be the case (compositional changes and liquid--vapour transitions).
- p119: Updated key result points to reflect changed models created with new modelling code, in particular replacing point 3 with a summary of how larger planetary models are less sensitive to irradiation temperature changes during migration.
- **p120**: Changed caption of figure 5.5 to explain that the highest-energy models could not be constructed in a self-consistent fashion.
- **p121**: Inserted paragraphs at the end of section 5.3.1 to explain convergence failure of the ODE solver in the high-energy low-mass limit.
- p123: Rewrote section 5.3.3 due to changes in the results due to updated modelling code. Removed the previous discussion about a discrete planet size change due to a phase transition that was seen in my old models. Replaced it with a discussion of how the orbital radius only weakly affects planet size when the planet is large (corresponding to the the third bullet point on p119).
- p126: Rewrote figure caption to describe weak orbital radius relation, as above.
- p129: In the second paragraph, clarified that this chapter was written based on a previous version of my modelling code.
- p138: In the third paragraph, updated the conclusion to say that "the radius can be significant inflated by internal heating" to match updates above (p100, p106, p119 etc).
