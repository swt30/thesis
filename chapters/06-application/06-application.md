# A water-rich super-Earth?

For the majority of my PhD I was not certain that these models would be useful in more than a theoretical sense.
To have a nice set of models is one thing, but of course our ultimate goal is to actually use them to interpret observations.
And although I have shown that it is important to consider temperature when modelling watery planets, there are no immediate courses of action that arise from this apart from "make sure to include temperature in your models".

However, just a few weeks ago I was fortunate to receive news that water had possibly been detected in the atmosphere of the rocky super-Earth Gliese 1132 b.^[@Southworth2016]
This heated watery super-Earth is therefore nearly a perfect candidate for my models.

In this chapter, I present the results of applying my models to this super-Earth.
These results were obtained by Oliver Shorttle, who used my code \smallcaps{OGRE} to analyse the potential composition of this planet.
Because I did not carry out the analysis myself, this chapter will be brief, but I have included it as an example of the first direct application of my models to observational data.

## Gliese 1132 b

The planet Gliese 1132 b, hereafter GJ 1132b, was discovered by MEarth^[
  MEarth is a survey that searches for Earth-like planets around M dwarfs.
  It takes advantage of the "small star opportunity": small faint stars such as M dwarfs have proportionally larger transits because the ratio of stellar to planetary radius is lower.
  Because small planets are common around these cooler stars, they represent a strong potential source of super-Earth detections.
] in 2015.
It orbits a M4V-type star at a distance of $12\,$pc from us, considerably closer than the closest previously known Earth-size M-dwarf planets.
It is also cool enough to have retained an atmosphere yet warm enough that any atmosphere is probably depleted of hydrogen.^[@BertaThompson2015]
@Tbl:gj1132b shows some key parameters of the system.

