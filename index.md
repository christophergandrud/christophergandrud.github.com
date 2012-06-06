---
layout: page
title: Home
tagline: Blog, Research, Teach
---
{% include JB/setup %}


### This site is **Under Development**. 

### I am moving my current website from [http://christophergandrud.blogspot.com/](http://christophergandrud.blogspot.com/).


-----
-----

<div id="home">

  <ul class="posts">
    {% for post in site.posts limit: 15 %}
      <div class="front">
      {% capture post_date %}{{ post.date | date: "%Y%m%d" }}{% endcapture %}
      {% if post_date != prev_post_date %}
        <div align="right" class="date-container">{{ post.date | date:"%A, %e %B %Y" | upcase }}</div>
      {% endif %}
      {% capture prev_post_date %}{{ post.date | date: "%Y%m%d" }}{% endcapture %}
        {% if post.post-link %}
        <h1><a href="{{ post.post-link }}" title="External link">{{ post.title }}</a> <a class="permalink" href="{{ post.url }}" title="Permanent link to: '{{ post.title }}'">&diams;</a></h1>
        {% else %}
        <h1>{{ post.title }} <a class="glyph-permalink" href="{{ post.url }}" title="Permanent link to: '{{ post.title }}'">&diams;</a></h1>
        {% endif %}
        {{ post.content }}
      </div>
      {% if forloop.last == false %}
      </br>
      <hr class="front">
      </br>
      {% endif %}
    {% endfor %}
  </ul>

</div>


