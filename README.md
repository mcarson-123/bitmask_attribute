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

  # Hash of options to bit values
  OPTIONS_HASH = { option_1: 1, option_2: 2, option_3: 4, option_4: 8 }
  ...

  bitmask_attribute :actions, OPTIONS_HASH
```

You now get the following methods at your disposal:

`foo_instance.action_present?(1)`
-> returns boolean describing whether the actions attribute includes the input bit flag.

`foo_instance.add_action(1)`
-> adds the input bit flag to the mask

`foo_instance.remove_action(1)`
-> removes the input bit flag from the mask

`foo.option_1 = true`
or if using an active record model: `foo.update(option_1: true)`
-> adds the 1 bit to the bitmask attribute

`foo_option_1 = false`
or if using an active record model: `foo.update(option_1: false)`
-> removes the 1 bit from the bitmask attribute

## Contributing

1. Fork it ( https://github.com/[my-github-username]/bitmask_attribute/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
