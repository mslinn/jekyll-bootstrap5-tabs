Jekyll Simple Tabs 5
[![Gem Version](https://badge.fury.io/rb/jekyll-simple-tab.svg)](https://badge.fury.io/rb/jekyll-simple-tab5)
===========

## Work in progress, does not work yet!

This Jekyll plugin provides navigation tabs, compatible with Bootstrap 5.

## Installation

Add this to the project `Gemfile`:
```ruby
gem "jekyll-simple-tab5"
```

Add this to the project `_config.yml`:

```yaml
plugins:
  - jekyll-simple-tab5
```

Bootstrap 5 is required. One way to do that is to add the following HTML into the head tag:
```html
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

```

## Usage

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

![Image](docs/tab-screen.gif)
