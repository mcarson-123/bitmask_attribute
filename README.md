# BitmaskAttribute

This gem adds helper methods to your class to facilitate the use of bitmask attributes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitmask_attribute'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitmask_attribute

## Usage

Include the concern in your class, and define which attribute is the bitmask attribute.
This attribute is expected to be an integer type.

```
# has int attribute called actions
Class Foo
  include BitmaskAttribute::Concern

  ...

  bitmask_attribute :actions
```

You now get the following methods at your disposal:

`foo_instance.action_present?(1)`
-> returns boolean describing whether the actions attribute includes the input bit flag.

`foo_instance.add_action(1)`
-> adds the input bit flag to the mask

`foo_instance.remove_action(1)`
-> removes the input bit flag from the mask

## Contributing

1. Fork it ( https://github.com/[my-github-username]/bitmask_attribute/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
