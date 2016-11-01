# An improved water equation of state

The most important piece of information that we require when making a planetary model is the *equation of state* (EOS).
We have a choice of several approaches for the planetary model itself, which we will discuss in @sec:watery-planets.
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

\marginnote{
  \begin{equation}
    c_p = h(P, T) \label{eq:heat-capacity}
  \end{equation}
  The specific isobaric heat capacity can also be represented in a similar form. It is required to calculate the temperature gradient in the planet.
} To calculate the temperature gradient also requires the specific isobaric heat capacity $c_p$, and so associated with this equation of state I include the heat capacity as a function of pressure and temperature.

Many potential equations of state exist, spanning all phases from gas to plasma.
Depending on its source and the material it represents, the equation of state may be expressed in a simple functional form or it may be more complicated than this.
So-called "universal" equations of state take advantage of the fact that different materials behave in a common way.
The best-known one is probably the ideal gas law,\marginnote{
  The ideal gas law,
  \begin{equation}
    P = ρRT \label{eq:general-ideal-gas-law}
  \end{equation}
  links three state variables: pressure $P$, density $ρ$ and temperature $T$. The material's properties are encoded by the specific ideal gas constant $R$, defined as the ratio $\bar R/M$ where $\bar R$ is the universal gas constant ($\bar R = 8.314\,$J$⋅$mol$^{-1}⋅$K$^{-1}$) and $M$ is the molar mass of the material.
} but others exist too: for example, there exist cubic equations of state which can partially account for the liquid--vapour transition, and the behaviour of solids when heated is often parameterised by including the material's thermal expansivity in its equation of state.
The ideal gas is one of the simplest possible equations of state; the complexity of the equation of state can be increased indefinitely.

There is no truly universal equation of state that accurately captures the behaviour of any material in all situations.
Though some approximations are good for certain phases or limits, a planetary model spans many orders of magnitude in temperature and pressure from the top of the atmosphere to the centre of the core.
Furthermore, real materials have phase transitions between different states of matter, and these manifest themselves as discontinuities in the density surface.

### Where do EOS data come from?

Because no true universal equation of state exists, it is inappropriate to use just one equation of state in a planetary model.
And despite progress in both experimental measurements and \emph{ab initio} theoretical calculations, there is still no all-encompassing equation of state database for all of the minerals of interest in planetary interiors.
Perhaps the closest to our intended goal is \smallcaps{SESAME}, the Los Alamos National Laboratory equation of state database.
But US regulations preclude the distribution of \smallcaps{SESAME} to foreign nationals and so we were unable to access it.^[A frustrating display of political barriers to research.]
Instead we must maintain several different equations of state for each different material, choosing appropriately from among them depending on the chemical composition, pressure and temperature.

Previous studies have approached the problem of there being no centralised database for equations of state by stitching together other equations of state which are valid for different pressure regimes.
Although the choice of the exact equations has varied as new experimental data were released, few of these studies included thermal expansion.
They included several different materials of interest for planetary interiors: water ice, iron, and silicates.
For example, @Seager2007 took this approach with water, combining three temperature-independent equations of state for ice VII:

- the Birch--Murnaghan equation (BME)^[Where abbreviations are used in this chapter, @tbl:eos-abbreviations indicate their origin.] of state at low pressures,
- density functional theory (DFT) calculations at intermediate pressures and
- the Thomas--Fermi--Dirac (TFD) model at very high pressures.

\noindent The piecewise function defined in this way is therefore appropriate over a wide pressure range.

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

This pressure piecewise approach neglects temperature dependence in the equation of state but provides a robust approximation that is easy to evaluate.
In some cases, stitching the data in this fashion has revealed that a simpler functional form works just as well.
For example, this is the case in the "polytropic equation of state" used by @Seager2007.
Such simple functional forms for the equation of state have been used successfully to model planets as cold spheres since the work of @Zapolsky1969.
In other cases, a more detailed functional form is needed to capture the behaviour of the material fully; this is especially true if it undergoes phase transitions.
For example, the IAPWS formulation^[@Wagner2002] uses a complicated series of equations fitted to various sources of experimental data for the behaviour of water in the vapour and liquid phases.

