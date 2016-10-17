# Introduction

\smallcaps{1234567890}

Here's a first sentence.
\marginnote{Here is some text in the margin.}
\lipsum[1]

\newthought{Here is the start} of a new thought [@Seager2007;@Rogers2010]. \lipsum[22]

Sometimes I might like to write stuff in the margins, like equations.
\marginnote{
    \begin{equation}
        ρ = f(P, T) \label{eq:eos}
    \end{equation}
    The equation of state, where $ρ$ is the density, $P$ the pressure and $T$ the temperature.
}
Here I'm describing an equation that I will provide in the margin.
The equation of state, @eq:eos, relates density to pressure and temperature.
It does useful stuff because we use it to calculate things.
@Guillot2010 says something useful. @Zeng2014 says another thing. @Rogers2015 diasgrees!

## Section

@Fig:sample shows us something.

\begin{figure}
    \includegraphics{sample}
    \caption[Regular sample figure]{Here is a sample figure. Something really exciting is happening here!}
    \label{fig:sample}
\end{figure}

\lipsum[2]

But also interesting is @fig:sample-margin.

\begin{marginfigure}
    \includegraphics{sample-margin}
    \caption[Sample figure in margin]{Here's a sample figure. Something swirly is happening here.}
    \label{fig:sample-margin}
\end{marginfigure}

\lipsum[3]

Have you considered @fig:sample-wide?

\begin{figure*}
    \includegraphics{sample-wide}
    \caption[Full-width figure]{Here's a wide figure. Something wavy is happening here.}
    \label{fig:sample-wide}
\end{figure*}

### Subsection

@Eq:two-stream-temperature-profile is one big-ass equation.

\begin{fullwidth}
\begin{equation}
    T^4 = {3 T_\mathrm{int}^4 \over 4} \left[ {2 \over 3} + τ \right] + {3 T_\mathrm{irr}^4 \over 4} μ_* \left[ {2 \over 3} + {μ_* \over γ} + \left( {γ \over 3 μ_*} - {μ_* \over γ}e^{-γτ/μ_*} \right) \right] \label{eq:two-stream-temperature-profile}
\end{equation}
\end{fullwidth}

\lipsum[1]

### Another subsection

\lipsum[4-10]

## Another section

## A third section

## A fourth section
