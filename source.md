% Using Pandoc with knitR
% Ramnath Vaidyanathan

`ro fig.width = 6, fig.height = 6, fig.path = 'fig/' or`

This is a short example illustrating how to use `knitr` with `pandoc` to write a single document in `markdown` and have it rendered in multiple formats, especially `pdf` and `html`. For the purposes of illustration, I have chosen two code chunks, one generating a plot and the other generating a table to illustrate the power of `pandoc` + `knitr`.

We first need to tell `knitr` to render the output of code chunks in the `gfm` format, which `pandoc` will understand. 

``` {r echo = F}
render_gfm()
````

The chunk below is a plot chunk. You need to have the package `ggplot2` installed for it to work.

``` {r plot-chunk, message = F}
library(ggplot2)
qplot(wt, mpg, data = mtcars)
````

The second chunk produces a table. You need to have the package `ascii` installed for this to work.

``` {r table-chunk, message = F, results = 'asis'}
library(ascii)
x <- head(mtcars[,1:5])
options(asciiType = 'pandoc')
ascii(x)
````


