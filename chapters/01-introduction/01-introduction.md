# Introduction

\newthought{Not many discoveries} have ever captured the imagination of scientists and non-scientists alike as much as exoplanets.
Until 1995, we had only the ground under our feet and a select few lights in our sky to guide our understanding of planetary systems.
Now we are faced with almost an over-abundance of planets, with papers and press releases trumpeting more every week.

Astronomers who work in the young field of exoplanet astronomy are blessed (or cursed?) with a rapidly increasing amount of data.
In the 20 years since the first exoplanets were found, ground- and space-based missions have provided hundreds and hundreds of exoplanetary detections.
This prodigious increase in the number of known extrasolar systems owes its existence to improved light-gathering ability, instrumentation, and analysis techniques.
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
In this chapter we take scope of recent work in a field that has yet to see its twentieth birthday, leading to the motivation for the primary focus of the dissertation: models of watery super-Earths.

## Background

\newthought{Why do exoplanets} appeal to so many people?
Once we made the connection between our Sun and the other stars we see, finding planets around them was never going to be a surprise.
Yet since the discovery of the first exoplanets using pulsar timing^[@Wolszczan1992] and radial velocity^[@Mayor1995], the field has become very popular indeed.

Many authors would claim that the ultimate goal of exoplanetary research is to detect the bio-signatures that would indicate a habitable planet, as in the review of @Seager2010.
Others are interested in characterising exoplanets for the insights this may offer us about our own solar system and its place in our universe.
For example, @Raymond2013 notes that "planet formation models lag behind observations", so observing exoplanetary systems provides an opportunity to expand and test our formation models.
Since the Earth is just a planet, the reasoning goes, any model which correctly explains how planets form will tell us more about our origin as well.^[See, for example, @Mordasini2014.]

To do this, a wide range of skills are needed.
Perhaps this is why the field is so popular: it demands clever observations with new technology, improved data reduction techniques, and a solid theoretical background.
So in order to know what problems are worth pursuing, it will help us to briefly review what is currently achievable in exoplanet science.

### The field is driven by observations

