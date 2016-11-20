# Phase structure and migration

Having constructed models of watery planets and examined how they change size with different modes of heating, another desirable step is to see how the actual structure of the planet changes.
This could be important for several reasons.
The phase of water affects its geophysical properties.
Different phases of ice may TODO: filled clathrate example.
And this may all have astrobiological consequences (which I briefly discuss at the end of this chapter).
It is therefore useful to have some grasp on how varied the internal structures of these planets can be.

> TODO: references for the above

To visualise the phase structure of a planet requires a few additional steps:

- we need to link the planet's surface temperature to the planet--star system;
- we need the pressure and temperature throughout the planet model;
- we need to link that pressure and temperature to its corresponding phase;
- and we need to choose a way of representing that information visually.

Thankfully, this was a relatively easy task.
The first item is a simple equilibrium temperature calculation; the pressure and temperature are available from my structural models; and I had the foresight to include information on the phases of water in my equation of state.
In this chapter I therefore present visualisations of planets at different distances from a host star.

Visualising the phase structure of these planets has several additional benefits.
It provides a sanity check

With the phase struct

I have

## Phase transitions

A phase transition is a discrete change in the  




### Determining the phase structure of a planet



### Differentiation

## Migration

### Irradiation




### Planet heating and structural change

I constructed planetary models for...

In [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth] I show two key results.
The first is how the radius of a watery planet changes with distance to its host star.
The second is the phase structure of these planets.

I have chosen to represent the phase structures of the planets as a colour-coded cross-section through the planet's interior.
Therefore I also provide [@fig:phase-key] as a key to the colours and scale of [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth].
These figures show several quantities at a glance:

- the relative size of heated watery planets
- the similarity or otherwise of the structure of their water layers
- ...

![
  Key to [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth].
  The dotted lines show 1, 2 and 3 Earth radii and the black line shows the planet's transit radius.
  Coloured layers show the phase structure of the planet.
  This key only shows the phases present in the majority of my models;
  any other phases are labelled where they appear in [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth].
](phase-key){#fig:phase-key}



![
  *Top panel:* Heated planets are larger, but how close does a watery planet need to be to its host star to grow significantly?
  Here I show the radius of a $1\,$M$_⊕$ watery planet (30% water by mass) at several different distances and with several different core energy generation rates.
  Such a planet can grow by 10% or more if it is moved from $1\,$a.u. to $0.1\,$a.u.
  There is also a kink in the curve for the lowest internal energy generation rate ($10^{-18}\,$W$⋅$kg$^{-1}$) near $1\,$a.u.
  This is caused by a transition to cold ice and liquid, causing a sharp change in radius (see below).
  *Bottom panel:* What do the interiors of these planets look like?
  Here I show structural diagrams for the models indicated with circles in the top panel.
  See [@fig:phase-key] for the colour key.
  The relative positions of the models are maintained.
  For example, the top red line in the top panel corresponds to the top row of models in the bottom panel.
  In almost all of these cases, the planets have a thick water vapour atmosphere.
  Deeper within the planet, the atmosphere transitions directly to superionic fluid and possibly plasma.
  The only exception is in the case of a cold planet at $5\,$au, which has a liquid layer around an ice VII shell.
](migration-1Mearth){#fig:migration-1Mearth}

![
  As in [@fig:migration-1Mearth], but for a $3\,$M$_⊕$ planet.
  Comparing to [@fig:migration-1Mearth], we see that the $3\,$M$_⊕$ planets can actually be smaller than the $1\,$M$_⊕$ planets, at least where there is moderate internal or external heating.
  This is the upturn at the low-mass end of the mass--radius relation that I discussed in @sec:heating-and-the-atmosphere.
](migration-3Mearth){#fig:migration-3Mearth}

![
  As in [@fig:migration-1Mearth; @fig:migration-3Mearth], but for a $5\,$M$_⊕$ planet.
](migration-5Mearth){#fig:migration-5Mearth}

![
  As in [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-10Mearth], but for a $10\,$M$_⊕$ planet.
  The radius--distance relation is much flatter for these higher-mass planets.
  Looking at the phase structures, we can see why: they have much thinner atmospheres.
  As it is the low-density atmosphere that is most responsive to temperature changes, these planets grow less when heated than a lower-mass planet would.
](migration-10Mearth){#fig:migration-10Mearth}

> TODO: Label [@fig:migration-1Mearth; @fig:migration-3Mearth; @fig:migration-5Mearth; @fig:migration-10Mearth] with

> TODO: Add density gradient plots as well?

## Astrobiological implications
