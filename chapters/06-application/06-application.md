# A water-rich super-Earth?

The previous chapters in this dissertation have consisted of a theoretical development of the structures of watery planets.
Though my models are based mostly on the measured physical properties of water, and though our motivation has always been to explain current and future observations, the topics I have explored so far have been theoretical in nature.
Until just a few weeks before its submission, this was to be the entire content of the dissertation.
However, we recently received news of an exciting new result: a potential water detection in the atmosphere of a rocky super-Earth, Gliese 1132 b.^[@Southworth2016]
This heated watery super-Earth is nearly a perfect candidate for the application of my models.

In this chapter, I present the results of applying my models to this super-Earth.
These results were obtained by Oliver Shorttle, a postdoctoral fellow in our group working with my supervisor Nikku Madhusudhan.
Oliver carried out the analysis in this chapter using an earlier version of my code \smallcaps{ONION} to analyse the potential composition of this planet.
I have included this work as an example of the first direct application of my models to observational data.

## Gliese 1132 b

The planet Gliese 1132 b, hereafter GJ 1132b, was discovered by MEarth^[
  MEarth is a survey that searches for Earth-like planets around M dwarfs.
  It takes advantage of the "small star opportunity": small faint stars such as M dwarfs have proportionally larger transits because the ratio of stellar to planetary radius is lower.
  Because small planets are common around these cooler stars, they represent a strong potential source of super-Earth detections.
] in 2015.
It orbits a M4V-type star at a distance of $12\,$pc, considerably closer than the closest previously known Earth-sized M-dwarf planets.
With an equilibrium temperature of up to $580\,$K depending on albedo, it is cool enough to have retained an atmosphere yet warm enough that any atmosphere is probably depleted of hydrogen.^[@BertaThompson2015]
@Tbl:gj1132b shows some key parameters of the system.