\begin{marginfigure}
  \includegraphics{exoplanet-discoveries-transit}
  \caption[Thousands of planets have been found by the transit method]{Thousands of planets have been found by the transit method, largely thanks to the Kepler mission's data releases in 2014 and 2016.}
  \label{fig:exoplanet-discoveries-transit}
\end{marginfigure}

\newthought{Exoplanetary science,} like most fields of astronomy, is driven by observations.
This should come as no surprise, and so it is a point we will not dwell on for too long.
And although much of the formalism for understanding exoplanets initially carried over from our understanding of binary stars, it was the detection of the first extrasolar planets that drove the theoretical work behind improvements in the detection techniques.
This includes better transit modelling, dynamical studies of systems, and instrumental design which is allowing improvements like high-contrast direct imaging.

\begin{marginfigure}
  \includegraphics{exoplanet-discoveries-rv}
  \caption[The radial velocity method produced many early exoplanet discoveries]{The radial velocity method produced many early discoveries of hot Jupiters.}
  \label{fig:exoplanet-discoveries-rv}
\end{marginfigure}

In particular, observations of exoplanets have raised a host of questions, most of which we could not have predicted based on our own solar system.
The questions span atmospheric science, chemistry, geology, and solar system dynamics.
Why do we see so many Jupiter-mass planets with inflated radii?^[@Baraffe2010; see also @fig:mass-radius]
Can we expect to see systems with binary planets, where two planets have captured each other through tidal interactions?^[@Ochiai2014]
How do hot Jupiters---gas giants orbiting very close to their host star---form and end up where they are?^[@Seager2010]
How do the systems we see fit with our understanding of planet formation, evolution, and dynamics?^[@Mordasini2012a]
And finally, what do we need to do to find an Earth-like planet, how will we know when we've done so... and how many might we expect to find?^[@Petigura2013]

### Detection methods

\begin{marginfigure}
  \includegraphics{exoplanet-discoveries-other}
  \caption[Other methods of finding exoplanets also exist]{Other methods of finding exoplanets also exist, but comparatively few exoplanets are found these ways.}
  \label{fig:exoplanet-discoveries-other}
\end{marginfigure}

\newthought{A number of different} techniques are used to detect exoplanets (@fig:exoplanet-discovery-methods).
After claims in the early 90s of planet detections around pulsars,^[@Wolszczan1992] the first extrasolar planet around a Sun-like star was found using the radial velocity method described below.^[@Mayor1995]
However, in the past few years, the transit method has produced the largest number of new exoplanets.
Here we summarise different methods of exoplanet detection and the observable information that can be gained from each. This will be important shortly when we consider what directions the field is moving based on these available data.


\newthought{The radial velocity} (RV) or Doppler method entails using spectral Doppler shifts to measure the recoil motion of a star as a planet orbits it.
The formalism for finding planets using radial velocity has carried over from the older field of binary star research, and the information that can be gained about a star-planet system is very similar.
Using Doppler measurements of the recoil motion of the star, the *mass function*,\marginnote{
  The mass function is defined as
  $$ {\left(M_p \sin i \right)^3 \over \left(M_p + M_*\right)^2}. $$
  Here, $M_p$ is the planet mass, $M_*$ is the stellar mass, and $i$ is the orbital inclination.
  }
which relates the planet's mass to the star's mass, can be calculated.^[@Wright2012]

The RV method has the advantage that it works with a wide range of inclinations, not just those near $i=90°$.
This is counterbalanced by the fact that there is an inherent degeneracy between inclination and planetary mass in the $M_p \sin{i}$ term of the mass function.
It is therefore only possible to measure the minimum mass unless some constraint can be placed on $i$.
The Doppler method is also useful for detecting multiple planet systems.
Once the signal of one planet has been found, it can be removed and the system re-analysed to search for more planets.
In the case of certain large, bright planets, the emission lines from the planet itself may be used to directly measure the planet's motion and obtain its mass.^[@Rodler2012]

Although this method is distance-independent and easily detects large planets close to their host stars, it is not as suited for large surveys since a spectroscopic observation is required.
A number of sources of contamination---stellar and magnetic activity, stellar rotation, telluric lines, moonlight, faint companions---must also be accounted for.^[@Seager2010b; @Haswell2010]

As can be seen in Figure \ref{fig:exoplanet-discoveries-rc}, the Doppler method was responsible for the majority of exoplanet detections until 2010.
However, the advent of large photometric surveys like Kepler favoured a different method for finding exoplanets, known as the transit method.


\begin{marginfigure}
  \includegraphics{margin}
  \caption[Schematic light curve of a transiting exoplanet]
  {In this schematic of a primary transit, we see a dip in the light curve of the star as the planet passes in front of it. Secondary transits, where the light from the planet is occulted by the star, are smaller.}
  \label{fig:schematic-transit}
\end{marginfigure}
\newthought{The transit method}---where the planet moves between us and its host star (@fig:schematic-transit)---is an intuitive way of spotting planets.
We will not elaborate on the mechanics of a transiting system except to point out that the probability of observing a transit and the expected decrease in the observed flux are both very small.
The transit probability for a circular orbit is approximately ${R_*/a}$, where $R_*$ is the stellar radius and $a$ is the radius of the orbit.
Similarly, ground-based surveys are able to resolve flux decreases on the order of 1\%, while space-based surveys can detect transit depths on the order of $10^{-4}$.
The greatest gains in the number of known transiting planets have therefore come from systematic surveys of many stars.
These surveys are capable of yielding planets on the order of $R_⊕$.^[@Perryman2011, p. 103]
This lower limit is constantly being pushed downwards.
For example, Kepler-37b was discovered by the transit method; later observations and asteroseismologial analysis suggest that its radius is around $0.3 R_⊕$.^[@Barclay2013]

The transit method can provide a significant amount of information about the transiting planet as well.
From the observables of period, ingress and egress time, equatorial crossing time, and flux depth, the transit method provides an immediate radius ratio.
When combined with radial velocity measurements, the mass and radius of the star and planet can be measured.
There is a one-parameter degeneracy^[@Wright2012], which can be broken if more is known about the host star through parallax, spectroscopy, or theoretical mass-radius constraints.
Transit information may also inform estimates of planetary surface gravity^[@Southworth2007] and host star density^[@Wright2012].

However, there are several sources of uncertainty.
In addition to the expected systematic and random errors in photometry (instrumentation, telluric variability, observing conditions, and stellar properties like surface brightness variations), transit surveys have a high false positive rate.^[@Cameron2012]
This is because eclipsing binaries, brown dwarf companions, background eclipsing binaries and background exoplanet transits can all produce similar photometric signals.

To handle this possibility, the detections must be validated.
A detection can be considered good if a wide variety of possible alternate events are also modelled and the probability of each is deemed low enough.
Follow-up observations using other methods are key to rejecting false positives and further constraining the system.
For example, the validation technique used by the Kepler team is called \smallcaps{BLENDER}^[@Fressin2011] and makes use of such observations; these could include high-resolution spectroscopy, infrared photometry, or speckle/adaptive optics imaging to constrain or rule out the possibility of a multiple stellar system.
Finally, radial velocity measurements can probe the transiting object's mass, and can confirm that it is comparable with that of a planet.


\newthought{A number of other methods} for detecting planets are also listed in Figure \ref{fig:exoplanet-detection-methods}.
The first of these uses timing information, a method which resulted in some of the earliest exoplanet findings.^[@Wolszczan1992]
This was possible because the exoplanets in question orbit the millisecond pulsar PSR1257+12.
The precise period of pulsars means that the gravitational effect of a planet is measurable, even for planets down to $0.1 M_⊕$.
"Timing" can also be used in another sense: if a transiting exoplanet is known, variations in its time of transit can indicate an unseen planet elsewhere in the system.
Timing methods give information on masses but little else.

\begin{figure}
    \includegraphics{normal}
    \caption[Sample images of a non-planetary microlensing event followed up by Hubble]
    {In a microlensing event, a background source star (top left panel) brightens for a short time as its light is focused on us (bottom left panel). Here, Hubble's Wide Field and Planetary Camera has been used to follow up the observation to resolve the source star. Planets may be detected around the lensing star if the additional effect of their gravitational field changes the shape of the light curve. The effect can be relatively large if the light path happens to cross a \emph{caustic}, a discontinuity or rapid change in the lensing pattern. --- \emph{NASA HST/WFPC2}}
    \label{fig:microlensing-event}
\end{figure}

Planets may be found during microlensing events (@fig:microlensing-event).
If a planet lies in the right region during the lensing event, the planet's gravity will further perturb the incoming light and cause a detectable deviation from the single-lens case.
In most cases, microlensing detections do not provide much additional information.
The single lens event itself provides a weak constraint on the lens mass, and the addition of a planet gives a mass ratio and a projected separation.
Together, these provide essentially no constraint on the orbital elements of the system^[@Wright2012].
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

\newthought{All these methods} provide us with different information, and none of them is perfect.
In many cases, the information gained from one of these methods is only enough to identify the presence of the planet.
In \S\ref{the-transit-method}, we saw that this is often not enough---Kepler requires a statistical validation method due to the possibility of contamination from events that look similar to a transit.
As well as demonstrating the relative difficulty of identifying clear transit events in data that can often be quite noisy, it also highlights the difference between *validating* and *observationally confirming* the presence of exoplanets.
The second is more direct, but requires a radial velocity or transit timing variation measurement.
As @Fressin2011 note, "many of Kepler’s smaller candidates will receive a similar [validation] treatment since dynamical confirmation may be difficult or impractical with the sensitivity of current instrumentation."
It therefore became apparent as large scale surveys were being constructed that clever strategies for validation were needed.^[For example, see @Tingley2005.]

Identifying the presence of a planet is one thing, but characterising it is quite another, and this is where the field has been moving.
A primary driver of this work is the quest to find a habitable planet, but the definition of habitability is fraught with difficulty.^[@Gaidos2005]
Do we accept any Earth-like planet in the habitable zone of any star---that is, the region where we might expect liquid water to exist on the surface? Do we restrict ourselves to Earth-like planets around Sun-like stars? What observational signatures might we expect from a habitable planet? Here, we begin to see a strong overlap with other areas of science such as atmospheric physics, planetary science, geology, and even biology.
In order to understand more about the planets themselves, we turn to other methods to allow us to retrieve more information.
The key development in this area has been the use of transmission and reflection spectroscopy, which attempt to separate the star's light and the contribution from the planet.^[@Charbonneau2002; @Charbonneau2005; @Deming2005]

### Observations motivate models

## Internal structure models

### Interior structures are the new frontier

### We can model rocky planet interiors precisely

### Accuracy is difficult because of structural degeneracies

### These models are still useful

### Observational constraints are increasingly strong

## Heated watery planets

### The equation of state is a key component of these models

### Its thermal properties may lead to interesting structure

## The structure of this dissertation

## Definitions used in this dissertation
