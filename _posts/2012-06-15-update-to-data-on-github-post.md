---
layout: post
title: "Update to Data on Github Post"
description: ""
tagline: "Solution to an RCurl problem"
tags: [r-project, reproducible research, GitHub]
---
{% include JB/setup %}


A reader of my most [recent post](http://christophergandrud.github.com/2012/06/11/making-data-available-with-github/) tried the **R** code I had written to download the data set of electoral disproportionality from the GitHub repository. However, it didn't work for them. After entering `disproportionality.data <- getURL(url)` they got the error message:

    Error in function (type, msg, asError = TRUE)  : 
    SSL certificate problem, verify that the CA cert is OK. Details:
    error:14090086:SSL routines:SSL3_GET_SERVER_CERTIFICATE:certificate verify failed
    
## The Solution

The problem seems to be that they didn't have a certificate from an appropriate signing agent (see the RCurl [FAQ page](http://www.omegahat.org/RCurl/FAQ.html) (near the bottom) for more information. If you are really interested in SSL verification this [page](http://docs.redhat.com/docs/en-US/Red_Hat_Certificate_System/8.0/html/Deployment_Guide/Introduction_to_Public_Key_Cryptography-Certificates_and_Authentication.html) from [redhat](http://gb.redhat.com/) is a place to look).

The solution to this problem is pretty straightforward. As the RCurl FAQ page points out you can use the argument `ssl.verifypeer = FALSE` to skip certificate verification (effectively a [man-in-the-middle](http://en.wikipedia.org/wiki/Man-in-the-middle_attack) attack).

So, if you get the above error message just use this new code:

    library(RCurl)
    library(foreign)

    url <- "https://raw.github.com/christophergandrud/Disproportionality_Data/master/Disproportionality.csv"

    disproportionality.data <- getURL(url, ssl.verifypeer = FALSE)                
                        
    disproportionality.data <- read.csv(textConnection(disproportionality.data))
    
That should work.

## Question

I didn't originally mention this issue, because I didn't get it when I ran the code on my Mac. When I tried the code on a Windows machine I was able to replicate the error. 

Does any reader know why Windows computers (or any other types) lack certificates from an appropriate signing agent needed to download data from GitHub? How can you get one? 