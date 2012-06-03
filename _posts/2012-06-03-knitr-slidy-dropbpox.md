---
layout: post
title: "knitr, Slidy, Dropbpox"
description: ""
category: R
tagline: ""
tags: [r-project, slideshows, knitr]
---
{% include JB/setup %}

I just noticed that [Markus Gesmann](http://lamages.blogspot.com/2012/05/interactive-html-presentation-with-r.html) has a nice post on using **RStudio**, `knitr`, **Pandoc**, and **Slidy** to create slideshows. After my [recent attempt](http://christophergandrud.blogspot.com/2012/05/aspirational-useful-deckrb-with.html) to use `deck.rb` to turn a **Markdown**/`knitr` file into a deck.js presentation I caved in and also decided to go with [Pandoc](http://johnmacfarlane.net/pandoc/README.html) and [Slidy](http://www.w3.org/Talks/Tools/Slidy2/).

For me, Slidy produced the cleanest slides of the three formats that Pandoc supports. The presentation is [here](http://dl.dropbox.com/u/12581470/Presentations/LegViolence/leg_violence_present1.html) and the source is [here](http://dl.dropbox.com/u/12581470/Presentations/LegViolence/leg_violence_present1.Rmd).

The only thing I really disliked was having to use `<br />` or something similar to keep the text from bunching up at the top of the slides, which looked strange when projected onto a screen. You can customise Slidy CSS files, but I haven't got around to that yet.

In this post I don't want to duplicate what Markus Gesmann has already done. Instead, I wanted to mention two things that I noticed/thought about while making my presentation:

- The new **MathJax** syntax [implemented in RStudio 0.96.227](http://blog.rstudio.org/2012/05/25/mathjax-syntax-change/) doesn't seem to work with Pandoc. It just renders *latex* as if it was part of the equation rather than the qualifier to the equation begin delimiter. To get around this I just used the regular old `$ $` and `$$ $$` syntax.

- It's pretty easy to host presentations with **Dropbox**. Just make sure all of your files are in the same folder in your `Public` folder. If you want output from `knitr` to go into and be retrieved from someplace else, you can use the desired base URL for these files by adding this code *after* the Pandoc title information:


        ```{r setup, echo=FALSE}
    
        # Set up R so that figures save and load properly.    
        opts_knit$set(base.url = "")

        ```


   - Where `base.url = ""` includes the URL of the folder you want the output stored in. 
   
      - All items in a folder in Dropbox's `Public` folder have the same base URL.

   - I learned about `base.url` from [Yihui Xie's](http://yihui.name/) source code for his `knitr`/Markdown [example on github](https://github.com/yihui/knitr/blob/master/inst/examples/knitr-minimal.md). He uses it to save and retrieve figures from other folders on github.

### Extra: Pandoc Code ###

I used the following Pandoc code in the Terminal to convert the `.md` file to Slidy:

    pandoc -t slidy leg_violence_present1.md -o leg_violence_present1.html -s -i -S --mathjax