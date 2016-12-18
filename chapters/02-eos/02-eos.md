# An improved water equation of state

The most important piece of information that we require when making a planetary model is the *equation of state* (EOS).
We have a choice of several approaches for the planetary model itself, which I will discuss in @sec:watery-planet-interiors.
But no matter how we go about modelling the planet, we require some information about the properties of the materials that comprise it.
More specifically, we require a relationship that specifies how the density of a material varies with pressure and temperature.
Such a relationship is the equation of state.

As the goal of this study was to investigate thermal effects in watery planets, I required a temperature-dependent equation of state for water.
This allowed me to treat thermal expansion self-consistently in my models.
However, no available equations of state met my requirements; I therefore synthesized a new equation of state for water from the best available experimental and theoretical data over a wide range of pressure and temperature.

In this chapter I provide an overview of the equations of state used in interior modelling so far.
After explaining why none of them are suitable for the work I did, I then present my improved equation of state for water.
I explain the process of compiling this equation of state, show how it is an improvement on previous work, and discuss the difficulties that arose when dealing with several disparate sources of data.


## About the EOS

\marginnote{
  \begin{equation}
    ρ = f(P, T) \label{eq:equation-of-state}
  \end{equation}
  The equation of state. The function $f$ may be analytic or it may require looking up or interpolating between values in a table. The equation may also be written in an inverted form:
  \begin{equation}
    P = g(ρ, T) \label{eq:equation-of-state-inverted}
  \end{equation}
  depending on how the data is presented.
} The equation of state is a relationship between pressure $P$, temperature $T$ and density $ρ$ (@eq:equation-of-state).
The definition of an equation of state allows that it might also specify relations between other thermodynamic state variables; these include the specific heat capacities $c_p$ and $c_v$ and specific energies like the internal energy $u$ or entropy $s$.
But in this context I use it to refer to the relationship between the set of values $(P, T, ρ)$, which are the key values required for a one-dimensional planetary structure model.

To calculate the temperature gradient\marginnote{
  \begin{equation}
    c_p = h(P, T) \label{eq:heat-capacity}
  \end{equation}
  The specific isobaric heat capacity can also be represented in a similar form to \cref{eq:equation-of-state}. It is required to calculate the temperature gradient in the planet.
} also requires the specific isobaric heat capacity $c_p$, and so associated with this equation of state I include the heat capacity as a function of pressure and temperature.

Many potential expressions for the equation of state exist, spanning all phases from gas to plasma.
Depending on its source and the material it represents, the equation of state may be expressed in a simple functional form or it may be more complicated than this.
So-called universal equations of state take advantage of the fact that different materials behave in a common way under certain conditions.
The best-known one is probably the ideal gas law,\marginnote{
  The ideal gas law,
  \begin{equation}
    P = ρRT \label{eq:general-ideal-gas-law}
  \end{equation}
  links three state variables: pressure $P$, density $ρ$ and temperature $T$. The material's properties are encoded by the specific ideal gas constant $R$, defined as the ratio $\bar R/M$ where $\bar R$ is the universal gas constant ($\bar R = 8.314\,$J$⋅$mol$^{-1}⋅$K$^{-1}$) and $M$ is the molar mass of the material.
} but others exist too: for example, there exist cubic equations of state which can partially account for the liquid--vapour transition, and the behaviour of solids when heated is often parameterised by including the material's thermal expansivity in its equation of state.
The ideal gas is one of the simplest possible equations of state; the complexity of the equation of state can be increased indefinitely.

Above, I used the word "universal" to describe equations of state, but in reality there is no such thing.
No equation of state accurately captures the behaviour of any material in all situations.
Though some approximations are good for certain phases or limits, a planetary model spans many orders of magnitude in temperature and pressure from the top of the atmosphere to the centre of the core.
Real materials also have phase transitions between different states of matter, and these manifest themselves as discontinuities in the density surface.

### Where do EOS data come from?

Because no true universal equation of state exists, it is inappropriate to use just one equation of state in a planetary model.
And despite progress in both experimental measurements and *ab initio* theoretical calculations, there is still no all-encompassing equation of state database for all of the minerals of interest in planetary interiors.
Perhaps the closest to our intended goal is \smallcaps{SESAME},^[@Lyon1992] the Los Alamos National Laboratory equation of state database.
But US regulations preclude the distribution of \smallcaps{SESAME} to foreign nationals and so we were unable to access it.^[A frustrating display of political barriers to research.]
Instead we must maintain several different equations of state for each different material, choosing appropriately from among them depending on the chemical composition, pressure and temperature.

Previous studies have approached the problem of there being no centralised database for equations of state by stitching together other equations of state which are valid for different pressure regimes.
Although the choice of the exact equations has varied as new experimental data were released, few of these studies included thermal expansion.
They included several different materials of interest for planetary interiors: water ice, iron, and silicates.
For example, @Seager2007 took this approach with water, combining three temperature-independent equations of state for ice VII:

- the Birch--Murnaghan equation (BME)\marginnote{Where abbreviations are used in this chapter, \cref{tbl:eos-abbreviations} indicates their origin.} of state at low pressures,
- density functional theory (DFT) calculations at intermediate pressures and
- the Thomas--Fermi--Dirac (TFD) model at very high pressures.

