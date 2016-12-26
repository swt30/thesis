---
abstract: |
          Astronomers are discovering more and more super-Earths, planets around other stars whose sizes and masses lie somewhere between those of Earth and Neptune. We would like constraints on their composition to investigate whether they are more similar to rocky Earth or gaseous Neptune. To do this we need numerical models of their interiors. These models often exclude any thermal effects, a choice justified by noting that a heated rocky planet expands by only a small amount. But this is not necessarily true for planets with thick oceans or watery atmospheres. Water has a rich and interesting thermal behaviour: at high pressure and temperature it can be in any of several exotic plasma and ice phases. Planets with thick water layers, known as waterworlds, cannot therefore be accurately represented by models that treat them as cold spheres. But understanding how waterworlds vary in size and structure is important as we seek to interpret new observations of super-Earths.

          I developed temperature-dependent structure models of waterworlds, treating both the interior structure and the atmosphere and including both internal and external heating. In doing so, I synthesized an improved equation of state for water to better capture how it behaves when heated or pressurised. Using these models, I show the following: heat can significantly affect a watery planet’s size and structure; these planets can have large and diffuse yet opaque atmospheres; and a planet can have a hot extended steam atmosphere even if only moderately heated from the inside. My models are simpler than those based on energy transfer codes, yet are fast to evaluate and still capture thermal behaviour trends appropriately. I therefore suggest that they would be ideally suited to use in statistical models of planetary systems. I also explore how a planet might change size if it migrates or exists in an elliptical orbit, consider the astrobiological implications of heating a watery planet, and present the results of applying these models to a recently-discovered potential waterworld.

quotes:
  - quote: Hello, babies. Welcome to Earth. It’s hot in the summer and cold in the winter. It’s round and wet and crowded. At the outside, babies, you’ve got about a hundred years here. There’s only one rule that I know of, babies—God damn it, you’ve got to be kind.
    author: Kurt Vonnegut, "God Bless You, Mr. Rosewater"
  - quote: |
           Within your lifetime will, perhaps,  
           As souvenirs from distant suns  
           Be carried back to earth some maps  
           Of planets and you'll find that one's  
           So hard to color that you've got  
           To use five crayons. Maybe, not.
    author: Marlow Sholander, "Maybe"
  - quote: Sometimes I think the surest sign that intelligent life exists elsewhere in the universe is that none of it has tried to contact us.
    author: Bill Watterson, "Calvin and Hobbes"

dedication: |
            For those who heard my dreams  
            and said, "Go for it."

preface: |
         This dissertation is the result of my work at the Institute of Astronomy between October 2013 and December 2016 under the guidance of Nikku Madhusudhan. Though all the text is mine, some of it is based on work for which he, Ian Parry and Christopher Tout have provided advice and/or editing. All external sources of data are referenced in the text; all figures are my own except where indicated; and any errors or omissions are mine.

         Parts of this dissertation have been previously published or will be submitted for publication. \Cref{sec:an-improved-water-equation-of-state,sec:watery-planet-interiors} were published as "In hot water: effects of temperature-dependent interiors on the radii of water-rich super-Earths".^[@Thomas2016] \Cref{sec:heating-and-the-atmosphere,sec:phase-structure-and-migration} are to be submitted.^[Thomas & Madhusudhan, in prep.]
         \Cref{sec:a-water-rich-super-earth} is based on a work in preparation;^[Shorttle, Madhusudhan and Thomas, in prep.] I contributed the interior structure models and wrote the chapter but the figures and analysis are courtesy of Oliver Shorttle.

         \newthought{I hereby declare} that this dissertation entitled "Internal and atmospheric structures of heated watery super-Earths" is the result of my own work and includes nothing which is the outcome of work done in collaboration except as declared in this Preface and specified in the text. It is not substantially the same as any that I have submitted or is being concurrently submitted for a degree or diploma or other qualification at the University of Cambridge or any other University or similar institution.

         I further state that no substantial part of my dissertation has already been submitted or is being concurrently submitted for any such degree, diploma or other qualification at the University of Cambridge or any other University or similar institution.

         This dissertation does not exceed 60,000 words.

colophon: |
          [\raisebox{-.2\height}{\includegraphics[height=0.4cm]{creativecommons.pdf}}](http://creativecommons.org/licenses/by/4.0/) This work is licensed under a [Creative Commons Attribution 4.0 International License.](http://creativecommons.org/licenses/by/4.0/)

          This dissertation is typeset with the [`tufte-book`](http://tufte-latex.github.io/tufte-latex/) \LaTeX\xspace class. It uses Markdown source, the [`Pandoc`](http://www.pandoc.org) document converter, and a custom template. The source code, including Jupyter notebooks containing all my figures, is available at [www.github.com/swt30/thesis](www.github.com/swt30/thesis).

---
