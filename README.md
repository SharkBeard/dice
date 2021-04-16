# Dice

Simulates die rolls. Works with dice of any number of sides. 

Why not just random numbers using `rand`? Rolling multiple die will have different weights to the random numbers than just a random number.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dice', git: 'https://github.com/sharkbeard/dice'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install dice

## Usage

Roll a d6

```ruby
Dice::Die.new(6).roll # 1-6
```

Roll a d20

```ruby
d20 = Dice::Die.new(20)
d20.roll # 1-20
```

### Rerolls

Reroll 1s & 2s

```ruby
Dice::Die.new(20, reroll: [1,2]).roll # 3-20
```

### Bags

You can put multiple dice in a bag and it will roll all of them at once and return the total.

```ruby
d6 = Dice::Die.new(6)
d8 = Dice::Die.new(8)
d10 = Dice::Die.new(10)

bag = Dice::Bag([d6, d8, d10])
bag.roll # 3-24
```

You can also see all the individual values.

```ruby
bag.results # [1-6,1-8,1-10]
```

#### Keep Die

Keep lowest roll

```ruby
dice = Array.new(2) { Dice::Die(20) }
Dice::Bag.new(dice, keep_lowest: 1) # 1-20
```

Keep highest roll

```ruby
Dice::Bag.new(dice, keep_highest: 1) # 1-20
```

#### Drop Die

Drop 2 lowest rolls

```ruby
dice = Array.new(6) { Dice::Die(6) }
Dice::Bag.new(dice, drop_lowest: 2).roll # 4-24
```

Drop highest roll

```ruby
Dice::Bag.new(dice, drop_highest: 1) # 5-30
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sharkbeard/dice.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
