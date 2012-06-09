---
layout: page
title: Home
tagline: Blog, Research, Teach
---
{% include JB/setup %}

<div class="well">
<h3 style ="text-align:center;">
This site is Under Development. 
<br/>
<br/>
I am moving from my previous website at: <a href = "http://christophergandrud.blogspot.com/">http://christophergandrud.blogspot.com/</a>.
</h3>
</div>
-----
-----

<style>
    li, p { font-size: 11pt; line-height: 125%; margin: 20px; }
</style>

<div id="home">

  <ul class="posts">
    {% for post in site.posts limit: 15 %}
      <div class="front">
      <a href="https://twitter.com/share" class="twitter-share-button" data-via="ChrisGandrud">Tweet</a>

        <!-- Put this just before the closing body tag -->
        <script>!function(d,s,id){var         js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
        
      {% capture post_date %}{{ post.date | date: "%Y%m%d" }}{% endcapture %}
      {% if post_date != prev_post_date %}
        <div align="right" class="date-container">{{ post.date | date:"%A, %e %B %Y" | upcase }}</div>
      {% endif %}
      {% capture prev_post_date %}{{ post.date | date: "%Y%m%d" }}{% endcapture %}
        {% if post.post-link %}
        <h1><a href="{{ post.post-link }}" title="External link">{{ post.title }}</a> <a class="permalink" href="{{ post.url }}" title="Permanent link to: '{{ post.title }}'">&diams;</a></h1>
        {% else %}
        <h1>{{ post.title }} <a href="{{ post.url }}" title="Permanent link to: '{{ post.title }}'">&diams;</a></h1>
        {% endif %}
        {{ post.content }}
            {% include JB/comments %}

      </div>
      {% if forloop.last == false %}
      </br>
      <hr class="front">
      </br>
      {% endif %}
    {% endfor %}
  </ul>

</div>




