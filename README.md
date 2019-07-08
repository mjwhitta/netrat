# NetRat

A very simple Ruby implementation of netcat.

## How to install

```
$ gem install netrat
```

## Usage

```ruby
require "netrat"

# Listen
nr = NetRat.new(4444)
nr.listen(keepalive: true)

# Connect
nr = NetRat.new(4444, "127.0.0.1")
nr.connect
```

## Links

- [Source](https://gitlab.com/mjwhitta/netrat)
- [RubyGems](https://rubygems.org/gems/netrat)

## TODO

- Better README
- RDoc
