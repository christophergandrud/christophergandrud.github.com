---
layout: post
title: "Data on GitHub"
description: ""
tagline: The easy way to make your data available. 
tags: [r-Project, GitHub, reproducible research, web hosting, knitr]
---
{% include JB/setup %}

<div class="separator" style="clear: both; text-align: center;">
<a href="http://4.bp.blogspot.com/-9FnUkSkTYKY/T9h15TFF4_I/AAAAAAAAFYc/RfAuFltOonE/s1600/githubdata.png" imageanchor="1" style="clear: right; float: right; margin-bottom: 1em; margin-left: 1em;"><img border="0" height="280" src="http://4.bp.blogspot.com/-9FnUkSkTYKY/T9h15TFF4_I/AAAAAAAAFYc/RfAuFltOonE/s320/githubdata.png" width="320" /></a>
</div>

---

**Update (15 June 2012):** See [this post](http://christophergandrud.github.com/2012/06/15/update-to-data-on-github-post/) for instructions on how to download GitHub based data into **R** if you are getting the error about an `SSL certificate problem`. 

---

[GitHub](https://github.com/) is designed for collaborating on coding projects. Nonetheless, it is also a potentially great resource for researchers to make their data publicly available. Specifically you can use it to:

- **store** data in the cloud for future use (for free), 
- **track changes**, 
- make data publicly available for **replication,** 
- create a **website** to nicely present key information about the data, 

and uniquely:

- benefit from **error checking** by the research community.

[This](http://christophergandrud.github.com/Disproportionality_Data) is an example of a data set that I've put up on GitHub.

## How?

Taking advantage of these things through GitHub is pretty easy. In this post I'm going to give a brief overview of how to set up a GitHub data **repository**. 

> **Note:** I'll assume that you have already set up your GitHub account. If you haven't done this, see the instructions [here](https://help.github.com/articles/set-up-git) (for set up in the command line) or [here](http://mac.github.com/) (for the Mac GUI program) or [here](http://windows.github.com/) (for the Windows GUI program).

## Store Data in the Cloud

Data basically consists of two parts, the data and description files that explain what the data means and how we obtained it. Both of these things can be simple text files, easily hosted on GitHub:

1. **Create a new repository** on GitHub by clicking on the `New Repository` button on your GitHub home page. A repository is just a collection of files. 

    - Have GitHub create a `README.md` file. 
    
2. **Clone** your repository to your computer. 
    
    - If you are using GUI GitHub, on your repository's GitHub main page simply click the `Clone to Mac` or `Clone to Windows` buttons (depending on your operating system).
        
    - If you are using command line git. 
    
        - First copy the repository's URL. This is located on the repository's GitHub home page near the top (it is slightly different from the page URL). 
            
        - In the command line just use the `git clone [URL]` command. To clone the example data repository I use for this post type:
        
            $ git clone https://github.com/christophergandrud/Disproportionality_Data.git
            
        - Of course you can choose which directory on your computer to put the repository in with the `cd` command before running `git clone`.

3. **Fill** the repository with your data and description file.

    - Use the `README.md` file as the place to describe your data--e.g. where you got it from, what project you used it for, any notes. This file will be the first file people see when they visit your repository. 
        
        - To format the `README.md` file use [Markdown](http://daringfireball.net/projects/markdown/) syntax.
        
    - Create a `Data` folder in the repository and save your data in it using some text format. I prefer `.csv`. You can upload other types of files to GitHub, but if you save it in a text-based format others can directly suggest changes and you can more easily track changes.
    
4. **Commit** your changes and **push** them to GitHub.

    - In GUI GitHub click on your data repository, write a short commit summary then click `Commit & Sync`.
    
    - In command line git first change your directory to the data repository with `cd`. Then add your changes with `$ git add .`. This adds your changed files to the ''staging area'' from where you can commit them. If you want to see what files were changed type `git status -s`.
    
        - Then commit the changes with:
        
          $ git commit -m 'a comment describing the changes'
    
        - Then push the committed changes to GitHub with:
        
          $ git push origin master
        
        - For more information see this [git reference page](http://gitref.org/basic/).

5. **Create a cover site** with [GitHub Pages](http://pages.github.com/). This creates a nice face for the data repository. To create the page: 

    - Click the `Admin` button next to your repository's name on its GitHub main page.
    
    - Under ''GitHub Pages'' click `Automatic Page Generator`. Then choose the layout you like, add a [tracking ID](http://support.google.com/googleanalytics/bin/answer.py?hl=en&answer=55603) if you like, and publish the page.
    
## Track Changes

GitHub will now track every change you make to all files in the data repository each time you `commit` the changes. The GitHub website and GUI program have a nice interface for seeing these changes.
    
## Replication Website

Once you set up the page described in Step 5, other researchers can easily download the whole data repository either as a `.tar.gz` file or `.zip`. They can also go through your main page to the GitHub repository.

Specific data files can be directly downloaded into **R** with the `foreign` and `RCurl` packages (and `textConnection` from the `base` package). To download my example data into **R** just type:  

        library(RCurl)
        library(foreign)

        url <- "https://raw.github.com/christophergandrud/Disproportionality_Data/master/Disproportionality.csv"

        disproportionality.data <- getURL(url)                
                            
        disproportionality.data <- read.csv(textConnection(disproportionality.data))

> Note: make sure you copy the file's **raw** GitHub URL. 

You can use this to directly load GitHub based data into your `Sweave` or `knitr` file for direct replication.

## Improve your data through community error checking

GitHub has really made open source coding projects much easier. Anybody can view a project's entire code and suggest improvements. This is done with a `pull request`. If the owner of the project's repository likes the changes they can accept the request. 

Researchers can use this same function to suggest changes to a data set. If other researchers notice an error in a data set they can suggest a change with a `pull request`. The owner of the data set can then decide whether or not to accept the change. 

Hosting data on GitHub and using `pull requests` allows data to benefit the kind of community led error checking that has been common on wikis and open source coding projects for awhile. 


## Git Resources

- [Pro Git](http://git-scm.com/book): a free book on how to use command line git.

- [Git Reference](http://gitref.org/): another good reference for command line git.

- [github:help](https://help.github.com/): GitHub's reference pages.