[^abbrevs]: Where abbreviations are used in this chapter, @tbl:eos-abbreviations indicate their origin.

\noindent The piecewise function defined in this way is therefore appropriate over a wide pressure range.

This pressure piecewise approach neglects temperature dependence in the equation of state but provides a robust approximation that is easy to evaluate.
In some cases, stitching the data in this fashion has revealed that a simpler functional form works just as well.
For example, this is the case for the *polytropic equation of state*.^["[T]he common building blocks of solid planets all have equations of state that are well approximated by a modified polytrope of the form $ρ = ρ_0 + cP^n$" [@Seager2007]]
Such simple functional forms for the equation of state have been used successfully to model planets as cold spheres since the work of @Zapolsky1969.
In other cases, a more detailed functional form is needed to capture the behaviour of the material fully; this is especially true if it undergoes phase transitions.
For example, the IAPWS formulation^[@Wagner2002] uses a complicated series of equations fitted to various sources of experimental data for the behaviour of water in the vapour and liquid phases.

--------------------------------------------------------------------------------
Equation of state   Source
------------------- ------------------------------------------------------------
ANEOS               @Thompson1972

BME                 Birch--Murnaghan equation of state; see @Poirier2000

DFT                 Density functional theory; refers to theoretical
                    calculations which multiple authors have performed

H$_2$O-REOS         @Nettelmann2011; includes IAPWS, SESAME, @French2009,
                    @Feistel2006

IAPWS               @Wagner2002

LM-REOS             @Nettelmann2008 (precursor to H$_2$O-REOS)

MGD                 Mie-Grüneisen-Debye thermal pressure expansion;
                    described in @Sotin2007

SESAME              @Lyon1992

TFD                 Thomas--Fermi--Dirac; described in @Salpeter1967