In an ideal world we would simply measure the density (and other state variables) of the material for all relevant pressures and temperatures.
But there are two issues that make this approach untenable.
First, many of the temperatures and pressures relevant to planetary interiors are outside the reach of experiments for now.
Second, even in the cases where they are accessible, it is often only via dynamic shock experiments rather that static compression experiments.
Such dynamic experiments may not be appropriate for understanding the behaviour of materials under static pressure.
In practice, we therefore choose experimental data for our equation of state where appropriate, and use different sources of data to fill in other regions.

Where do these other sources of data come from?
@Howe2014 provided an overview of the equations of state chosen in previous works to model planetary interiors.
I repeated this exercise in more depth, surveying previous works that deal with internal structure and focusing exclusively on the water equations of state across all its phases (@tbl:eos-sources).
In order of complexity (and therefore their potential ability to capture the behaviour of the mineral), these equations of state are:

- Simple semi-empirical analytic^[By this I mean that the equation of state is of a fixed functional form, but the function is parameterised by one or more parameters that are tuned based on measurements of the material.] prescriptions like the Birch-Murnaghan equation of state (BME), Vinet equation of state, or power laws;

- Theoretical high-pressure equations of state like the Thomas-Fermi-Dirac formulation (TFD), which produce results applicable in the high pressure regime but are not;^[The ideal gas equation of state is similar in that it can be derived based directly on statistical mechanics, rather than being measured for each gas.]

- Quantum molecular dynamics simulations from first principles;

- Complicated empirical analytic prescriptions, such as the work of the International Association for the Properties of Water and Steam (IAPWS) or the US national laboratory databases such as like ANEOS and SESAME, plus tables of values taken from these; and

- Fully experimental data sets generated from shock wave compression or diamond anvil experiments.

<!-- TODO: elaborate on shock wave / diamond anvil experiments -->

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

### The role of the water EOS in planetary models

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
  These equations are introduced more fully in \cref{sec:watery-planets}.  
}, which depends on the density $ρ$; the second is in the equation for the temperature gradient, which depends on several quantities: thermal expansivity $α$, density $ρ$ and specific isobaric heat capacity $c_p$.
All of these quantities are provided by the equation of state.

To capture the thermal behaviour of a planet appropriately, an equation of state therefore requires the following properties:

- It must cover a wide range of pressures and temperatures relevant to both a planet's atmosphere and its interior.

- It must provide the heat capacity $c_p$, at least at pressures relevant to the envelope region. In the atmosphere the heat capacity is not required.

- Because the adiabatic temperature gradient lies on an isentrope, the EOS must include enough information to evaluate this isentrope. This could mean providing the entropy directly; however, as we will see, it is sufficient to include the heat capacity.

- It should include temperature dependent density changes wherever possible.

None of the individual equations of state in @tbl:eos-sources meet all these criteria.

### Motivation for an improved water EOS

Why do we care about thermal effects in the equation of state?
Although the expression for the equation of state (@eq:equation-of-state) nominally includes temperature dependence, only a few studies have attempted to calculate self-consistent planetary models that include a temperature component.
Many simply use zero-temperature equations of state instead.
And in cases where the temperature has been included, it has often been treated in a simplified manner.
For example, @Zeng2014 use a scaled Neptune adiabat for their internal temperature profile and also use a simplified equation of state that does not include all the thermal behaviour.

The lack of a complete treatment of temperature has been justified by the fact that the thermal expansion effect on an equation of state is minor compared to the pressure.
@Seager2007 find that "water ice VII density changes by less than a few percent" up to 800K.
However, they do not include the high-pressure ionic and plasma fluid phases in this, and say that "[m]ore work needs to be done to quantify the thermal pressure effects above 250$\,$GPa and in the ionic phase".

With the knowledge that precisions on the order of a few percent will regularly be attainable by future observational campaigns, I argue that the role of thermal effects in these types of planetary models needs to be further investigated.
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
} for water across a range of pressures and temperatures, drawing from a number of the sources of data listed in Table @tbl:eos-sources.
<!-- TODO: make the EOS publicly available as indicated -->
I extended the piecewise approach described above to include temperature as a second dimension in parameter space.
My stitched equation of state is valid over a wide domain: its temperature domain is from 275$\,$K to 24000$\,$K, and its pressure domain is from $10^5\,$Pa (1$\,$bar) upwards.
My approach was similar to that of @Senft2008, who generated a "5-Phase" equation of state across different liquid, vapour, and ice phases.
However, their work focused on the lower temperatures needed to model impact craters.
I have explicitly included much higher temperatures so as to capture the behaviour of large super-Earth planets: we expect the cores of these to reach thousands of Kelvin.
@Valencia2010 also constructed a similar equation of state, though using only data from SESAME and the IAPWS formulation.
The sources I used are detailed in @tbl:my-eos.

