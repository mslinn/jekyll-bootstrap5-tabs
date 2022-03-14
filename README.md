Jekyll Bootstrap 5 Tabs
[![Gem Version](https://badge.fury.io/rb/jekyll_bootstrap5_tabs.svg)](https://badge.fury.io/rb/jekyll_bootstrap5_tabs)
===========

<img src="docs/tabDemo.gif" width="500" height="auto" />

The original version, written by Artur Gabitov, expected Markdown and Bootstrap 4.
[This version](https://rubygems.org/gems/jekyll_bootstrap5_tabs) requires Bootstrap 5 and HTML, not Markdown.


## Installation

Add this to your project's `Gemfile`:
```ruby
gem 'jekyll_bootstrap5_tabs'
```

Add this to your project's `_config.yml`:

```yaml
plugins:
  - jekyll_bootstrap5_tabs
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jekyll_bootstrap5_tabs


## Usage

Bootstrap 5 is required.
One way to include Bootstrap 5 into a page within your project is to add the following HTML into the `<head/>` tag:
```html
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
```
...and add this to the bottom of the HTML file, within the `<body/>` tag:
```html
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
```

See this [working minimal Bootstrap 5 tab example](https://codepen.io/mslinn/pen/OJOjVPR)


## Two New Liquid Tags
The `jekyll_bootstrap5_tabs` plugin provides two new Liquid tags: `tabs` and `tab`.
Jekyll interprets the Liquid language when embedded into HTML pages.

For example, given the following content in a Jekyll page that has
[minimal front matter](https://jekyllrb.com/docs/front-matter/):
```
---
---
{% tabs demo %}
  {% tab demo#Home %}
    Home at last!
  {% endtab %}
  {% tab demo#Profile %}
    Profile meeee...
  {% endtab %}
  {% tab demo#Messages %}
    Messages - I have none
  {% endtab %}
{% endtabs %}
```
The outer tabs tag has a name: `demo`.
Conceptually, this name defines a namespace scope for the inner `tab` tags, but actually this version does not use the name for any purpose.
The inner `tab` tags reference the outer `tabs` tag (yes, this is redundant),
and introduces the name of the tab that it defines after the octothorpe (aka hash mark, number sign, and pound sign: #). A Bootstrap 5 tab is created for every `tab` tag, and the `id` for each `tag` is defined by the characters following the octothorpe.
This `id` is also displayed as the label for the `tab`, so if you want it capitalized a certain way, specify the tag capitalization in the `tab` tag.

The current implementation does not allow spaces within tab labels.
Instead, tab labels may only consist of one word each.

The `jekyll_bootstrap5_tabs` plugin will generate code similar to the following.
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
  <div class="tab-pane active" id="home" aria-labelledby="home-tab">
    <editor_fold Home>
    Home at last!
    </editor_fold>
  </div>
  <div class="tab-pane" id="profile" aria-labelledby="profile-tab">
    <editor_fold Profile>
      Profile meeee...
    </editor_fold>
  </div>
  <div class="tab-pane" id="messages" aria-labelledby="messages-tab">
    <editor_fold Messages>
      Messages - I have none
    </editor_fold>
  </div>
</div>
```

### New for Version 1.1.0
By default, the plugin output is not pretty-printed.
However, you can enable pretty-printing for a single set of tabs by including the `pretty` keyword in the `tabs` tag, like this:
```
{% tabs demo pretty %}
  ... tab tags go here
{% endtabs%}
```

You can enable pretty-printing for the entire Jekyll site by adding the following to `_config.yaml`:
```yaml
jekyll_bootstrap5_tabs:
  - pretty: true
```


## Installation

Add this line to your application's Gemfile, within the `jekyll_plugins` group:

```ruby
group :jekyll_plugins do
  gem 'jekyll_bootstrap5_tabs'
end
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jekyll_bootstrap5_tabs


## Development

After checking out the repo, run `bin/setup` to install dependencies.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run:
```
$ bundle exec rake install
```

To publicly release a new version:

 1. Update the version number in `version.rb`
 2. Commit changes to git.
 3. Run:
    ```shell
    $ bundle exec rake release
    ```
    The above creates a git tag for the version,
    pushes the created git tag to the git repo,
    and pushes the new `.gem` file in `pkg/` to [RubyGems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at [`github.com/mslinn/jekyll_bootstrap5_tabs`](https://github.com/mslinn/jekyll_bootstrap5_tabs).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
