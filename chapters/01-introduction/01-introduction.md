# Introduction

Not many discoveries have ever captured the imagination of scientists and non-scientists alike as much as exoplanets.
Until 1995, we had only the ground under our feet and a select few lights in our sky to guide our understanding of planetary systems.
Now we are faced with almost an over-abundance of planets, with papers and press releases trumpeting more every week.

Astronomers who work in the young field of exoplanet astronomy are blessed (or cursed?) with a rapidly increasing amount of data.
In the 20 years since the first exoplanets were found, ground- and space-based missions have provided hundreds and hundreds of exoplanetary detections.
This prodigious increase **n the number of known extrasolar systems owes its existence to improved light-gathering ability, instrumentation, and analysis techniques.
From minute fluctuations in light and tiny velocity wobbles, a whole industry has sprung up devoted to simply finding exoplanets---a task which is certainly not easy on its own.

\begin{marginfigure}
  \centering
  \includegraphics{xkcd-brightness}
  \href{https://xkcd.com/1371/}{xkcd.com/1371}
\end{marginfigure}

There is another task which is parallel to the push to find exoplanets: the community has turned its gaze towards understanding the ones that it has already found.
With huge amounts of telescope time being devoted to observing them and a flurry of new missions and instruments on the way, there is no doubt that we are moving from an era of exoplanet *detection* to one of *characterisation*.
This field is seeing increasing interest from both scientists and non-scientists.
And why wouldn't it? New discoveries abound: huge Earths! Planets in the habitable zone! Lava planets, diamond planets, all sorts of sizes and masses!
Exoplanet characterisation has proven to be a great opportunity for increasing public interest in astronomy; fuelling a resurgence of interest in complementary fields such as stellar activity modelling; bringing astronomers, planetary scientists, geologists and atmospheric scientists closer; and interesting more people in big questions about our place in the universe.

As with any field of astronomy, studying exoplanets depends on reliable modelling and correctly understanding physical processes, just as much as it depends on observational techniques.
What can we understand about exoplanets from the information we have? How much can we trust our models? And how useful can these models actually be?
In this chapter I take scope of recent work in a field that has yet to see its twentieth birthday, leading to the motivation for the primary focus of the dissertation: models of watery super-Earths.

## Background

Why do exoplanets appeal to so many people?
Once we made the connection between our Sun and the other stars we see, finding planets around them was never going to be a surprise.
Yet since the discovery of the first exoplanets using pulsar timing^[@Wolszczan1992] and radial velocity^[@Mayor1995], the field has become very popular indeed.

Many authors would claim that the ultimate goal of exoplanetary research is to detect the bio-signatures that would indicate a habitable planet, as in the review of @Seager2010.
Others are interested in characterising exoplanets for the insights this may offer us about our own solar system and its place in our universe.
For example, @Raymond2013 notes that "planet formation models lag behind observations", so observing exoplanetary systems provides an opportunity to expand and test our formation models.
Because the Earth is just a planet, the reasoning goes, any model which correctly explains how planets form will tell us more about our origin as well.^[See, for example, @Mordasini2014.]

To do this, a wide range of skills are needed.
Perhaps this is why the field is so popular: it demands clever observations with new technology, improved data reduction techniques, and a solid theoretical background.
So in order to know what problems are worth pursuing, it will help us to briefly review what is currently achievable in exoplanet science.

![
  Several methods for finding exoplanets exist.
  Comparatively few exoplanets are found using microlensing, direct imaging or transit timing.
  The radial velocity method produced many early discoveries of hot Jupiters.
  But thousands of planets have been found by the transit method, largely thanks to the Kepler mission's data releases in 2014 and 2016.
  --- *Data from [www.exoplanets.org](http://www.exoplanets.org)*
](exoplanet-discoveries){#fig:exoplanet-discoveries}

![
  Different detection techniques find planets with different properties.
  Radial velocity planets are often larger and further from the star than transiting planets.
  This is because different methods are biased in different ways: short-period planets are favoured by the transit method while massive planets are favoured by the radial velocity method. --- *Data from [www.exoplanets.org](http://www.exoplanets.org)*
](radius-separation){#fig:radius-separation}

### The field is driven by observations

Exoplanetary science, like most fields of astronomy, is driven by observations.
This should come as no surprise, and so it is a point we will not dwell on for too long.
And although much of the formalism for understanding exoplanets initially carried over from our understanding of binary stars, it was the detection of the first extrasolar planets that drove the theoretical work behind improvements in the detection techniques.
This includes better transit modelling, dynamical studies of systems, and instrumental design which is allowing improvements like high-contrast direct imaging.

In particular, observations of exoplanets have raised a host of questions, most of which we could not have predicted based on our own solar system.
The questions span atmospheric science, chemistry, geology, and solar system dynamics.
Why do we see so many Jupiter-mass planets with inflated radii?^[@Baraffe2010; see also @fig:mass-radius]
Might we expect to see systems with binary planets, where two planets have captured each other through tidal interactions?^[@Ochiai2014]
How do hot Jupiters---gas giants orbiting very close to their host star---form and end up where they are?^[@Seager2010]
How do the systems we see fit with our understanding of planet formation, evolution, and dynamics?^[@Mordasini2012a]
And finally, what do we need to do to find an Earth-like planet, how will we know when we've done so... and how many might we expect to find?^[@Petigura2013]

### Detection methods

A number of different techniques are used to detect exoplanets ([@fig:exoplanet-discoveries; @fig:radius-separation]).
After claims in the early 90s of planet detections around pulsars,^[@Wolszczan1992] the first extrasolar planet around a Sun-like star was found using the radial velocity method described below.^[@Mayor1995]
However, in the past few years, the transit method has produced the largest number of new exoplanets.
Here I summarise different methods of exoplanet detection and the observable information that can be gained from each. This will be important shortly when we consider what directions the field is moving based on these available data.

\newthought{The radial velocity} (RV) or Doppler method entails using spectral Doppler shifts to measure the recoil motion of a star as a planet orbits it.
The formalism for finding planets using radial velocity has carried over from the older field of binary star research, and the information that can be gained about a star-planet system is very similar.
Using Doppler measurements of the recoil motion of the star, the *mass function*,\marginnote{
  The mass function is defined as
  \begin{equation}
    {\left(M_p \sin i \right)^3 \over \left(M_p + M_*\right)^2}.
    \label{eq:mass-function}
  \end{equation}
  Here, $M_p$ is the planet mass, $M_*$ is the stellar mass, and $i$ is the orbital inclination.
} which relates the planet's mass to the star's mass, can be calculated.^[@Wright2012]

The RV method has the advantage that it works with a wide range of inclinations, not just those near $i=90°$.
This is counterbalanced by the fact that there is an inherent degeneracy between inclination and planetary mass in the $M_p \sin{i}$ term of the mass function.
It is therefore only possible to measure the minimum mass unless some constraint can be placed on $i$.

The Doppler method is also useful for detecting multiple planet systems.
Once the signal of one planet has been found, it can be removed and the system re-analysed to search for more planets.
In the case of certain large, bright planets, the emission lines from the planet itself may be used to directly measure the planet's motion and obtain its mass.^[@Rodler2012]

Although this method is distance-independent and easily detects large planets close to their host stars, it is not as suited for large surveys because a spectroscopic observation is required.
A number of sources of contamination---stellar and magnetic activity, stellar rotation, telluric lines, moonlight, faint companions---must also be accounted for.^[@Seager2010b; @Haswell2010]

As can be seen in [@fig:exoplanet-discoveries], the Doppler method was responsible for the majority of exoplanet detections until 2010.
However, the advent of large photometric surveys like Kepler favoured a different method for finding exoplanets, known as the transit method.

![
  In this schematic of a primary transit, we see a dip in the light curve of the star as the planet passes in front of it.
  Secondary transits, where reflected light from the planet is instead blocked by the star, are smaller.
](schematic-transit){#fig:schematic-transit}

> TODO: replace [@fig:schematic-transit] with a hand-drawn image

\newthought{The transit method}---where the planet moves between us and its host star (@fig:schematic-transit)---is an intuitive way of spotting planets.
I will not elaborate on the mechanics of a transiting system except to point out that the probability of observing a transit and the expected decrease in the observed flux are both very small.
The transit probability for a circular orbit is approximately ${R_*/a}$, where $R_*$ is the stellar radius and $a$ is the radius of the orbit.
Similarly, ground-based surveys are able to resolve flux decreases on the order of 1\%, while space-based surveys can detect transit depths on the order of $10^{-4}$.
The greatest gains in the number of known transiting planets have therefore come from systematic surveys of many stars.
These surveys are capable of yielding planets on the order of $R_⊕$.^[@Perryman2011, p. 103]
This lower limit is constantly being pushed downwards.
For example, Kepler-37b was discovered by the transit method; later observations and asteroseismologial analysis suggest that its radius is around $0.3 R_⊕$.^[@Barclay2013]

The transit method can provide a significant amount of information about the transiting planet as well.
From the observables of period, ingress and egress time, equatorial crossing time, and flux depth, the transit method provides an immediate radius ratio.
When combined with radial velocity measurements, the mass and radius of the star and planet can be measured.
There is a one-parameter degeneracy,^[@Wright2012] which can be broken if more is known about the host star through parallax, spectroscopy, or theoretical mass-radius constraints.
Transit information may also inform estimates of planetary surface gravity^[@Southworth2007] and host star density.^[@Wright2012]

However, there are several sources of uncertainty.
In addition to the expected systematic and random errors in photometry (instrumentation, telluric variability, observing conditions, and stellar properties like surface brightness variations), transit surveys have a high false positive rate.^[@Cameron2012]
This is because eclipsing binaries, brown dwarf companions, background eclipsing binaries and background exoplanet transits can all produce similar photometric signals.

To handle this possibility, the detections must be validated.
A detection can be considered good if a wide variety of possible alternate events are also modelled and the probability of each is deemed low enough.
Follow-up observations using other methods are key to rejecting false positives and further constraining the system.
For example, the validation technique used by the Kepler team is called \smallcaps{BLENDER}^[@Fressin2011] and makes use of such observations; these could include high-resolution spectroscopy, infrared photometry, or speckle/adaptive optics imaging to constrain or rule out the possibility of a multiple stellar system.
Finally, radial velocity measurements can probe the transiting object's mass, and can confirm that it is comparable with that of a planet.

\newthought{A number of other methods} for detecting planets are also listed in [@fig:exoplanet-discoveries].
The first of these uses timing information, a method which resulted in some of the earliest exoplanet findings.^[@Wolszczan1992]
This was possible because the exoplanets in question orbit the millisecond pulsar PSR1257+12.
The precise period of pulsars means that the gravitational effect of a planet is measurable, even for planets down to $0.1 M_⊕$.
"Timing" can also be used in another sense: if a transiting exoplanet is known, variations in its time of transit can indicate an unseen planet elsewhere in the system.
Timing methods give information on masses but little else.

![
  Microlensing can be used to find planets.
  In a microlensing event, a background source star (top left panel) brightens for a short time as its light is focused on us (bottom left panel).
  Here, Hubble's Wide Field and Planetary Camera has been used to follow up the observation to resolve the source star.
  Planets may be detected around the lensing star if the additional effect of their gravitational field changes the shape of the light curve.
  The effect can be relatively large if the light path happens to cross a *caustic*, a discontinuity or rapid change in the lensing pattern.
  --- *NASA HST/WFPC2*
](microlensing-event){#fig:microlensing-event}

Planets may be found during microlensing events ([@fig:microlensing-event]).
If a planet lies in the right region during the lensing event, the planet's gravity will further perturb the incoming light and cause a detectable deviation from the single-lens case.
In most cases, microlensing detections do not provide much additional information.
The single lens event itself provides a weak constraint on the lens mass, and the addition of a planet gives a mass ratio and a projected separation.
Together, these provide essentially no constraint on the orbital elements of the system.^[@Wright2012]
Extra observations may not be useful at all, since the lensing star is typically not visible and microlensing events are extremely rare.
In the past few years, some authors have worked on improving the amount of information obtainable from single microlensing events.
For example, @Bennett2010 claim strong constraints on 4 of the 6 orbital elements.

The final method we mention here is direct detection.
It is possible to spatially resolve an exoplanet and its host star if the planet is large, bright, and orbits sufficiently far from the star.
As of July 2014, 50 planets have been found this way.^[@Schneider2011]
A number of instruments like the Gemini Planet Imager^[@Macintosh2014] and Project 1640^[@Crepp2011] are currently active and attempting to directly image exoplanets.
In this case, it may also be possible to take a direct spectrum of the planet.^[@Oppenheimer2013]
Others have suggested the use of external occulters or also known as "star shades", which would fly between a telescope and its target to occult the light from the star.^[@Soummer2009]

### Complementary information is required for characterisation

All these methods provide us with different information, and none of them is perfect.
In many cases, the information gained from one of these methods is only enough to identify the presence of the planet.
But we saw above that this is often not enough---Kepler requires a statistical validation method due to the possibility of contamination from events that look similar to a transit.
As well as demonstrating the relative difficulty of identifying clear transit events in data that can often be quite noisy, it also highlights the difference between *validating* and *observationally confirming* the presence of exoplanets.
The second is more direct, but requires a radial velocity or transit timing variation measurement.
As @Fressin2011 note, "many of Kepler’s smaller candidates will receive a similar [validation] treatment since dynamical confirmation may be difficult or impractical with the sensitivity of current instrumentation."
It therefore became apparent as large scale surveys were being constructed that clever strategies for validation were needed.^[For example, see @Tingley2005.]

Identifying the presence of a planet is one thing, but characterising it is quite another, and this is where the field has been moving.
A primary driver of this work is the quest to find a habitable planet, but the definition of habitability is fraught with difficulty.^[@Gaidos2005]
Do we accept any Earth-like planet in the habitable zone of any star---that is, the region where we might expect liquid water to exist on the surface? Do we restrict ourselves to Earth-like planets around Sun-like stars? What observational signatures might we expect from a habitable planet? Here, we begin to see a strong overlap with other areas of science such as atmospheric physics, planetary science, geology, and even biology.
In order to understand more about the planets themselves, we turn to other methods to allow us to retrieve more information.
The key development in this area has been the use of transmission and reflection spectroscopy, which attempt to separate the star's light and the contribution from the planet.^[@Charbonneau2002; @Charbonneau2005; @Deming2005]

![
  Observations and model spectra for dayside thermal emission of WASP-12bT.
  These models of the day side emission from the exoplanet WASP-12b show several prominent absorption features compared to black body curves (dotted \textcolor{darkgray}{grey} lines).
  Later in their paper, @Madhusudhan2011a claim evidence for a high C/O atmospheric ratio and absence of a strong thermal inversion.
  Although this analysis used only seven photometric bands from Spitzer and ground-based observations (indicated by solid black lines), the availability of higher-quality spectra is increasing our ability to constrain the atmospheric properties of exoplanets in this way.
  --- *From @Madhusudhan2011a*
](wasp-12b){#fig:wasp-12b}

### Observations motivate models

Much recent effort has been expended on finding ways to retrieve more information about specific exoplanets.
As our observational capabilities increase, the possibilities to directly image or spectrally probe these planets mean that we have seen huge interest in modelling their atmospheres in an attempt to determine likely compositions.^[@Madhusudhan2014]
The need to distinguish the star's light from the planet's light also results in a need to understand the stellar spectrum better.
Not only this, but stellar variability can become important too when attempting to discover or characterise smaller exoplanets.
It is perhaps even more critical to understand when dealing with the effects of stellar noise in radial velocity measurements.^[@Wright2012]

![
  In an image of the 2012 transit of Venus, the planet is opaque at this wavelength. Stellar surface activity, clearly visible in this image, is a key complication when disentangling information from a planet and star. --- *NASA SDO/AIA*
](venus-transit){#fig:transit-of-venus}

Although I am of mixed opinion about the overall success of atmospheric modelling thus far, mostly due to the poor quality of spectroscopy available for the less well-studied targets, there is no doubt that both the modelling and observational sides of things are surging forward.
Accurate modelling of atmospheric features, while not currently able to give us a definitive answer on compositions, is able to inform our observations to some degree---most usefully on the presence of features like clouds, thermal inversions, and element ratios such as C/O.
So, with atmospheric modelling and observation a well established and thriving field of research, what next?


## Internal structure models

As we have seen, a relatively large number of methods are available to detect exoplanets, many of which are well-suited to large surveys.
I have discussed the ways in which planets are found, and briefly reviewed the efforts to follow them up and understand their atmospheres.
I now turn to their interiors.

Exoplanetary interior modelling is necessarily based on our knowledge of one set of planets: our Solar System.
However, a highlight over the past two decades has been that the planets we have discovered are unexpectedly diverse.
This can be seen in a simple *mass--radius diagram*, where the mass and radius of discovered planets are plotted against each other ([@fig:mass-radius]).
This diversity of planets leads us to consider the question: can we come up with self-consistent models that account for it?
And what other observables might we be able to tap into to provide further constraints?
In this section I will briefly discuss attempts to do this.

![
  Mass--radius diagram of exoplanets and Solar system planets.
  Many Jupiter-mass planets lie above the predicted relationship for hydrogen spheres (\textcolor{Coral}{coral} lines).
  They are the so-called *puffy Jupiters*.
  The \textcolor{SlateBlue}{blue}, \textcolor{SeaGreen}{green} and \textcolor{FireBrick}{red} lines show the relationships for spheres of water, MgSiO$_3$ perovskite, and iron.
  By comparing a planet's mass and radius to these, we can rule out certain classes of compositions---for example, if a planet has a larger radius than would be permitted for a sphere of rock or ice, it is likely to have a gaseous atmosphere.
  From this we see already that the exoplanetary inventory includes planets unlike anything in our solar system: hot Jupiters, puffy gas giants, mini Neptunes and super Earths.
  --- *Mass--radius curves adapted from @Rogers2012, data from [exoplanets.org](http://www.exoplanets.org)*
](mass-radius-rogers-seager){#fig:mass-radius}

> TODO: rotate labels and add border to [@fig:mass-radius]

### Interior structures are the new frontier

As atmospheric characterisation techniques improve, the question of what lies beneath the atmosphere has naturally arisen.
We care about planetary interiors because they are linked to the formation history of the planet, because they are shaped by and shape the planetary atmosphere and because they are key to answering questions about habitability [@Sotin2010].
Understanding these exoplanets also allows us to place our own Earth into context: how unique are we?
We therefore seek to understand, if not the interiors of individual exoplanets, at least something about broad classes of planets.
But it is here that we are confronted by a lack of data, because we have very little ability to directly probe the interiors of exoplanets.

This lack of a rich source of observational data for planetary interiors means that we rely strongly on models.
Even inside our solar system, our knowledge of planetary interiors is limited by the indirect ways in which we can probe them.
On Earth we have the advantage of seismic measurements, and in our solar system we have various gravitational moments to constrain interior structures.
Outside the solar system we have only the masses and radii of planets to work with.
Models from first principles (numerical or analytical models based on the physics of solid and liquid spheres) therefore dominate the field.

Planetary interior models are a worthwhile starting point to make sense of the limited observational data we have.
These models are inspired by earlier successes with stellar structure models, which are key to interpreting observations of stars.
The ever-increasing number of known exoplanets, many of which have both mass and radius measurements, are a diverse and interesting set of objects to which to apply these models.

Others had previously considered the internal structures of planets in our solar system,^[For example, see @Hubbard1980.], but the study often taken as the base for planetary interior modelling is by @Zapolsky1969 who constructed mass--radius relations for large homogeneous isothermal spheres.
Since then, a number of internal structure models have been developed specifically for exoplanets, with work beginning about a decade ago.^[e.g. @Valencia2006; @Fortney2007; @Sotin2007; @Seager2007]
In a nutshell, the basic assumption is that the internal structure may be modelled in one dimension by using similar equations to those of stellar structure.^[See @sec:watery-planet-interiors for more on these models.]

Such one-dimensional modelling has been carried out for a number of bodies, including rocky/icy planets.^[@Valencia2006; @Valencia2007a; @Seager2007; @Nettelmann2011]
Planets with a gas envelope can also be modelled, although additional equations come into play in the atmosphere.^[@Vazan2013; @Fortney2010; @Baraffe2008]
This method aims to build a self-consistent model based on some known constraints: for example, given a mass and radius, the mass fractions of a two-layer model may be specified exactly if the compositions of each layer and their equations of state are assumed.^[@Nettelmann2011]
Other authors have used this approach to scan the parameter space of possible compositions, often using a *ternary diagram* to show the ranges of materials permitted for a given planet,^[@Valencia2007a] or producing grids of models.^[@Zeng2013]
I will discuss this approach more in @sec:watery-planet-interiors.

![
  This ternary diagram shows the range of possible compositions allowed by the mass and radius of the super-Earth 55 Cancri e.
  For this model composed of Fe, C, and MgSiO$_3$, the \textcolor{red}{red} and \textcolor{blue}{blue} regions show the constraints from the \textcolor{red}{visible} and \textcolor{blue}{gray} radii respectively.
  The blue region is a subset of the red.
  Ternary diagrams like this are useful when three numbers, like these mass fractions, sum to one. --- *From @Madhusudhan2012a*
](sample-ternary-diagram){#fig:ternary-diagram}

In addition to 1D models, numerical simulations of processes like convection may also be useful for understanding the interiors of planets.
Here, there are very strong links with the geological sciences.
It is not necessarily possible to directly apply methods from the earth sciences, however, because many of them depend implicitly on a more detailed knowledge of the Earth than we can achieve for exoplanets---for example, seismological data and gravitational moment measurements.
An immediate first check on the validity of exoplanetary models does come from applying them to the Earth, however, and the results from this are generally promising, as shown in [@fig:density-profile-PREM-comparison].

![
  Comparison of a self-consistent density profile to an Earth model obtained through seismological data.
  Modelling the density profile of the Earth as if we were modelling an exoplanet produces results that compare well with the Preliminary Reference Earth Model (PREM), which is determined by inverting measurements of seismic wave propagation to solve for the internal structure.
  --- *Adapted from @Baraffe2014*
](density-profile-PREM-comparison){#fig:density-profile-PREM-comparison}

> TODO: add border to [@fig:density-profile-PREM-comparison]

### These models are useful in several ways

The first way in which planetary interior models can be useful is to make broad inferences about the structure of a planet.
There is some information available about any planet despite an inherent degeneracy between different compositions.
We can immediately exclude certain classes of models: for example, small planets with large radii must almost certainly have large hydrogen envelopes.
We can also take more sophisticated approaches.
@Sotin2007 modelled planets by fixing their compositions based on the properties of the host star.
@Madhusudhan2012a argued for a carbon-rich interior in the exoplanet 55 Cnc e based on its carbon abundance and on its density matching that of pure carbon.
Using known stellar abundances for the nebular composition, they determined that a high molar ratio of carbon during planet formation could lead to a carbon-rich interior, an interpretation supported by mass and radius measurements.
@Dorn2015 also showed that mass and radius alone can constrain the size of a planet's core if we assume it is pure iron.

We can also hope to make progress in a statistical sense by examining populations of planets.
Such progress is possible even if we are unable to pin down the precise structure of an individual planet.
There are promising advances in this direction already.
These usually involve inverse Bayesian analyses.
For example, @Rogers2015 investigated the size demographics of planetary populations and set an approximate boundary of 1.6$\,$R$_⊕$ beyond which planets are likely to have gaseous envelopes.

Finally, interior structure models may be useful when combined with prescriptions for planetary formation.
There is increasing interest in linking internal structures with simulations of protoplanetary disks and using our knowledge of planetary systems to generate synthetic populations of exoplanets.
From a statistical point of view, this makes sense: because we only have one solar system to compare our observations to, our best bet for understanding other systems may be to statistically evaluate the likelihood of observing them, based on formation models.
Though this approach is undoubtedly complicated, it is a promising one for assessing the statistical properties of planetary systems.
@Mordasini2012 took this approach, combining interior structure calculations with models of the protoplanetary disk to produce synthetic populations of planets.
In 2014 they updated their model, building an extensive hierarchical model for planet formation and evolution in an approach termed "planet population synthesis" with the goal of both predicting statistical properties of observed planetary populations and testing the constituent models.^[@Mordasini2012; @Mordasini2012a; @Mordasini2014]
@Lopez2012 also made model planets and explored how they evolve and lose mass through time.^[See also @Owen2015.]

If we are to use mass and radius to constrain the interior structure of a planet, we should ensure that our models are precise and accurate.
But more importantly, we should understand where our models need to be precise and accurate and where such effort is wasted.
We therefore require a thorough understanding of what factors can affect the mass--radius relation.
We also need to know to what extent we are able to invert the relation to determine a composition.

### Accuracy is difficult because of structural degeneracies

The internal structure of a planet is not well-constrained by its mass and radius alone.^[@Rogers2010]
However, we know that we can obtain some compositional constraints from observations of the planet and its host star.
Above, I mentioned works by @Sotin2007 and @Madhusudhan2012a, who used host star information in this way.
@Dorn2015 also used probabilistic models, incorporating the host star chemical abundances, to conclude that "uncertainties on mass, radius, and stellar abundance constraints appear to be equally important."
@Grasset2009 indicated the need for good radius measurements, especially for dry silicate-rich planets for which numerical models can provide radius estimates to precisions of less than 5 per cent.
@Unterborn2015 used a mineral physics toolkit to perform a sensitivity analysis for rocky super-Earths, concluding that the mass--radius relationship is most strongly altered by the core radius and the presence of light elements in the core.

The presence of an atmosphere could also contribute significantly to the observed radius.
@Rogers2010a have modelled isothermal super-Earth interiors overlaid by a volatile atmosphere.
Additionally, @Valencia2013 considered coupled atmosphere--interior models, which also included atmospheric mass loss, and explored the dependence of radii on various model parameters such as the irradiation, water content and metallicity.
The effect of an atmosphere is important, especially given that observations can probe spectral ranges where atmospheric absorption could be significant.^[@Madhusudhan2015]

Though the factors above are all important, the effect of temperature on the mass--radius relation has not been thoroughly explored.
This is for several reasons.
First, its effects are thought to be relatively minor in the first place: @Howe2014 estimate that the effect of thermal corrections on an iron-silicate planet's radius is approximately 5 per cent.
@Grasset2009 also describe how the radius of an Earth-like planet is not strongly affected by temperature changes.
If the effect is small compared with current observational uncertainties, it is not necessarily relevant.
Second, modelling is easier if we assume zero-temperature or isothermal spheres of material, because we do not have to deal with energy transport within the planet.
Finally, the data on thermal expansion of heavy elements are sparse at the high temperatures and pressures characteristic of planetary interiors.^[@Baraffe2008]
Therefore mass--radius relations or models of individual planets traditionally had no temperature dependence at all^[@Zapolsky1969; @Seager2007] but it is increasingly being included and thermal effects on radii are being explored.^[For example, see @Valencia2013.]

### Observational constraints are increasingly strong

\begin{figure}
  \includegraphics{ternary-diagram-bayesian}
  \caption{Bayesian techniques can be used to quantify the constraints placed on the interior composition of a planet, and they also account for uncertainties in the mass and radius and the inherent degeneracy in structure. Here, the posterior likelihood distribution for the interior composition of GJ 581d shows that a range of structures are permitted. --- \emph{From \protect \citet{Rogers2010}}}
  \label{fig:ternary-diagram-bayesian}
\end{figure}

> TODO: @fig:ternary-diagram-bayesian and @fig:ternary-diagram could be combined

To what degree can interior structure models be linked with observations?
We have already seen in @fig:ternary-diagram that there is necessarily some degeneracy in the interior structure of any given planet.
Unless the planet is taken to consist of only two layers of known material with mass fractions that are allowed to vary freely, a given mass and radius cannot be used to predict the internal structure of a planet.
More encouraging results may come from a Bayesian approach such as that taken by @Rogers2010, who quantify the constraints that transit and radial velocity observations can place on a planet's interior structure.

Unfortunately, these constraints are still not ideal---@Rogers2010 point out that there is an inherent degeneracy which cannot be overcome with this method, "originating from the fact that planets of differing compositions can have identical masses and radii."
This is further exacerbated when they expand their models to include four-layer structures with the aim of handling a possible H/He gas layer.
This approach, however, is completely independent of any constraints from planet formation hypotheses.
Perhaps a better chance of correctly modelling these planets may come from incorporating knowledge of their host stars, or of formation conditions in the protoplanetary disk.
For example, planet occurrence is known to correlate with stellar metallicity.^[@Fischer2005]

Next-generation surveys promise improved measurements of mass and radius.
Many of the approximations made in interior models were based on the fact that the uncertainties in mass and radius were large enough that the temperature variation could be discarded.
However, current observations can already constrain these values to a few percent for the best-studied targets, and new surveys like \smallcaps{TESS}, \smallcaps{CHEOPS}, and \smallcaps{PLATO} will provide high-quality observations for many more.
\smallcaps{TESS} is expected to detect "hundreds of super-Earths ($1.25$--$2\,$R$_⊕$)" and provide asteroseismological measurements for thousands of stars.^[@Ricker2014]

Finally, with new observations comes the potential to use data in new ways.
For example, transit observations could be used to constrain the mass of a planet.^[@DeWit2013]
Polarimetry measurements could provide more information about particulate matter in the atmosphere or surface properties.^[@Madhusudhan2014]
And by taking measurements of repeated transits, we could gain information on the planetary Love number, a measure of central concentration.^[@Maxwell2011]
From this we should take away one key point: the observations are getting better, and so our modelling capabilities must match them.


## Heated watery super-Earths

One of the most interesting classes of planets today is the class of super-Earths, planets with masses between $1$ and $10\,$M$_⊕$.
With no analogues in the solar system, it is not known whether they are scaled up rocky planets or scaled down Neptunes.
About 40 super-Earths with measured masses and radii are currently known.
Their radii range from $1$ to $7\,$R$_⊕$.^[This number is taken from the [exoplanets.org](http:///www.exoplanets.org) database (confirmed planets only).]
With the potential to have moderate atmospheres and plate tectonics, super-Earths represent an important class of planets in the broader context of planetary diversity and planetary habitability.^[@Haghighipour2011; @Baraffe2014]

Above, I highlighted recent observational advancements that have led to increasingly precise measurements of masses and radii of these small planets.
Such measurements are being used with internal structure models to place constraints on the interior compositions of super-Earths.
Many planets are well-described by multi-layer models consisting of iron, silicates, and water^[e.g. @Valencia2006; @Fortney2007; @Sotin2007; @Seager2007] and others have included layers of hydrogen or other volatiles to explain the inflated radii of some super-Earths.^[e.g. @Rogers2010; @Lopez2012]
Given the high-precision radii measurements, it is now important to quantify the dependence of predicted radii of super-Earth models on the various model assumptions.

### The equation of state is a key component of these models

Correctly determining the interior structure and evolution of planets relies on a strong knowledge of the equations of state of the relevant materials.
This is not an easy task, because the temperature and pressure ranges relevant to planetary interiors are often inaccessible to experiments, even recent diamond-anvil and shock wave experiments.
Obtaining data for combinations of state variables off the Hugoniot (shock curve) can be difficult.^[@Nettelmann2008]
As @Baraffe2014 note, we must "rely on simulations to infer the iron melting curve for Earth, super-Earth and giant planet conditions".
However, these simulations are computationally expensive and so this is an area that is still developing.
For this reason, many authors choose to use simplified forms of the equations of state in calculating their models.

The most common simplifications of equations of state are semi-analytic forms such as that presented by @Vinet1987 (the "Vinet EOS"), @Birch1947 (the "Birch-Murnaghan EOS" or "BME"), and @Poirier1998 (the "logarithmic EOS").
These are generally parametrised by values such as the bulk modulus of the material and its derivative.
The parameters are then fitted to experimental measurements of the pressure and volume, and so are described as "universal" equations of state.^[@Vinet1987]
These simple prescriptions cannot capture all the behaviour of every material, although they are generally good approximations for most.

In addition to being approximations to experimental data, most of the prescriptions used are temperature-independent for two reasons.
First, the temperature dependence can be difficult to measure experimentally, especially at thousands of degrees.
Second, including temperature dependence in the EOS generally does not result in differences greater than a few percent in the bulk composition (mass/radius) of the planet.^[@Seager2007]
Therefore, an important question to ask ourselves is what we can gain from investigating the equation of state.

  ### Water's thermal properties may lead to interesting structure

The degree to which thermal structure may affect the properties of a water-rich planet has not yet been well studied.
Super-Earth planets with significant water layers, sometimes called waterworlds, provide an interesting testbed for our investigation.
They may display more significant variation in their properties, both observable and internal, than purely Earth-like (iron and silicate) planets.
They are therefore a worthwhile target for study.

Water presents an opportunity to assess thermal effects in a material that has a rich and interesting phase structure across a large temperature and pressure range ([@fig:water-phases]).
At low temperature and pressure, water exists as a liquid, vapour, or solid (Ice Ih).
At high pressure, it takes on a number of alternate ice forms (Ice V, VI, VII, X, etc.)^[@Choukroun2007]
It can also exist as a low-density supercritical fluid or superheated vapour.
This all means that the behaviour of water layers is thermally interesting.
The behaviour of water is also strongly linked to questions of habitability because Earth-sized solid planets with oceans provide the best approximation to the one planet known to harbour life.

![
  Phase diagram of water.
  Water has a rich and interesting phase structure.
  Here I show some of the key phases which are relevant when modelling a watery planet: liquid, vapour, and solid ice Ih, but also more exotic phases such as the high-pressure ices.
  Lines mark the boundaries of each phase.
  --- *Data from @Choukroun2007 and @Wagner2002*
](water_phases_fig){#fig:water-phases}

> TODO: redraw [@fig:water-phases] to match visual style

Others have previously investigated the structures of planets containing a significant water component.
For example, @Ehrenreich2006 studied the internal structure of the exoplanet OGLE 2005-BLG-390Lb, modelling the phase changes throughout.
@Zeng2014 chose to explore evolutionary effects, following the phase transitions within model water-rich planets.
They comment that "[phase] transformations may have a significant effect on the interior convective pattern and also the magnetic field of such a planet, but they may only affect the overall radius slightly."
Our present study addresses the question of exactly how much temperature variations affect the structure and radius of water-rich planets and whether such effects are observable.

In summary, water is an interesting test case for assessing how the thermal behaviour of the equation of state may affect the observable properties of a planet.
And although it is certainly not the only component of interest, the potential for planets with large water layers means that it is worthwhile investigating.

> TODO: more detailed argument as to why watery planets are worth focusing on?

## This dissertation

In this chapter I have given an overview of recent work in exoplanet detection and characterisation.
I have shown that, although the field is driven by observations, we need good models to interpret these observations.
These considerations therefore naturally motivate the development of interior structure models.
Finally, I have identified planets with thick water layers as being interesting targets for questions about heating and thermal effects.

The aim of this dissertation is therefore to improve our understanding of waterworlds.
In particular, I wish to answer the following questions:

- Does a more complete treatment for water's equation of state lead to differences in the interpretation of models of when compared to the zero-temperature case?
- How strongly are observable properties of the planet affected by its environment? Does this change what we might assume about the habitability of such a planet?
- Can we predict the thermal structure of watery super-Earths?

\noindent The remainder of this dissertation presents five items of work towards these aims.

I begin\marginnote{
  \Cref{sec:an-improved-water-equation-of-state}
  \par\noindent "An improved water equation of state"
} by presenting a newly synthesized equation of state for water that includes a full treatment of temperature dependence.
I explain where I drew the data from, how I constructed it, and the features that make it suitable for planetary modelling.
By comparing this to the equations of state used in other studies, I show that I have produced a more comprehensive and up-to-date coverage of the behaviour of water in the temperature and pressure ranges relevant to planetary interiors.

Next\marginnote{
  \Cref{sec:watery-planet-interiors}
  \par\noindent "Watery planet interiors"
} I explain the theory of planetary interior models.
I describe my code, \smallcaps{OGRE}, which solves the equations of planetary structure in a self-consistent fashion and treats the temperature structure of the planet appropriately.
After incorporating my water equation of state into these models, I produce multi-layered planet structures for super-Earths with large water layers.
I also validate these models against some previous results.
This chapter concludes by exploring how strongly the radius of a watery super-Earth is linked to its water fraction, surface temperature, and other model parameters.

I then\marginnote{
  \Cref{sec:heating-and-the-atmosphere}
  \par\noindent "Heating and the atmosphere"
} present an approach for understanding how different heating modes may alter a planet's size.
I extend the models from the previous chapter to include a diffuse atmospheric layer, using two different approaches for comparison.
By linking the external boundary conditions to the planet's internal and external heating, I show that the amount of energy required to significantly inflate these watery planets is very modest.

To wrap up\marginnote{
  \Cref{sec:phase-structure-and-migration}
  \par\noindent "Phase structure and migration"
} my theoretical development of planetary structure, I turn to the question of how a planet's internal structure is altered by this heating.
Using the information on the phases of water contained in my equation of state, I produce structural diagrams for watery planets.
I show how different heating scenarios may alter this structure, and construct some toy migration scenarios to investigate how it may change over time.
This chapter finishes by considering some potential astrobiological implications of different phase structures for these ocean planets.

Finally, we have recently\marginnote{
  \Cref{sec:a-water-rich-super-earth}
  \par \noindent "A water-rich super-Earth"
} had the opportunity to apply these models to a super-Earth with a suspected water detection. I present what results we have on this topic.