----------------------------------------------------------------------------------
Equation of state        Type          Region of validity
                         \footnotemark
------------------------ ------------- -------------------------------------------
IAPWS                    Tabular       Vapour and liquid phases;
                                       0.05 to 1000$\,$MPa
                                       and 252.462 to 1273$\,$K

@French2009              Tabular       Superionic, plasma and high-pressure ice
                                       phases; 79 to $9.87×10^6\,$MPa and 1000 to
                                       24000$\,$K. I did not use table VIII from
                                       this work, as this low-density data
                                       disagrees with the IAPWS formulation.

@Feistel2006             Tabular       Ice Ih; 0 to 200$\,$MPa and 0 to 273$\,$K

@Sugimura2010            Tabular       Ice VII; 18880 to 50250$\,$MPa
                                       and 431 to 881$\,$K

Vinet + MGD correction   Functional    Ice VII
using parameters from
@Fei1993

TFD                      Functional    Ice X

@Seager2007              Functional    Ice VIII--X transition

@Choukroun2007           Functional    Ices I, III, V, VI; phase
                                       boundaries as specified by @Dunaeva2010

IAPWS extrapolations     Functional    Remaining regions
----------------------------------------------------------------------------------
Table: I used a variety of equations of state in compiling my final EOS. {#tbl:my-eos}

\makeatletter
\@footnotetext[+10cm]{
  "Tabular" indicates that I interpolated between values specified in the paper. "Functional" indicates that I used the functional form given in the paper.}
\makeatother

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
](normal){#fig:eos-phase-space}


![Density of my water equation of state.
  Here I show the density variation across the entire pressure--temperature range.
  The density of water is more strongly affected by pressure across the range I consider, but temperature also affects its density too, especially across the liquid--vapour phase boundary and in the supercritical region.
](normal){#fig:eos-density}

Wherever I implemented a functional EOS, I wrote extensive tests to ensure that these functional forms correctly reproduced any values provided in the paper.
I also verified that the numerically inverted forms of the

![Example of a validation plot showing that my EOS matches the literature values.
  This is an example of one of the validation plots I produced to check that my implemented EOS matches the literature values.
  In this case, a numerically inverted Vinet equation of state is compared against values from @Vinet1987, showing good agreement.
](testing-functional-forms){#fig:testing-functional-forms}

### Numerical inversion

The functional forms of the EOS often specify a relationship between variables that is inverted compared to the one we require.^[Compare @eq:equation-of-state-inverted to @eq:equation-of-state.]
I wrote numerical inversion routines to handle these cases, parallelizing them for greater speed when evaluating large numbers of points in the state space at the same time.

As an example of where this is necessary, let us take the IAPWS data set.^[@Wagner2002]
The paper in which it is introduced provides a functional description of the behaviour of water and steam that is applicable over a wide range
It also provides a narrower set of tabulated values.
Interpolating between the tabulated values is simple, but I also used the functional form of the EOS outside the range of the table.
I based this decision on the claim of @Wagner2002 that the IAPWS formulation extrapolates appropriately outside the range of validity of the table.
In this case we needed to numerically invert the IAPWS EOS outside the tabulated range.

\begin{figure}
  \includegraphics{early-numerical-difficulties-1}\\
  \includegraphics{early-numerical-difficulties-2}
  \caption[Early difficulties dealing with numerical inversion near phase boundaries]
  {Early difficulties dealing with numerical inversion near phase boundaries. The density, shown by the colour scale and contour lines, is wrong in some regions in the upper plot, which was generated by numerically inverting the IAPWS equations. This is because of the density discontinuity at the vapour-liquid phase boundary, visible here at the very bottom of the plot as the sharp drop in density along the axis from 300--622$\,$K. The lower plot shows the tabulated data from \citet{Wagner2002}. Both plots should match.}
  \label{fig:early-numerical-difficulties}
\end{figure}

### The phase structure of water

### Key phases in planetary models

### Thermal effects

### A custom interpolation routine for data on a non-uniform grid

### Numerical and performance considerations

### The thermal expansivity of water

### The heat capacity of water

### Dealing with disparate or conflicting data sources

## How my EOS improves on previous work

## Making the data freely available
