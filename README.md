The self gem adds a `self` method to all objects which is useful for debugging
internal state.

Installation
============

If you're using [pry](https://pryrepl.org), `gem install pry-self` and pry will
automatically require thse `self` library on startup.

If you're not using, `gem install self`.

If you're using Bundler add it to the development section of your Gemfile:

```ruby
group :development do
  gem 'self'
end
```

Usage
=====

When you are inside pry, you can use the self method on any object to access
its instance variables and private methods:

It lets you

1. Access instance variables (with tab completion)
2. Call private methods (with tab completion)
3. Update instance variables (yeah, with tab completion)

```ruby
[1] pry(main)> ls mouse
private methods: squeak!
instance variables: @head  @tail  @legs
[2] pry(main)> mouse.self.head
#<Mouse::Head 0x4567>
[3] pry(main)> mouse.head
Undefined method 'head' for #<Mouse 0x4567>
[4] pry(main)> mouse.self.squeak!
"Squeak!"
[5] pry(main)> mouse.squeak!
NoMethodError private method 'squeak!' called for #<Mouse 0x4567>
[6] pry(main)> mouse.self.tail = Mouse::Tail.new
#<Mouse::Tail 0x4567>
```

Bugs
====

This gem throws away the ruby method cache each time you use it. Do not use this in production!

Meta-fu
=======

Licensed under the MIT license, bug reports and contributions welcome.
