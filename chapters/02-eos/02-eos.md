# An improved water equation of state

The most important piece of information that we require when making a planetary model is the *equation of state* (EOS).
We have a choice of several approaches for the planetary model itself, which we will discuss in @sec:watery-planets.
But no matter how we go about modelling the planet, we require some information about the properties of the materials that comprise it.
More specifically, we require a relationship that specifies how the density of a material varies with pressure and temperature.
Such a relationship is the equation of state.

In this chapter I provide an overview of the equations of state used in interior modelling so far.
I then present my improved equation of state for water, which I synthesized from a wide variety of data sources.
I will discuss the process of compiling this equation of state, show how it is an improvement on previous work, and explain the difficulties that arose when dealing with several disparate sources of data.

## About the EOS

The equation of state
\marginnote{
  \begin{equation}
    ρ = f(P, T) \label{eq:equation-of-state}
  \end{equation}
  The equation of state. The function $f$ may be analytic or it may require looking up or interpolating between values in a table. The equation may also be written in an inverted form:
  \begin{equation}
    P = g(ρ, T) \label{eq:equation-of-state-inverted}
  \end{equation}
  depending on how the data is presented. }
is a relationship between temperature $T$, pressure $P$ and density $ρ$ (@eq:equation-of-state).
The definition of an equation of state allows that it might also specify relations between other thermodynamic state variables; these include the specific heat capacities $c_p$ and $c_v$ and specific energies like the internal energy $u$ or entropy $s$.
However, in this context we use it to refer solely to the relationship between the set of values $(P, T, ρ)$, which are the key values required for a one-dimensional planetary structure model.
Depending on its source and the material it represents, the equation of state may be expressed in a simple functional form or it may be more complicated than this.

Many potential equations of state exist, spanning all phases from gas to plasma.
"Universal" equations of state take advantage of the fact that different materials behave in a common way.
The best-known one is probably the ideal gas law,
\marginnote{
  The ideal gas law,
  \begin{equation}
    P = ρRT \label{eq:general-ideal-gas-law}
  \end{equation}
  links three state variables: pressure $P$, density $ρ$ and temperature $T$. The material's properties are encoded by the specific ideal gas constant $R$, defined as the ratio $\bar R/M$ where $\bar R$ is the universal gas constant ($\bar R = 8.314\,$J$⋅$mol$^{-1}⋅$K$^{-1}$) and M is the molar mass of the material. }
but others exist too: for example, there exist cubic equations of state which can partially account for the liquid--vapour transition, and the behaviour of solids when heated is often parameterised by including the material's thermal expansivity in its equation of state.
The complexity of the equation of state can be increased indefinitely.

There is no truly universal equation of state that accurately captures the behaviour of any material in all situations.
Though some approximations are good for certain phases or limits, a planetary model spans many orders of magnitude in temperature and pressure from the top of the atmosphere to the centre of the core.
Furthermore, real materials have phase transitions between different states of matter, and these manifest themselves as discontinuities in the density surface.

Because no true universal equation of state exists, it is inappropriate to use just one equation of state in a planetary model.
Instead we must maintain


### Where EOS data comes from





### The role of the water EOS in planetary models

For the one-dimensional models that we use, the equation of state enters the
For more detail on the models themselves, see @sec:watery-planets.
We also require

The equation of state also




### Previous EOSes for water

@Tab:previous-eos lists a number of previous works dealing with internal structure and summarises their equation of state choices.
In order of complexity (and therefore their potential ability to capture the behaviour of the mineral), these equations of state are:

- Simple semi-empirical analytic^[By this I mean that the equation of state is of a fixed functional form, but the function is parameterised by one or more parameters that are tuned based on measurements of the material.] prescriptions like the Birch-Murnaghan equation of state (BME), Vinet equation of state, or power laws;

- Theoretical high-pressure equations of state like the Thomas-Fermi-Dirac formulation (TFD), which produce results applicable in the high pressure regime but are not;^[The ideal gas equation of state is similar in that it can be derived based directly on statistical mechanics, rather than being measured for each gas.]

- Quantum molecular dynamics simulations from first principles;

- Complicated empirical analytic prescriptions, such as the work of the International Association for the Properties of Water and Steam (IAPWS) or the US national laboratory databases such as like ANEOS and SESAME, plus tables of values taken from these; and

- Fully experimental data sets generated from shock wave compression or diamond anvil experiments.

Despite progress in both experimental measurements and \emph{ab initio} theoretical calculations, there is still no all-encompassing equation of state database for any of the minerals of interest in planetary interiors.
Perhaps the closest to our intended goal is SESAME, the Los Alamos National Laboratory equation of state database.
But US regulations preclude the distribution of SESAME to foreign nationals and so we were unable to access it.^[A frustrating display of political barriers to research.]



Ideally we would be able to use actual measurements in all our calculations, but we run into two issues here. First, the temperatures and pressures relevant to planetary interiors are outside the reach of experiments for now. Secondly, dynamic shock experiments may not be appropriate for understanding the behaviour of materials under static pressure. We therefore choose experimental data for our equation of state where appropriate, and use different sources of data to fill in other regions.


### Theoretical and empirical sources of data

### Motivation for an improved water EOS

Although the expression for the equation of state (@eq:eos) nominally includes temperature dependence, only a few studies have attempted to calculate self-consistent planetary models that include a temperature component.
Many simply use zero-temperature equations of state instead.
And in cases where the temperature has been included, it has often been treated in a simplified manner.
For example, @Zeng2014 use a scaled Neptune adiabat for their internal temperature profile and also use a simplified equation of state that does not include all the thermal behaviour.

The lack of a complete treatment of temperature has been justified by the fact that the thermal expansion effect on an equation of state is minor compared to the pressure.
@Seager2007 find that "water ice VII density changes by less than a few percent" up to 800K.
However, they do not include the high-pressure ionic and plasma fluid phases in this, and say that "[m]ore work needs to be done to quantify the thermal pressure effects above 250$\,$GPa and in the ionic phase".

With the knowledge that precisions on the order of a few percent will regularly be attainable by future observational campaigns, we argue that the role of thermal effects in these types of planetary models needs to be further investigated.




## How I collected and synthesized the data

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