| Property |        | Value |
|----------|--------|-------|
| Right ascension | $\alpha$ | $10^\mathrm{h}\,14^\mathrm{m}\,51.846^\mathrm{s}$ |
| Declination | $\delta$ | $-47\degree\,09'\,24.47''$ |
| Distance | $D_\star$ | $12.0 \pm 0.2\,$pc |
| Mass | $M_\mathrm{p}$ | $1.6 \pm 0.5\,$M$_\oplus$ |
| Radius | $R_\mathrm{p}$ | $1.35 \pm 0.21\,$R$_\oplus$ |
| Orbital period | $P$ | $1.628930 \pm (3.1 \times 10^{-5})\,$day |
| Equilibrium temperature | $T_\mathrm{eq}$ | Up to $580\,$K depending on albedo |
Table: Key properties of GJ 1132b. All values come from @BertaThompson2015 except the radius, which has been revised upward from an initial estimate of $1.16 \pm 0.11\,$R$_\oplus$ [@Southworth2016]. {#tbl:gj1132b}

The radius given in @tbl:gj1132b is the continuum or "surface" radius of GJ 1132b; the radius in the $z$ and $K$ bands are higher, suggesting that the planet has an atmosphere.^[@Southworth2016]

## A potential water detection

GJ 1132b has been observed in several photometric bands.^[@Southworth2016]
The most recent measurement in the $z$-band differs from a flat spectrum at the $4\sigma$ level.
This band overlaps with a strong H$_2$O absorption window whereas all the other bands are windows in the H$_2$O opacity; it has previously been suggested that this is an ideal situation in which to make simultaneous observations of the atmosphere and interior.^[@Madhusudhan2015]
This planet is therefore an excellent choice to apply my models to: it is a heated super-Earth ($T_\mathrm{eq} \approx 600\,$K) with a potential water detection ([@fig:gj1132b-spectrum]).

![
  The observed transmission spectrum of GJ 1132b (\textcolor{red}{red points}) compared to theoretical spectra of H$_2$/H$_2$O atmospheres (coloured lines, with squares showing band-integrated values).
  The feature at $0.9\,\mu$m (the $z$-band) in particular is indicative of a water detection.
  The dashed line is the baseline radius of the planet inside opacity windows.
  --- *From Nikku Madhusudhan in @Southworth2016*
](gj1132b-spectrum_big_fig){#fig:gj1132b-spectrum}

The detection paper used simple temperature-independent models of the interior structure.
In their paper announcing the atmospheric detection, @Southworth2016 note that "In principle, consideration of temperature-dependent internal structure models would lead to larger model radii for the same composition [@Thomas2016] and therefore could lower the upper limit on the water mass fraction."
I made an earlier version of my \smallcaps{ONION} code, called \smallcaps{OGRE}, available to Oliver Shorttle to do just that: he has used it to investigate the structure of GJ 1132b.

## Results

My models have been used in two ways so far to provide insight into GJ 1132b's structure.
First I show the results of comparing the measured mass and radius of the planet to models with different compositional parameters.
In particular, we can vary the mass fractions of water, silicate and iron and compare the model and observed radii.
Then I show how the phase structure of the planet would be expected to vary as we change the water mass fraction, and how the predicted temperature at the base of the water envelope relates to the melting properties of a silicate mantle.

In these results, unless stated otherwise, all other parameters were fixed to the fiducial values specified in @tbl:default-values, except for the equilibrium temperature of the planet, which is taken as $580\,$K from @tbl:gj1132b.

### Constraints on interior composition

The mass and radius of GJ 1132b are consistent with a planet that has a watery layer of some kind.
[@Fig:gj1132b-mr] shows the one-sigma error ellipse for the mass and radius measurement of GJ 1132b.^[@Southworth2016]
Overlaid are some mass--radius curves for different planet compositions, the largest of which includes a $10$% layer of water by mass on an Earth-like nucleus.
These models use my full atmosphere--interior structural code from [@sec:heating-and-the-atmosphere;@sec:watery-planet-interiors] so that the effect of temperature is included in the water layer.
While a planet with a large iron fraction is ruled out by these mass--radius relations, GJ 1132b could have a sizeable water layer.

![
  The recently revised estimate for GJ 1132b's radius means that its density is only just consistent at the one-sigma level with an Earth-like planet.
  This figure shows mass--radius curves for \textcolor{SeaGreen}{pure silicate} and \textcolor{Coral}{pure iron} planets, as well as for an Earth-like mixture of $1$:$2$ iron:silicate by mass (in black).
  It also shows the mass--radius curve for a planet with a layer of \textcolor{DarkSlateBlue}{$10$\% water} by mass on an Earth-like core.
  GJ 1132b's density is consistent with the planet having an extended water atmosphere.
  --- *Figure provided by Oliver Shorttle*
](gj1132b-mr){#fig:gj1132b-mr}

If we assume that GJ 1132b has an Earth-like nucleus, we can vary the water mass fraction to see what range of water fractions are consistent with its radius.
[@Fig:gj1132b-radius-water-fraction] shows a one-sigma band around GJ 1132b's measured radius.
Overlaid on this, we show the predicted radius for planets with varying water mass fractions over an Earth-like nucleus.
The water fraction could be up to about $10$% of the mass of the planet. But the radial uncertainty of the planet also allows for a hydrosphere with the same mass fraction as Earth, which is about $10^{-3.6}$.

![
  When we compare the radius of GJ 1132b with the radius of watery planets, we see that GJ 1132b could have as much water as Earth or even several orders of magnitude more.
  This figure shows the radius of a \textcolor{Goldenrod}{dry planet} (1:2 iron:silicate by mass) with GJ 1132b's mass, as well as how the planet's radius increases when part of the mass is taken to consist of a \textcolor{DarkSlateBlue}{water envelope}.
  The lower line represents a planet with a Bond albedo of 0.75, while the upper line is the zero-albedo case.
  The Earth's water fraction is also shown for comparison.
  A wide variety of water mass fractions are permitted.
  --- *Figure provided by Oliver Shorttle*
](gj1132b-radius-water-fraction){#fig:gj1132b-radius-water-fraction}

Using a ternary diagram, we can change all three different mass fractions (iron, silicate and water) and determine which of these are most suitable for explaining the observations.
[@Fig:gj1132b-ternary] shows the range of compositions that are consistent with GJ 1132b's observed mass and radius.
Compositions that are very low in iron are not consistent with its observed radius given its mass.
But planets with up to $30$% water are consistent if the planet has a more massive iron core; that is, if its nucleus is more like Mercury in structure than the Earth or Mars.

![
  This ternary diagram shows the range of compositions permitted in a three-component iron--silicate--water model for GJ 1132b.
  The axes are the mass fractions of the given material.
  The planet is assumed to be fully differentiated and with Earth-like internal energy generation.
  The shading shows the probability that a model with the given layered composition and a mass drawn randomly from the error distribution can match the observed radius.
  The lines show the observed iron--silicate fractions of Mercury, Earth and Mars for comparison; the overlaps between these lines and the shaded region represent the range of water GJ 1132b would need to be consistent with observations if it had the same core/mantle composition as the named planet.
  --- *Figure provided by Oliver Shorttle*
](gj1132b-ternary){#fig:gj1132b-ternary}

### Phase structure and geology

We can also explore the phase structure of the planet using the method I described in @sec:phase-structure-and-migration.
[@Fig:gj1132b-phases] shows how the phase structure and temperature of the planet varies as the water fraction is increased.
If GJ 1132b's water layer is the same mass fraction as the Earth's, then the water layer is most gaseous.
But if it has more than the Earth's water fraction then it could transition to supercritical fluid or plasma deeper within the planet.
The water--silicate interface is also pushed to higher pressures down into the planet as the water mass fraction increases.

![
  Changes in the structure and temperature of the GJ 1132b planetary model.
  At low water fractions, the model comprises a gaseous water layer on molten silicate.
  At water mass fractions greater than that of the Earth, the water layer transitions to supercritical fluid or plasma.
  Recall that the silicate and iron core are treated as isothermal, so the trend of increasing temperature at high pressure with increasing water fraction is an artifact of the model assumptions.
  --- *Figure provided by Oliver Shorttle*
](gj1132b-phases){#fig:gj1132b-phases}

Finally, using information on the melting properties of silicate, we are able to take the temperature information at the base of the water layer and determine whether the Earth-like nucleus would be molten.
[@Fig:gj1132b-melting] shows the temperature differential from the solidus/liquidus^[At temperatures lower than the solidus, a material is completely solid. At temperatures higher than the liquidus it is completely liquid. In between, crystals form in the melt and the material exists as a slurry.] at the top of the silicate layer in the GJ 1132b models.
We vary the water fraction as before to investigate if this changes the melt state of the mantle.
We see that, at the temperatures at the base of a water layer, any silicate mantle is most likely molten.
This is also found to be true even under a very modest water layer (up to an order of magnitude less in mass fraction than the Earth).

![
  Temperature difference between the melting curve of peridotite, a common Earth mantle rock, and the modelled temperature at the base of the water layer in GJ 1132b.
  The coloured bands show three different mineralogical melting curves, and the width of each band represents models with Bond albedos ranging from $0$--$0.75$.
  When these curves pass above the horizontal line at $\Delta T = 0$, the rock is melted.
  The first and second curves are the solidi for \textcolor{CornflowerBlue}{water-saturated peridotite} and \textcolor{Goldenrod}{dry peridotite} respectively.
  At temperatures beyond the solidus the rock begins to melt, but initially the melting is non-total and the rock is in a slurry.
  The third curve is \textcolor{IndianRed}{the liquidus}: beyond this point the rock is completely molten.
  Across the entire range of water fractions considered, almost all provide for some degree of melting at the top of the silicate layer.
  --- *Figure provided by Oliver Shorttle*
](gj1132b-melting){#fig:gj1132b-melting}

\newthought{With this geological} information, the models raise some questions about the geological stability and properties of water-rich planets.
In particular, the existence of a gaseous atmosphere over molten silicate is unusual and may not be physically plausible depending on the nature of the atmosphere--interior interactions.
We might also ask how much water can be stored in its interior, whether it is outgassed, and what time scale this happens over.^[@Komacek2016]
Ultimately, the interior structures of planets like GJ1132b are an exciting avenue of investigation and I look forward to seeing what advances the future brings.
