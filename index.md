---
title: Jekyll Bootstrap Quickstart
description: This is a sample page.
layout: default
---

[![mslinn -
jekyll-bootstrap-quickstart](https://img.shields.io/static/v1?label=mslinn&message=jekyll-bootstrap-quickstart&color=blue&logo=github)](https://github.com/mslinn/jekyll-bootstrap-quickstart) [![GitHub
tag](https://img.shields.io/github/tag/mslinn/jekyll-bootstrap-quickstart?include_prereleases=&sort=semver)](https://github.com/mslinn/jekyll-bootstrap-quickstart/releases/)

This site is built on:

- [Jekyll 4](https://jekyllrb.com)
- [Bootstrap 5](https://getbootstrap.com/) HTML5 framework from CDN

## This does not work yet!
See this [working minimal Bootstrap 5 tab example](https://codepen.io/mslinn/pen/OJOjVPR)

Given this content in a Jekyll page:
```
{% tabs test %}
  {% tab test#home %}
    Home at last!
  {% endtab %}
  {% tab test#profile %}
    Profile meeee...
  {% endtab %}
  {% tab test#profile %}
    Messages - I have none
  {% endtab %}
{% endtabs %}
```
The plugin should generate code similar to this:
```html
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" data-bs-toggle="tab" aria-current="page" href="#home">Home</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-bs-toggle="tab" aria-current="page" href="#profile">Profile</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-bs-toggle="tab" aria-current="page" href="#messages">Messages</a>
  </li>
</ul>

<div class="tab-content">
  <div class="tab-pane active" id="home" aria-labelledby="home-tab">Home at last!</div>
  <div class="tab-pane" id="profile" aria-labelledby="profile-tab">Profile meeee...</div>
  <div class="tab-pane" id="messages" aria-labelledby="messages-tab">Messages - I have none</div>
</div>
```

## Component Examples

This plugin was modified from the [`jekyll-simple-tabs` gem](https://github.com/Applifort/jekyll-simple-tab),
which only supports one set of tabs per page.
It will have to be extensively reworked in order to support Bootstrap 5.
Hopefully the resulting plugin will be able to support more than one set of tabs per page.

{% tabs test %}
  {% tab test#buttons %}
    <button type="button" class="btn btn-primary btn-sm">Primary</button>
    <button type="button" class="btn btn-secondary btn-sm">Secondary</button>
    <button type="button" class="btn btn-success btn-sm">Success</button>
    <button type="button" class="btn btn-danger btn-sm">Danger</button>
    <button type="button" class="btn btn-warning btn-sm">Warning</button>
    <button type="button" class="btn btn-info" btn-sm>Info</button>
    <button type="button" class="btn btn-light" btn-sm>Light</button>
    <button type="button" class="btn btn-dark" btn-sm>Dark</button>
    <button type="button" class="btn btn-link" btn-sm>Link</button>
  {% endtab %}

  {% tab test#alerts %}
    <div class="alert alert-primary" role="alert">
        This is a primary alert.
    </div>
    <div class="alert alert-secondary" role="alert">
      This is a secondary alert.
    </div>
    <div class="alert alert-success" role="alert">
      This is a success alert.
    </div>
    <div class="alert alert-danger" role="alert">
      This is a danger alert.
    </div>
    <div class="alert alert-warning" role="alert">
      This is a warning alert.
    </div>
    <div class="alert alert-info" role="alert">
      This is a info alert.
    </div>
    <div class="alert alert-light" role="alert">
      This is a light alert.
    </div>
    <div class="alert alert-dark" role="alert">
      This is a dark alert.
    </div>
  {% endtab %}

  {% tab test#misc %}
    <button type="button" class="btn btn-lg btn-danger" data-toggle="popover" title="Popover title"
      data-content="And here's some amazing content. It's very engaging. Right?">Click to toggle popover</button>
    <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1"
            data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown button
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
        </ul>
    </div>
  {% endtab %}
{% endtabs %}
