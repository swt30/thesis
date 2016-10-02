# Introduction

Here's a first sentence.
\marginnote{Here is some text in the margin.}
\lipsum[1]

\newthought{Here is the start} of a new thought. \lipsum[22]

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

## Section

\lipsum[2-3]

### Subsection

$$ \begin{split}
    T^4 &= {3 T_\mathrm{int}^4 \over 4} \left[ {2 \over 3} + τ \right] \\
        & \quad + {3 T_\mathrm{irr}^4 \over 4} μ_*
                \left[ {2 \over 3} + {μ_* \over γ} + \left( {γ \over 3 μ_*} - {μ_* \over γ}e^{-γτ/μ_*} \right) \right]
\end{split} $$ {#eq:two-stream-temperature-profile}

### Another subsection

\lipsum[4-10]

## Another section

## A third section

## A fourth section
