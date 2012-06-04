---
layout: post
title: "Slidify:"
description: ""
category: 
tagline: "It's all coming together fast"
tags: [r-project, slideshows, knitr]
---
{% include JB/setup %}

Tools for using **R**/**RStudio** as a one-stop shop for research and presentation have been coming out quickly. I think this one has a good shot of being included in future releases of **RStudio**:

The other day I ran across a new **R** package called [slidify](http://ramnathv.github.com/slidify/) by [Ramnath Vaidyanathan](http://rstats.posterous.com/). In [previous](http://christophergandrud.blogspot.kr/2012/05/knitr-slideshows-and-dropbox.html) [posts](http://christophergandrud.blogspot.kr/2012/05/aspirational-useful-deckrb-with.html) I had been messing around with **Pandoc** and **deck.rb** to turn `knitr` Markdown files into HTML presentations. 

Slidify has two key advantages over these approaches:

- it can directly convert `.Rnw` files in **R** into slideshows, i.e. no toggling between **R** and the Terminal,

- there are lots of slideshow options ([deck.js](http://imakewebthings.com/deck.js/), [dzslides](http://paulrouget.com/dzslides/), [html5slides](https://code.google.com/p/html5slides/), [shower](), and [slidy](http://www.w3.org/Talks/Tools/Slidy2/)).

It's not on CRAN yet, but it worked pretty well for me. 

The syntax is simple. 

- In the Markdown document demarcate new slides with `---` (it has to be three dashes and there can't be spaces after the dashes).

- When you want to convert your `.Rnw` into a presentation just type:

        library(slidify)
        slidify("presentation.Rnw")
        
The default style is **html5slides**. The package isn't that well documented right now, but to change to a different style just use `framework`. For example:

        slidify("presentation.Rnw", framework = "deck.js")
        
I used slidify to put together a slideshow that advertises an intro applied stats course I'm teaching next semester. The slideshow is [here](https://dl.dropbox.com/u/12581470/Presentations/ad_DataAnalysis_2012/ad_data.html). (You can see that I'm trying to attract social science students who are reluctant to take a stats class).

I sloppily removed the default Slidify logo by deleting the `images` folder in the `html5slides` folder slidify creates.

### PS

 Oh, also you might notice that I'm using [github](https://github.com/) to host the course. I hope to blog about this in the near future. 