| Property | Symbol | Value |
|----------|--------|-------|
| RA | $\alpha$ | $10^\mathrm{h}\,14^\mathrm{m}\,51.846^\mathrm{s}$ |
| Dec | $\delta$ | $-47\degree\,09'\,24.47''$ |
| Distance / pc | $D_*$ | $12.0 \pm 0.2$ |
| Mass / M$_\oplus$ | $M_\mathrm{p}$ | $1.6 \pm 0.5$ |
| Radius / R$_\oplus$ | $R_\mathrm{p}$ | $1.35 \pm 0.21$ |
| Orbital period / day | $P$ | $1.628930 \pm 3.1 \times 10^{-5}$ |
| Equilibrium temperature / K | $T_\mathrm{eq}$ | Up to $580\,$K depending on albedo |
Table: Key properties of GJ 1132b. All values come from @BertaThompson2015 except the radius, which has been revised upward from an initial estimate of $1.16 \pm 0.11\,$R$_\oplus$ (@Southworth2016). {#tbl:gj1132b}

The radius given in @tbl:gj1132b is the continuum or "surface" radius of GJ 1132b; the radius in the z and K bands are higher, suggesting that the planet has an atmosphere.^[@Southworth2016]

## A potential water detection

GJ 1132b has been observed in several photometric bands.^[@Southworth2016]
The most recent measurement in the $z$-band differs from a flat spectrum at the $4\sigma$ level.
This band overlaps with a strong H$_2$O absorption window whereas all the other bands are windows in the H$_2$O opacity; it has previously been suggested that this is an ideal situation in which to make simultaneous observations of the atmosphere and interior.^[@Madhusudhan2015]
This planet is therefore an excellent choice to apply my models to: it is a heated super-Earth ($T_\mathrm{eq} \approx 600\,$K) with a potential water detection ([@fig:gj1132b-spectrum]).

![
  The observed transmission spectrum of GJ 1132b (\textcolor{red}{red points}) compared to theoretical spectra of H$_2$/H$_2$O atmospheres (coloured lines, with squares showing band-integrated values).
  The feature at $0.9\,\mu$m in particular is indicative of a water detection.
  The dotted line is the baseline radius of the planet inside opacity windows.
  --- *From @Southworth2016*
](gj1132b-spectrum_big_fig){#fig:gj1132b-spectrum}

## Planet models

The detection paper used simple temperature-independent models of the interior structure.
In their paper announcing the atmospheric detection, @Southworth2016 note that "In principle, consideration of temperature-dependent internal structure models would lead to larger model radii for the same composition [@Thomas2016] and therefore could lower the upper limit on the water mass fraction."
I gave my code \smallcaps{OGRE} to Oliver Shorttle to do just that: he has used it to investigate the structure of GJ 1132b.
Here is a brief summary of the key results so far.

The mass and radius of GJ 1132b are consistent with a planet that has a watery layer of some kind ([@fig:gj1132b-mr]).

![
  The recently revised estimate for GJ 1132b's radius means that its density is only just consistent at the one-sigma level with an Earth-like planet.
  This figure shows mass--radius curves for \textcolor{SeaGreen}{pure silicate} and \textcolor{Coral}{pure iron} planets, as well as for an Earth-like mixture of $1$:$2$ iron:silicate by mass.
  It also shows the mass--radius curve for a planet with a layer of \textcolor{DarkSlateBlue}{$10$\% water} by mass on an Earth-like core.
  GJ 1132b's density is consistent with the planet having an extended atmosphere.
  An Earth-like level of internal heating ($1\,$pW$\cdot$kg$^{-1}$) is used, but GJ 1132b is tidally locked and tidal heating may also contribute a significant amount of internal energy generation.
  --- *Figure provided by Oliver Shorttle*
](gj1132b-mr){#fig:gj1132b-mr}

The water fraction could be up to about 10% of the mass of the planet. But the radial uncertainty of the planet also allows for a hydrosphere with the same mass fraction as Earth ([@fig:gj1132b-radius-water-fraction]).

![
  Comparing the radius of GJ 1132b with the radius of planets with water layers reveals that it could have as much water as Earth or even several orders of magnitude more.
  This figure shows the radius of a \textcolor{Goldenrod}{dry planet} (1:2 iron:silicate by mass) with GJ 1132b's mass, as well as how the planet's radius increases when part of the mass is taken to consist of a \textcolor{DarkSlateBlue}{water envelope}.
  The lower line represents a planet with a Bond albedo of 0.75, while the upper line is the zero-albedo case.
  A wide variety of water mass fractions are permitted.
  --- *Figure provided by Oliver Shorttle*
](gj1132b-radius-water-fraction){#fig:gj1132b-radius-water-fraction}

Compositions that are very low in iron are not consistent with the observed radius of GJ 1132b.
Planets with up to 30% water are consistent if the planet has a massive iron core ([@fig:gj1132b-ternary]).

![
  This ternary diagram shows the range of compositions permitted in a three-component iron--silicate--water model for GJ 1132b.
  The axes are the mass fractions of the given material.
  The planet is assumed to be fully differentiated and with Earth-like internal energy generation.
  The shading shows the probability that a model with the given layered composition and a mass drawn randomly from the error distribution can match the observed radius.
  The lines show the observed iron--silicate fractions of Mercury, Earth and Mars for comparison; the overlaps between these lines and the shaded region represent the range of water GJ 1132b would need to be consistent with observations if it had the same core/mantle composition as the named planet.
  --- *Figure provided by Oliver Shorttle*
](gj1132b-ternary){#fig:gj1132b-ternary}

If GJ 1132b has a watery envelope and atmosphere, this envelope is most likely gaseous.
But if the envelope's mass is significant (more than the Earth's water fraction) then it could transition to supercritical fluid or plasma deeper within the planet.
The water--silicate interface is also pushed down into the planet as the water mass fraction increases ([@fig:gj1132b-phases]).

![
  Changes in the structure and temperature of the GJ 1132b planetary model.
  At low water fractions, the model comprises a gaseous water layer on molten silicate.
  At water mass fractions greater than that of the Earth,
  Recall that the silicate and iron core are treated as isothermal, so the trend of increasing temperature at high pressure with increasing water fraction is an artifact of the model assumptions.
  --- *Figure provided by Oliver Shorttle*
](gj1132b-phases){#fig:gj1132b-phases}

Finally, [@fig:gj1132b-pressure-at-base;@fig:gj1132b-temperature-at-base;@fig:gj1132b-melting] show three different measures of interest to the geological properties of such a silicate mantle and how they vary with water fraction.
[@Fig:gj1132b-pressure-at-base;@fig:gj1132b-temperature-at-base] show the pressure and temperature at the base of the ocean, while [@fig:gj1132b-melting] shows the temperature differential from the solidus/liquidus at the top of the silicate layer.
At the pressures and temperatures at the base of a heavy water layer, any silicate mantle is most likely molten.
But this is also found to be true even under a very modest water layer.

![
  Pressure at the base of GJ 1132b's water envelope for varying water fractions.
  For an Earth-like water fraction, the base pressure approaches the pressure at the base of Earth's oceans.
  --- *Figure provided by Oliver Shorttle*
](gj1132b-pressure-at-base){#fig:gj1132b-pressure-at-base}

![
  Temperature at the base of GJ 1132b's water envelope for varying water fractions.
  The range shown includes models with Bond albedos ranging from nothing to $0.75$.
  Because the model assumptions result in a temperature that increases into the water layer, a thicker water layer results in hootter temperatures at the base.
  For an Earth-like water fraction, the temperature at the base of the water later could be more than $1500\,$K.
  --- *Figure provided by Oliver Shorttle*
](gj1132b-temperature-at-base){#fig:gj1132b-temperature-at-base}

![
  Temperature difference between the melting curve of peridotite, a common Earth mantle rock, and the modelled temperature at the base of the water layer in GJ 1132b.
  The coloured bands show three different mineralogical melting curves, and the width of each band represents models with Bond albedos ranging from $0$--$0.75$.
  When these curves pass above the horizontal line at $\Delta T = 0$, the rock is melted.
  The first and second curves are the solidi for water-saturated peridotite and dry peridotite respectively.
  Beyond the solidus there is some melting, but the melting is non-total and the rock is in a slurry.
  The third curve is the liquidus: beyond this point the rock is completely molten.
  Across the entire range of water fractions considered, almost all provide for some degree of melting at the top of the silicate layer.
  --- *Figure provided by Oliver Shorttle*
](gj1132b-melting){#fig:gj1132b-melting}
