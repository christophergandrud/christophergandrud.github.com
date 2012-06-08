---
layout: page
title: Home
tagline: Blog, Research, Teach
---
{% include JB/setup %}

<h3 style ="text-align:center;">
This site is Under Development. 
<br/>
<br/>
I am moving from my previous website at: <a href = "http://christophergandrud.blogspot.com/">http://christophergandrud.blogspot.com/</a>.
</h3>

-----
-----

<div class="span9 column">
		<p class="pull-right">
		{% if page.previous.url %} 
		<a href="{{page.previous.url}}" title="Previous Post: {{page.previous.title}}">
		<i class="icon-chevron-left"></i></a> 
		{% endif %}   
		{% if page.next.url %} 	
		<a href="{{page.next.url}}" title="Next Post: {{page.next.title}}">
		<i class="icon-chevron-right"></i></a> 	
		{% endif %} 
		</p>  
</div>

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