Vinet               @Vinet1987
--------------------------------------------------------------------------------
Table: Sources for the abbreviated equation of state designations used in this paper. {#tbl:eos-abbreviations}

In an ideal world we would simply measure the density (and other state variables) of the material for all relevant pressures and temperatures.
But there are two issues that make this approach untenable.
First, many of the temperatures and pressures relevant to planetary interiors are outside the reach of experiments for now.
Second, even in the cases where they are accessible, it is often only via dynamic shock experiments rather that static compression experiments.
Such dynamic experiments may not be appropriate for understanding the behaviour of materials under static pressure.
In practice, we therefore choose experimental data for our equation of state where appropriate, and use different sources of data to fill in other regions.

Where do these other sources of data come from?
I surveyed\marginnote{
  \citet{Howe2014} completed a similar exercise, providing an overview of previous equations of state chosen to model planetary interiors. But they dealt mostly with equations of state for other materials like iron and silicates.
} previous works that deal with internal structure, focusing exclusively on the water equations of state across all its phases (@tbl:eos-sources). In order of complexity (and therefore their potential ability to capture the behaviour of the mineral), these equations of state are:

- Simple semi-empirical analytic^[By this I mean that the equation of state is of a fixed functional form, but the function is parameterised by one or more parameters that are tuned based on measurements of the material.] prescriptions like the Birch-Murnaghan equation of state (BME), Vinet equation of state, or power laws;

- Theoretical high-pressure equations of state like the Thomas-Fermi-Dirac formulation (TFD), which produce results applicable in the high pressure regime;^[The ideal gas equation of state is similar in that it can be derived based directly on statistical mechanics, rather than being measured for each gas.]

- Quantum molecular dynamics simulations from first principles;

- Complicated empirical analytic prescriptions, such as the work of the International Association for the Properties of Water and Steam (IAPWS) or the US national laboratory databases such as ANEOS and SESAME, plus tables of values taken from these; and

- Fully experimental data sets generated from shock wave compression or diamond anvil experiments.^[Diamond anvils are used to compress samples of material, measuring among other properties their density, up to pressures in the GPa range and higher. By adding resistive coils to the anvil or heating the sample with lasers, temperatures up to several thousand K can also be probed [@Mao2007]. Dynamic compression experiments, including shock compression, are also used to measure the equation of state at high temperatures and pressures [@Asimow2015].]

--------------------------------------------------------------------------------
Work(s)                         Water equation of state used
------------------------------- ------------------------------------------------
@Baraffe2008;                   TFD, BME, MGD
@Baraffe2014

@Fortney2007                    Simple power law from @Hubbard1980

@Fortney2009                    H$_2$O-REOS

@Grasset2009                    MGD; Vinet; BME; TFD; ANEOS; @Belonoshko1991

@Guillot1999                    @Hubbard1989

@Howe2014                       Vinet

@Hubbard1980                    Simple power law

@Hubbard1989                    Exponential polynomial EOS without temperature
                                dependence

@Lopez2012                      H$_2$O-REOS

@Madhusudhan2012                BME

@More1988                       Quotidian EOS (ion EOS with Thomas--Fermi model)

@Nettelmann2008                 LM-REOS

@Nettelmann2011                 H$_2$O-REOS

@Redmer2011                     @French2009

@Rogers2010a                    IAPWS; IAPWS extrapolations; TFD

@Seager2007;                    Low-temperature polytropic EOS
@Rogers2010;
@Zeng2014

@Senft2008                      IAPWS; @Feistel2006; @Stewart2005; BME

@Sotin2007;                     BME with thermal expansion (MGD)
@Sotin2010

@Valencia2006                   BME with thermal expansion

@Valencia2010                   @French2009; SESAME

@Vazan2013                      Quotidian EOS; TFD

@Wilson2012;                    DFT
@Wilson2013

@Zeng2013                       @Frank2004; @French2009; TFD
--------------------------------------------------------------------------------
Table: Previous studies on planetary interior structures use a variety of equations of state for water. {#tbl:eos-sources}

\newpage

### The role of the water equation of state in planetary models

For the one-dimensional models that we use, the equation of state enters the structural equations in several places.
The first is in the equation of mass continuity\marginnote{
  The equation of mass continuity is
  \begin{equation}
    {dr \over dm} = {1 \over 4πr^2\textcolor{red}{ρ}}
    \label{eq:mass-continuity-with-eos-highlighted}
  \end{equation}
  and the equation for an adiabatic temperature gradient is
  \begin{equation}
    {dT \over dm} = -{T\textcolor{red}{α}Gm \over 4πr^4\textcolor{red}{ρc_p}}
    \label{eq:adiabatic-temperature-gradient-with-eos-highlighted}
  \end{equation}
  where I have highlighted in \textcolor{red}{red} the terms which require the equation of state to calculate.
  These equations are introduced more fully in \cref{sec:watery-planet-interiors}.  
}, which depends on the density $ρ$; the second is in the equation for the temperature gradient, which depends on several quantities: thermal expansivity $α$, density $ρ$ and specific isobaric heat capacity $c_p$.
All of these quantities are provided by the equation of state.

To capture the thermal behaviour of a planet appropriately, an equation of state therefore requires the following properties:

- It must cover a wide range of pressures and temperatures relevant to both a planet's atmosphere and its interior.

- It must provide the heat capacity $c_p$, at least at pressures relevant to the envelope region. In the atmosphere the heat capacity is not required.

- Because the adiabatic temperature gradient lies on an isentrope, the EOS must include enough information to evaluate this isentrope. This could mean providing the entropy directly; however, as we will see, it is sufficient to include the heat capacity.

- It should include temperature dependent density changes wherever possible.

\noindent None of the individual equations of state in @tbl:eos-sources meet all these criteria.
We therefore require an improved equation of state if we wish to model the thermal behaviour of a water-rich planet.

### Motivation for an improved water EOS

![
  Simple zero-temperature equations of state used in @Seager2007.
](simple-eos-comparison){#fig:simple-eos-comparison}

Why do we care about thermal effects in the equation of state?
Although the expression for the equation of state^[@Eq:equation-of-state] nominally includes temperature dependence, only a few studies have attempted to calculate self-consistent planetary models for super-Earths that include a temperature component.^[For example, @Valencia2013]
Many simply use zero-temperature equations of state instead.
And in cases where the temperature has been included, it has often been treated in a simplified manner.
For example, @Zeng2014 use a scaled Neptune adiabat for their internal temperature profile and also use a simplified equation of state that does not include all the thermal behaviour.

The lack of a complete treatment of temperature has been justified by the fact that the thermal expansion effect on an equation of state is minor compared to the pressure.
@Seager2007 find that "water ice VII density changes by less than a few percent" up to $800\,$K.
However, they do not include the high-pressure ionic and plasma fluid phases in this, and say that "[m]ore work needs to be done to quantify the thermal pressure effects above $250\,$GPa and in the ionic phase".

With the knowledge that precisions on the order of a few percent in mass and radius are attainable by current and upcoming observational campaigns, I argue that the role of thermal effects in these types of planetary models needs to be further investigated.
This need is especially apparent when we consider the phase structure of water and its volatile nature.
Not only can water vaporise easily, changing density suddenly across the liquid--vapour boundary, but it also has a rich phase structure at higher pressures and temperatures too.
The volatile nature of water also means that it is also difficult to separate it into "atmosphere" and "envelope" layers and draw an artificial boundary in terms of pressure.
See @sec:heating-and-the-atmosphere for further discussion on this: in that chapter I incorporate an atmospheric layer into my models and present an approach for resolving this difficulty.

In the introduction I argued that watery planets are interesting; here I have argued that the equations of state used to model them are insufficient.
The next step is therefore to compile an improved equation of state for water in the range of temperatures and pressures relevant to planetary interiors.
It is this task that I turn to in the remainder of this chapter.


## How I collected and synthesized the data

I compiled a pressure--density--temperature relation\marginnote{
  The final equation of state database can be found online at \href{http://www.github.com/swt30/WaterData.jl}{github.com/swt30/WaterData.jl}
} for water across a range of pressures and temperatures, drawing from a number of the sources of data listed in @tbl:eos-sources.
I extended the piecewise approach described above to include temperature as a second dimension in parameter space.
My stitched equation of state is valid over a wide domain: its temperature domain is from $275\,$K to $24000\,$K, and its pressure domain is from $10^5\,$Pa ($1\,$bar) upwards.
My approach was similar to that of @Senft2008, who generated a "5-Phase" equation of state across different liquid, vapour, and ice phases.^[@Valencia2010 also constructed a similar equation of state, though using only data from SESAME and the IAPWS formulation.]
However, their work focused on the lower temperatures needed to model impact craters.^[S. Stewart, personal communication.]
I have explicitly included much higher temperatures so as to capture the behaviour of large super-Earth planets: we expect the cores of these to reach thousands of Kelvin.
The sources I used are detailed in @tbl:my-eos.

----------------------------------------------------------------------------------
Equation of state        Type          Region of validity
------------------------ ------------- -------------------------------------------
IAPWS                    Tabular       Vapour and liquid phases;
                                       $0.05$ to $1000\,$MPa
                                       and $252.462$ to $1273\,$K

@French2009              Tabular       Superionic, plasma and high-pressure ice
                                       phases; $79$ to $9.87×10^6\,$MPa and $1000$ to
                                       $24000\,$K. I did not use table VIII from
                                       this work, as these low-density data
                                       disagree with the IAPWS formulation.

@Feistel2006             Tabular       Ice Ih; $0$ to $200\,$MPa and $0$ to $273\,$K

@Sugimura2010            Tabular       Ice VII; $18880$ to $50250\,$MPa
                                       and $431$ to $881\,$K

Vinet + MGD correction   Functional    Ice VII
using parameters from
@Fei1993

TFD                      Functional    Ice X

@Seager2007              Functional    Ice VIII--X transition

@Choukroun2007           Functional    Ices I, III, V, VI; phase
                                       boundaries as specified by @Dunaeva2010

IAPWS extrapolations     Functional    Remaining regions
----------------------------------------------------------------------------------
Table: I used a variety of equations of state in compiling my final EOS.
"Tabular" indicates that I interpolated between values specified in the paper.
"Functional" indicates that I used the functional form given in the paper.
{#tbl:my-eos}

Some of these sources provided data in the form of tables, either in a machine-readable format or inserted directly into a journal article.
Where available, I used the machine-readable information, but otherwise I extracted values directly from the tables in the journal articles.
Other sources provided equations of state using a functional description.
In these cases I implemented the function as given and used the parameters specified in the originating article.
When tabular values were given and the phase of water was specified, I also collected information on the phase and recorded this.
I converted all units to SI units and produced a series of tables, standardising them for easy input into the next stage of the modelling process.

![Data sources in my water equation of state.
  The equation of state covers a wide range of temperature--pressure space.
  Here I show some of the key data sources used and their regions of validity: the IAPWS formulation [@Wagner2002]; theoretical calculations [@French2009]; the piecewise equation of state described by @Seager2007; the Mie-Grüneisen-Debye (MGD) thermal correction approach for ice VII [@Sotin2007]; and measurements for a small region of ice VII [@Sugimura2010].
  I also show the relevant phase boundaries.
](eos-phases){#fig:eos-phase-space}

![Density of my water equation of state.
  Here I show the density variation across the entire pressure--temperature range.
  The density of water is more strongly affected by pressure across the range I consider, but temperature also affects its density too, especially across the liquid--vapour phase boundary and in the supercritical region.
](eos-density){#fig:eos-density}

My equation of state is for pure water only.
Others have investigated how impurities may affect the equation of state and the planet's properties.
For example, @Levi2014 included a methane component in their models, resulting in a new phase of water (filled ice) which changes the planet's thermal profile.
They note that, while neglecting volatiles is an impediment to understanding the planet's atmosphere, pure water models may be sufficient for planetary mass--radius relations.

In selecting the equations of state I was often faced with choices between different sources of data.
The exact behaviour of water at very high pressures is still uncertain and experimental and theoretical results are sometimes in conflict.^[@Baraffe2014]
Ensuring absolute accuracy of the chosen equations of state was therefore a secondary priority.
In general, I preferred more recent data to older data, I prioritised measured and tabulated values over functional approximations, and I chose representations that included temperature dependence over those that did not.
In the following paragraphs, I describe my equation of state choices; these choices are summarised in @tbl:my-eos.

##### Liquid and vapour: {-}
The behaviour of water in the liquid and vapour phases is well understood and plenty of data are available.
I was unable to gain access to the \smallcaps{SESAME} database^[@Lyon1992] because there are restrictions on the distribution of these data to non-US nationals.
Instead, to represent water liquid and vapour, I selected the IAPWS (International Association for the Properties of Water and Steam) formulation,^[@Wagner2002] which provides both tabular and functional data for water in these phases.
These are well-tested and validated by years of experiments.

I implemented the IAPWS functional relationships between temperature, density and pressure.
Where appropriate, I numerically inverted these to give a relation of the form $ρ = f(P, T)$.^[This numerical inversion is described further in @sec:numerical-inversion.]
I then tested these against the tables to verify that we had replicated them correctly.
@Wagner2002 claim that these functional forms can be extrapolated outside the range of the tables.

##### Ice VII: {-}
I explicitly chose a temperature-dependent formulation because I expect ice VII to form a significant fraction of the planet in the cases where the water layer is large.
This temperature-dependent formulation is in contrast to other studies which have assumed that the ice VII layer is isothermal: for example, @Rogers2010a assumed no expansion in any solid layers, choosing to include temperature effects only in the gaseous and liquid phases.

The best temperature-dependent formulation I found for ice VII was the Mie-Grüneisen-Debye (MGD) thermal correction approach^[@Sotin2007].
I used a Vinet equation of state with this thermal correction, taking the coefficients of @Fei1993, within the ice VII region delimited by the phase boundaries of @Dunaeva2010.
However, I preferred the more recent tabulated measurements of @Sugimura2010 wherever these were applicable; these are shown within the ice VII region in [@fig:eos-phase-space].

##### Supercritical fluid and plasma: {-}
@French2009 presented quantum molecular dynamics simulations of high-temperature and high-pressure plasma, ice, and superionic fluid phases of water.
I used their tables in the region beyond $1000\,$K and $1.86×10^9\,$Pa.
This region has also been probed by laboratory experiments thanks to @Knudson2012, who strongly advocate "that [the French equation of state] be the standard in modeling water in Neptune, Uranus, and 'hot Neptune' exoplanets.". These temperatures and pressures are also relevant to the interiors of super-Earths.
I did not use the low-density tables that they presented separately because these differ significantly from the IAPWS results in the same temperature and pressure range.
The IAPWS tables are better tested and a more appropriate choice in this region of phase space.

##### Low-temperature ices: {-}
For completeness, my equation of state also includes low-pressure ice Ih^[@Feistel2006] as well as higher-pressure ices such as ice III, V and VI.
For the latter, I took the phase boundaries from @Dunaeva2010 and used the temperature-dependent formulations for these ices given by @Choukroun2007.

##### Ice X and beyond: {-}
I adopted a temperature-independent piecewise equation of state^[@Seager2007] to describe the transition from ice VII to ice X and beyond.
This does not include any temperature dependence: any behaviour of ice at these high pressures is increasingly theoretical and unconfirmed by experiment.
Temperature effects approach zero at these high pressures anyway ([@fig:eos-contours]), so I used the Thomas--Fermi--Dirac equation of state for all regions beyond $7686\,$GPa which were not covered by one of the other regions listed above.

##### Other regions: {-}
Finally, I filled in all other regions according to the IAPWS formulation or extrapolations thereof.
In practice, the only regions not covered above were low-pressure and high-temperature vapour regions, which I do not expect to be relevant for super-Earth interior models.

### Numerical inversion

The functional forms of the EOS often specify a relationship between variables that is inverted compared to the one that I required.^[Compare @eq:equation-of-state-inverted to @eq:equation-of-state.]
I wrote numerical inversion routines to handle these cases, parallelizing them for greater speed when evaluating large numbers of points in the state space at the same time.

As an example of where this is necessary, let us take the IAPWS data set.^[@Wagner2002]
The paper in which it is introduced provides a functional description of the behaviour of water and steam that is applicable over a wide range
It also provides a narrower set of tabulated values.
Interpolating between the tabulated values is simple, but I also used the functional form of the EOS outside the range of the table.
I based this decision on the claim of @Wagner2002 that the IAPWS formulation extrapolates appropriately outside the range of validity of the table.
In this case I needed to numerically invert the IAPWS EOS outside the tabulated range.

![
  The phase diagram of water around room temperature.
  My final EOS includes the ice phases Ih, III, V, VI, VII, XI and X (both through the high-pressure TFD limit), liquid, vapour, and two theoretical high-temperature phases (plasma and super-ionic) not shown in this figure.
  --- *Adapted from a figure by cmglee on Wikimedia Commons /  [CC-BY-SA-3.0](http://commons.wikimedia.org/wiki/File:Phase_diagram_of_water.svg)*
](water-phase-diagram-complete){#fig:water-phase-diagram-complete}

Numerical inversion can be complicated by phase transitions.
In the region covered by the IAPWS data, there is a phase transition (and therefore a density discontinuity) between liquid and vapour.
This phase transition occurs along a line in $(P,T)$ space called the saturation curve (shown on [@fig:water-phase-diagram-complete]).
This can result in numerical trouble when performing the inversion near the curve (@fig:early-numerical-difficulties).

\begin{figure}
  \includegraphics{early-numerical-difficulties-1}\\
  \includegraphics{early-numerical-difficulties-2}
  \caption{
  Early difficulties dealing with numerical inversion near phase boundaries.
  The density, shown by the colour scale and contour lines, is wrong in some regions in the upper plot, which was generated by numerically inverting the IAPWS equations.
  This is because of the density discontinuity at the vapour--liquid phase boundary, visible here at the very bottom of the plot as the sharp drop in density along the axis from $300$ to $622\,$K.
  The lower plot shows the tabulated data from \citet{Wagner2002}.
  Both plots should match.}
  \label{fig:early-numerical-difficulties}
\end{figure}

> TODO: [@fig:early-numerical-difficulties] could probably be removed (it's not relevant to the end product)

I handled numerical problems like this near phase boundaries by using a bounded root-finding algorithm when solving the inverse equations.
By pinning one end of the bounds to the phase curve and fixing the temperature, I solve a one-to-one inversion problem on either the higher-density or lower-density side of the phase curve.
This prevents the solver from stepping across the curve and obtaining the wrong solution.
I did not expect this vapour-liquid transition region to be of much importance in my interior structure models, at least for the case when the surface is solid and the interior consists mostly of high-pressure ice.
However, accurately handling the behaviour here was important when I later extended the models to include an atmospheric layer.

I specified an order of priority for which EOS to prefer in the case of conflict between sources.
I rely firstly on tabular sources, then functional sources, in the order specified in @tbl:my-eos.
That is, the first valid EOS on that list determines the density at a particular $(P,T)$ pair.

I defined the limits of each EOS patch through the notion of a *convex set*, which is the largest possible region of the state space fully enclosed by a set of points.
The convex set gives a natural interpretation of the area covered by a table of values.
In the case of the low-pressure ices, I used phase boundaries provided in @Dunaeva2010 and assigned points within each region an appropriate EOS from @Choukroun2007.
For the regions based on tabulated values, I applied the EOS only in the region covered by the data points where interpolation can be carried out.
Outside these bounds, I revert to the next highest priority EOS from @tbl:my-eos.

### Validation

Wherever I implemented a functional EOS, I wrote extensive tests to ensure that these functional forms correctly reproduced any values provided in the paper.
I compared the implemented EOS to test values in the published paper (in the case of @Wagner2002), a subset of experimental data points (in the case of experimental papers, in order to check that the interpolation was valid), or against plotted isotherms (for other papers).^[For an example of one of these validations, see [@fig:testing-functional-forms].]
I did this for papers that provided EOSes in the form $ρ=f(P,T)$, as well as the inverse form $P = g(ρ,T)$.
I also verified that the IAPWS tabulated values matched up with the functional values at the boundary of the table.
@Fig:iapws-matching shows the match between these two data sets.

![
  Example of a validation plot showing that my EOS matches the literature values.
  This is an example of one of the validation plots I produced to check that my implemented EOS matches the literature values.
  In this case, a numerically inverted Vinet equation of state is compared against values from @Vinet1987, showing good agreement.
](testing-functional-forms){#fig:testing-functional-forms}

![
  I verified that the tabular IAPWS data (left) joined smoothly to the numerically inverted form (right) of the IAPWS equations.
](iapws-matching){#fig:iapws-matching}

I confirmed that my chosen EOS approaches the TFD (the high-pressure limit EOS) as pressure increases.
@Fig:eos-contours shows this.
I made no attempt to match or smooth the boundaries between each region, trusting the published equations of state as being accurate within their range of validity.
This leads to some false density discontinuities which are visible in the final output.
I have chosen to leave these as they are, because there is no justification for artificially smoothing out the density profile.

![
  Comparison of my equation of state with the high-pressure limit.
  The TFD (Thomas--Fermi--Dirac) equation of state is increasingly accurate in the high-pressure limit, where temperature effects on the water density disappear.
  I also show temperature contours of my water equation of state.
  The TFD, which has no temperature correction, is a poor approximation of the behaviour of water at low pressures, especially across the liquid--vapour phase boundary (vertical lines).
  But all other choices of equation of state approach the TFD at high pressures, and so it is appropriate in the TPa region and beyond.
](eos-contours){#fig:eos-contours}

I can generate a final table of the EOS at any resolution, because it uses functional forms or interpolation to give the output density for a given pressure and temperature.
In generating a final grid of densities, I used logarithmic spacing on both axes to reflect the fact that the density surface has its interesting features at lower temperatures and pressures.

A representation of the final water EOS is shown in [@fig:eos-density].

### The phase structure of water

The key phases of water relevant to the interiors of watery planets include liquid, supercritical and superionic fluid, ice VII, ice X, and plasma.
I defer further discussion of phase transitions in the equation of state until @sec:phase-structure-and-migration, in which I examine the phase structure of watery planets.

### Thermal effects

I endeavoured to choose equations of state that were most representative of the thermal behaviour of water across this temperature and pressure domain.
I was guided by two principles in doing so.
First, we expect thermal expansion effects to approach zero as the pressure increases ([@fig:eos-contours]): this is a consequence of the equations of state approaching the high-pressure TFD limit.
There are significant temperature effects at lower pressures, and it is these effects that I expected to be most important in this study.
Second, I aimed for a full treatment of density changes over phase boundaries.
Accordingly, I used the phase boundaries specified by @Dunaeva2010 to divide the temperature--pressure phase space into regions corresponding to different phases of water.
I then chose an appropriate equation of state to represent each phase.

### Thermal expansion and heat capacity of water

@Eq:adiabatic-temperature-gradient-with-eos-highlighted requires both a heat capacity $c_p$\marginnote{
  The specific isobaric heat capacity $c_p$ is the heat capacity of water held at a constant pressure. Under standard conditions ($15\,°$C, $1\,$atm), water has a heat capacity of $4190\,$J$⋅$kg$^{-1}⋅$K$^{-1}$, but this varies significantly with temperature and pressure.
  } and a thermal expansion coefficient $α$.\marginnote{
  The volumetric thermal expansion coefficient $α$, sometimes denoted $α_V$, is the fractional change in volume as the temperature is increased at constant pressure:
  \begin{equation}
    α_V = {1 \over V}\left({∂V \over ∂T}\right)_p = -{1 \over ρ}\left({∂ρ \over ∂T}\right)_p
  \label{eq:thermal-expansion}
  \end{equation}
  }
Following my goal of handling temperature effects appropriately, I explicitly sought out temperature-dependent forms for these.

I used the IAPWS tables for heat capacity in the liquid--vapour range, then took the nearest available data point from these tables for all other pressure--temperature points.
This is because I could not find readily available heat capacity data across the full range of phases in our equation of state.
This approach therefore does not reflect any changes in heat capacity between the high-pressure ice phases.
But the most significant effect is the change in heat capacity across the liquid--vapour phase boundary, which is captured appropriately ([@fig:iapws-heat-capacity]).

![
  The heat capacity across the region of my EOS covered by the IAPWS data set.
  The heat capacity approaches a constant value near the edge of the domain, indicating that pegging values outside the domain to the nearest known value is likely be a decent approximation.
  Only in the volatile region around the phase boundaries and critical point of water does the heat capacity vary significantly.
](iapws-heat-capacity){#fig:iapws-heat-capacity}

I drew the thermal expansion coefficient $α$ directly from the equation of state by evaluating @eq:thermal-expansion.
Because the equation of state provides the density $ρ$ as a function of $P$ and $T$, we can evaluate the thermal expansion at any $(P,T)$ co-ordinate by taking a directional derivative in the $T$ direction.
I used automatic differentiation[^autodiff] where possible to evaluate this derivative.
In some cases this was not possible[^not-always-possible] so I used finite differencing.[^finite-diff]
As well as pre-computing the equation of state itself, I pre-computed and tabulated the thermal expansion coefficient on the same pressure--temperature grid.
Some previous works have assumed a fixed thermal expansion coefficient^[For example, @Ehrenreich2006 took a fixed value for $α$ in their models.] but I believe that my approach is more appropriate for understanding how the temperature gradient and physical properties of a watery planet are affected by the thermal properties of water.

[^autodiff]: I used forward-mode automatic differentiation provided by [ForwardDiff.jl](https://github.com/JuliaDiff/ForwardDiff.jl).
[^not-always-possible]: The Delaunay triangulation method in the library I used incorporates a method called floating-point filtering, which relies on the specific properties of floating point numbers. It could not be used with the automatic differentiation approach I used, which evaluates functions as usual but replaces the inputs with a special numeric type.
[^finite-diff]: I used the package [Calculus.jl](https://github.com/johnmyleswhite/Calculus.jl).

### Dealing with disparate or conflicting data sources

I made no attempt to smooth or otherwise interpolate between the different sources of data described above.
This approach means that sharp density changes across phase boundaries are well-represented in the final equation of state.
This is desirable so that we may examine the differentiation that results solely from phase transitions.
It also results in some artificial density discontinuities at the boundaries between different data sets.
I believe that this has not affected the results: these discontinuities are minor compared with the density variations within each phase of water and, in most cases, I also bounded the domain of each data set to that of a particular phase.

### A custom interpolation routine for data on a non-uniform grid

Because I used disparate sources of data, I evaluated the density at a given temperature and pressure in different ways depending on the data source.
Although I did not smooth or interpolate *between* data sets, I needed to interpolate some data sources *within* the data set.

Where data were published in tabulated form on a structured rectangular grid, I used simple two-dimensional linear interpolation.[^2d-interp]
This interpolation method constructs an interpolating function by taking a weighted average of the density four surrounding points.
The weighting depends on the relative $(P,T)$ value of the point being evaluated.
In this way we can calculate the density at points within the domain of the table but off the rectangular grid.

[^2d-interp]: For multidimensional linear interpolation I used [Dierckx.jl](https://github.com/kbarbary/Dierckx.jl).

Not all data can be represented on a structured grid in this way.
This is the case where the equation of state data are provided as sets of $(P, T, ρ)$ values.
In this case, we require a different interpolation scheme.

I tested many different interpolation routines written in Python but found them to be very slow and more complicated than necessary.
Most of these interpolators use some form of spline-fitting, or perhaps a functional approximation by way of radial basis functions.
But I did not require this degree of smoothness in my final interpolation: it was sufficient to instead use the equivalent of linear interpolation on an unstructured grid.

I therefore moved to a custom interpolator written in Julia.
Where data were published as unstructured points, I used barycentric interpolation on the mesh of Delaunay triangles defined by these points.
Barycentric interpolation can be thought of the triangular analogue of linear interpolation on a regular grid, and Delaunay tessellation is a method for generating a triangular tessellation on a plane between pre-specified points.

To calculate the density at a pressure--temperature point, my interpolator performs the following steps:

- It takes the points in $(P,T)$ space to define the vertices of a Delaunay tessellation of the plane.^[To construct a Delaunay tessellation I used the Julia package [VoronoiDelaunay.jl](https://github.com/JuliaGeometry/VoronoiDelaunay.jl).]
It then caches the Delaunay mesh created so that it does not have to be re-created on every interpolation.

- It associates each of these $(P,T)$ pairs with its corresponding density value. The result is a weighted Delaunay mesh where each vertex has an attached density value.

- For each interpolation query, it finds the triangle that encloses the $(P,T)$ point of interest. The interpolated value of the density $ρ$ therefore lies between the values at each vertex of this triangle, which we denote $(ρ_1, ρ_2, ρ_3)$.

- It performs a co-ordinate transforms from the Cartesian $(P,T)$ value to a barycentric coordinate system $(λ_1, λ_2, λ_3)$ (where $λ_1 + λ_2 + λ_3 = 1$). In this system, the corners of the triangles correspond to the basis vectors $(1,0,0)$, $(0,1,0)$ and $(0,0,1)$ and the barycentre of the triangle corresponds to the point $({1 \over 3}, {1 \over 3}, {1 \over 3})$.

  - Finally, it calculates the interpolated value: $ρ(P, T) = \sum_{i=1}^3 ρ_i λ_i$.

![
  This schematic shows my linear interpolation scheme for unstructured data.
  First the unstructured $(P,T)$ points are used to define a Delaunay tessellation where the points lie on the vertices of the tessellating triangles.
  Then the density at any given point can be found by taking a weighted sum of the density values at the enclosing vertices.
](delaunay){#fig:delaunay-barycentric}

This custom routine takes advantage of a method called "floating point filtering", which is also used in some cosmological simulations.^[For example, the Illustris simulation uses this method.]

The other benefit of this approach is that it naturally defines the domain of the table of interest: only points which are contained in one of the Delaunay triangles lie within the domain of the table.
I used this Delaunay mesh to determine if a given $(P,T)$ pair lay within the domain of a particular equation of state, allowing me to fall back to another equation of state if necessary.

Finally, I evaluated functional forms of the equation of state as is, defining their domain by means of a bounding box or a polygon in $(P,T)$ space taken from the phase boundaries of @Dunaeva2010.

## The final equation of state

Some of the equations of state used in this final synthesized version were much simpler than others.
This meant that the evaluation time varied from point to point, from very quick table lookups and interpolation to the slower IAPWS formulae.
In addition, any equation of state that was specified in the inverse form $P = P(ρ, T)$ needed to be numerically inverted to give the canonical form $ρ = ρ(P, T)$ used in my final EOS.
To avoid duplicating this calculation unnecessarily, I re-sampled the final equation of state on to a $500$ by $500$ pressure--temperature grid.
Pre-computing and tabulating the data in this way saved significant time.

In my trials, the resolution of the grid barely altered the properties of the planetary models.
I checked that altering the number of points has a negligible effect on the final planet structure.
This suggests that the density behaviour within a single phase region was more important than any effects across phase boundaries that might be lost by sampling from this discrete grid.

### Uncertainty

The equation of state that I used necessarily has some uncertainty in it, especially in regions near the critical point of water^[@Wagner2002] and at high temperatures and pressures where there are sometimes conflicting experimental and theoretical data.^[@Baraffe2008]
The error in the equation of state varies depending on the original data source.
For the region encompassed by the IAPWS data,^[@Wagner2002] the density uncertainty is approximately 0.01% (liquid and solid), 0.03 to 0.1% (vapour), and up to 0.5% in the region around and beyond the critical point.
@Wagner2002 give a more detailed breakdown of these errors in their section 6.3.2, in particular figure 6.1.
I estimate that the error beyond these regions is closer to 1% if we extrapolate beyond the table and assume that the uncertainty continues to increase at higher temperatures and pressures.
For the supercritical fluid, plasma and superionic phases in the data of @French2009, they state that "the QMD EOS is accurate up to 1% for the conditions relevant for the giant planet’s interiors of our solar system."
For the ice VII phase, the measurements of @Sugimura2010 have errors of between 0.003% and 0.5%.
Finally, it is not possible to give a meaningful uncertainty estimate at higher pressures where no measurements exist, but I do not treat the temperature dependence there anyway.

### How my EOS improves on previous work

The final software package, WaterData.jl, has the following advantages.

- It spans a wide range of pressure--temperature space relevant for the structures of planetary interiors. Most other equations of state are intended for use only in an appropriate limit, or contain no temperature dependence, or are only applicable for colder planets. I specifically sought out high-temperature
- It is based on the latest available experimental data, and it uses temperature-dependent formulations for the pressure--temperature--density relation where possible.
- It comprises both functional and tabular data sources and unifies them under a single interface.
- Its structure is modular: it is easy to swap out part of the representation of the EOS or to add a new region of phase space not yet covered. For example, if new high-pressure experiments produce results for the heat capacity and density of water in the ice X phase, they can easily be added to the EOS.
- It provides tools to export the data in a raw format or to interpolate and grid the data.
- It contains routines for numerical inversion with sensible defaults, which facilitate the addition of functional equations of state.
- It provides heat capacity information in the vapour/gas phase covered by the IAPWS formulation, which is the region of phase space with the greatest heat capacity variation, and extrapolates sensibly outside this region.

## Making the data freely available

I have made the equation of state freely available online at [github.com/swt30/WaterData.jl](http://www.github.com/swt30/WaterData.jl).
This chapter was also published as part of our first paper "In hot water: effects of temperature-dependent interiors on the radii of water-rich super-Earths".^[@Thomas2016]

> TODO: actually deliver on this promise now that Oli is finishing with the code!
