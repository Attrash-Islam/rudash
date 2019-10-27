# Rudash

[![Gem Version](https://badge.fury.io/rb/rudash.svg)](https://badge.fury.io/rb/rudash)
[![Build Status](https://travis-ci.com/Attrash-Islam/rudash.svg?branch=master)](https://travis-ci.com/Attrash-Islam/rudash)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


The <a href="https://lodash.com">Lodash</a> popular JavaScript library exported as a Gem for Ruby developers.

## Installation
```
gem install rudash
```

### Philosophy of Rudash
Rudash was written by a JavaScript developer to help JavaScript developers integrate into the ruby world without knowing so much. Lodash JavaScript library is the most popular library ever with wide adoption and most of the JavaScripters use the utility functions in it almost all the time.

### Usage
```ruby
require 'rudash'

double = ->(value) { value * 2 }
array = [1, 2, 3]
R_.map(array, double) # => [2,4,6]

is_even = ->(value) { value.even? }
array = [1, 2, 3, 4]
R_.filter(array, is_even) # => [2,4]

# You can also use inline anonymous function style
array = [1, 2, 3, 4]
R_.filter(array,  ->(value) {
    value.even?
}) # => [2,4]
```

# API
#### See <a href="https://rudash.netlify.com/">Rudash Website</a>
