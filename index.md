---
layout: page
title: Christopher Gandrud
tagline: Blog, Research, Teaching
---
{% include JB/setup %}

This site is **under development**. 

I am moving my current website from [http://christophergandrud.blogspot.com/](http://christophergandrud.blogspot.com/).


## Posts

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>




