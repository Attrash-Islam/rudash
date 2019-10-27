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

## `“Array” Methods`

### <a id="_compact"></a>`R_.compact(array)`

Creates an array with all falsey values removed. *nil* are falsey but [*false*, *0*, and *""*] values are truthy values in ruby.

#### Arguments
`array` *(Array)*: The array to compact.

#### Returns
*(Array)*: Returns the new array of filtered values.

#### Example
```ruby
array = [1, 0, nil, "islam"]
R_.compact(array) # => [1, 0, "islam"]
```
* * *

### <a id="_concat"></a>`R_.concat(array, values*)`

Creates a new array concatenating array with any additional arrays and/or values.

#### Arguments
`array` *(Array)*: The array to concatenate.

`values*` *(\*)*: The values to concatenate.

#### Returns
*(Array)*: Returns the new concatenated array.

#### Example
```ruby
arr1 = [1, 2, 3]
arr2 = [4]
R_.concat(arr1, arr2) # => [1, 2, 3, 4]

R_.concat(1, { a: 1 }) # => [1, { a: 1 }]
```
* * *

### <a id="_intersection"></a>`R_.intersection([arrays])`

Creates an array of unique values that are included in all given arrays.

#### Arguments
`[arrays]` *(...Array)*: The arrays to inspect.

#### Returns
*(Array)*: Returns the new array of intersecting values.

#### Example
```ruby
R_.intersection([2, 1], [2, 3]) # => [2]
R_.intersection([1, 2, 3], [1, 2], [2]) # => [2]
```
* * *

### <a id="_union"></a>`R_.union([arrays])`

Creates an array of unique values, in order, from all given arrays.

#### Arguments
`[arrays]` *(...Array)*: The arrays to inspect.

#### Returns
*(Array)*: Returns the new array of combined values.

#### Example
```ruby
R_.union([2, 1], [2, 3]) # => [2,1,3]

# Array of hashes
arr1 = [{ a: 1 }]
arr2 = [{ a: 1 }]
arr3 = [{ a: 1, b: 2 }]
R_.union(arr1, arr2, arr3) # => [{ a: 1 }, { a: 1, b: 2 }]
```
* * *

### <a id="_join"></a>`R_.join(array, [separator = ','])`

Converts all elements in array into a string separated by separator.

#### Arguments
`array` *(Array)*: The array to convert.

`[separator=',']` *(String)*: The element separator.

#### Returns
*(String)*: Returns the joined string.

#### Example
```ruby
R_.join([1, 2, 3]) # => '1,2,3'
R_.join([1, 2, 3], '*') # => '1*2*3'
R_.join([1, 2, 3], 5) # => '15253'
R_.join(0) # => ''
```
* * *

### <a id="_slice"></a>`R_.slice(array, [start=0], [end=array.size])`

Creates a slice of array from start up to, but not including, end.

#### Arguments
`array` *(Array)*: The array to slice.

`[start=0]` *(Number)*: The start position.

`[end=array.size]` *(Number)*: The end position.

#### Returns
*(Array)*: Returns the slice of array.

#### Example
```ruby
R_.slice([1, 2, 3], 0, 2) # => [1, 2]
R_.slice([1, 2, 3], 1) # => [2,3]
R_.slice([1, 2, 3], 1, 2) # => [2]
R_.slice([1,2,3,4,5,6], 0, 3) # => [1, 2, 3]
```
* * *

### <a id="_remove"></a>`R_.remove(array, [predicate_fn = R_.identity])`

Removes all elements from array that predicate returns truthy for and returns an array of the removed elements. The predicate is invoked with two arguments: (value, index).

#### Arguments
`array` *(Array)*: The array to modify.

`[predicate_fn = R_.identity]` *(Proc)*: The proc invoked per iteration.

#### Returns
*(Array)*: Returns the new array of removed elements.

#### Example
```ruby
# Simple arrays
array = [1, 2, 3, 4]
is_even = ->(v) { v.even? }
removed_items = R_.remove(array, is_even)

removed_items # => [2,4]
array # => [1,3]

# Array of hashes
persons = [
    { name: 'islam', sex: 'male' },
    { name: 'sabel', sex: 'female' },
    { name: 'sonia', sex: 'female' }
]

removed_persons = R_.remove(persons, { sex: 'female' })

removed_persons # => [{ name: 'sabel', sex: 'female' },{ name: 'sonia', sex: 'female' }]
persons # => [{ name: 'islam', sex: 'male' }]
```
* * *

### <a id="_head"></a>`R_.head(array)`

Gets the first element of array.

#### Aliases
R_.first

#### Arguments
`array` *(Array)*: The array to query.

#### Returns
*(\*)*: Returns the first element of array.

#### Example
```ruby
array = [1, 2, 3]
R_.head(array) # => 1

empty_array = []
R_.head(empty_array) # => nil
```
* * *

### <a id="_last"></a>`R_.last(array)`

Gets the last element of array.

#### Arguments
`array` *(Array)*: The array to query.

#### Returns
*(\*)*: Returns the last element of array.

#### Example
```ruby
array = [1, 2, 3]
R_.last(array) # => 3

empty_array = []
R_.last(empty_array) # => nil
```
* * *

### <a id="_tail"></a>`R_.tail(array)`

Gets all but the first element of array.

#### Arguments
`array` *(Array)*: The array to query.

#### Returns
*(Array)*: Returns the slice of array.

#### Example
```ruby
array = [1, 2, 3]
R_.tail(array) # => [2,3]

empty_array = []
R_.tail(empty_array) # => []
```
* * *

### <a id="_take"></a>`R_.take(array, [n=1])`

Creates a slice of array with n elements taken from the beginning.

#### Arguments
`array` *(Array)*: The array to query.
`[n=1]` *(number)*: The number of elements to take.

#### Returns
*(Array)*: Returns the slice of array.

#### Example
```ruby
array = [1, 2, 3]
R_.take(array) # => [1]

array = [1, 2, 3]
R_.take(array, 2) # => [1, 2]
```
* * *

### <a id="_initial"></a>`R_.initial(array)`

Gets all but the last element of array.

#### Arguments
`array` *(Array)*: The array to query.

#### Returns
*(Array)*: Returns the slice of array.

#### Example
```ruby
array = [1, 2, 3]
R_.initial(array) # => [1, 2]

one_item_array = [1]
R_.initial(one_item_array) # => []
```
* * *

### <a id="_uniq"></a>`R_.uniq(array)`

Creates a duplicate-free version of an array.

#### Arguments
`array` *(Array)*: The array to inspect.

#### Returns
*(Array)*: Returns the new duplicate free array.

#### Example
```ruby
array = [1,2, 2, 3, 3, 3]
R_.uniq(array) # => [1, 2, 3]
```
* * *

### <a id="_difference"></a>`R_.difference(array, *[values])`

Creates an array of array values not included in the other given arrays. The order and references of result values are determined by the first array

#### Arguments
`array` *(Array)*: The array to inspect.

`values` *(...Array)*: The values to exclude.

#### Returns
*(Array)*: Returns the new array of filtered values.

#### Example
```ruby
arr1 = [1, 2, 3]
arr2 = [2]
arr3 = [3]

R_.difference(arr1, arr2) # => [1, 3]
R_.difference(arr1, arr2, arr3) # => [1]
```
* * *

### <a id="_without"></a>`R_.without(array, *[values])`

Creates an array excluding all given values.

#### Arguments
`array` *(Array)*: The array to inspect.

`values` *(...Array)*: The values to exclude.

#### Returns
*(Array)*: Returns the new array of filtered values.

#### Example
```ruby
arr1 = [1, 2, 3]

R_.without(arr1, 2) # => [1, 3]
R_.without(arr1, 2, 3) # => [1]
```
* * *

### <a id="_drop_right"></a>`R_.drop_right(array, [n=1])`

Creates a slice of `array` with `n` elements dropped from the end.

#### Arguments
`array` *(Array)*: The array to inspect.
`[n=1]` *(number)*: The number of elements to drop.

#### Returns
*(Array)*: Returns the slice of `array`.

#### Example
```ruby
array = [1, 2, 3]

R_.drop_right(array) # => [1, 2]
R_.drop_right(array, 2) # => [1]
```
* * *

## `“Collection” Methods`

### <a id="_each"></a>`R_.each(collection, iteratee_fn = R_.identity)`

Iterates over elements of collection and invokes iteratee for each element. The iteratee is invoked with two arguments: (value, index|key).

#### Aliases
R_.for_each

#### Arguments
`collection` *(Array|Hash)*: The collection to iterate over.

`iteratee_fn` *(Proc)*: The proc function invoked per iteration.

#### Returns
*(\*)*: Returns collection.

#### Example
```ruby

# Hash
hash = { a: 1, b: 2 }
sum = 0
eacher = ->(value) { sum += value }
R_.each(hash, eacher)
sum # => 3

# Array
array = [1, 2, 3]
new_array = []
eacher = ->(value) { new_array << value }
R_.each(array, eacher)
new_array # => [1, 2, 3]
```
* * *

### <a id="_each_right"></a>`R_.each_right(collection, iteratee_fn = R_.identity)`

This method is like R_.each except that it iterates over elements of collection from right to left.

#### Aliases
R_.for_each_right

#### Arguments
`collection` *(Array|Hash)*: The collection to iterate over.

`iteratee_fn` *(Proc)*: The proc function invoked per iteration.

#### Returns
*(\*)*: Returns collection.

#### Example
```ruby

# Hash
hash = { a: 1, b: 2 }
sum = 0
eacher = ->(value) { sum += value }
R_.each_right(hash, eacher)
sum # => 3

# Array
array = [1, 2, 3]
new_array = []
eacher = ->(value) { new_array << value }
R_.each_right(array, eacher)
new_array # => [3,2,1]
```
* * *


### <a id="_every"></a>`R_.every?(array, predicate_fn)`

Checks if predicate returns truthy for all elements of array.

#### Arguments
`array` *(Array)*: The collection to iterate over.

`predicate_fn` *(Proc)*: The proc function invoked per iteration.

#### Returns
*(boolean)*: Returns true if all elements pass the predicate check, else false.

#### Example
```ruby
is_even = ->(value) { value.even? }
R_.every?([1, 2, 3, 4], is_even) # => false

persons = [
    { name: 'islam', sex: 'male' },
    { name: 'sabel', sex: 'female' },
    { name: 'sonia', sex: 'female' }
]
        
R_.every?(persons, { sex: 'male' }) # => false
```
* * *

### <a id="_filter"></a>`R_.filter(collection, predicate_fn = R_.identity)`

Iterates over elements of collection, returning an array of all elements predicate returns truthy for. The predicate is invoked with two arguments: [value, index|key]

#### Arguments
`collection` *(Array|Hash)*: The collection to iterate over.

`predicate_fn` *(Proc)*: The function invoked per iteration.

#### Returns
*(Array)*: Returns the new filtered array.

#### Example
```ruby
# Filtering array
is_even = ->(value) { value.even? }
R_.filter([1, 2, 3, 4], is_even) # => [2,4]

# Filtering array of hashes
persons = [
    { name: 'islam', sex: 'male' },
    { name: 'sabel', sex: 'female' },
    { name: 'sonia', sex: 'female' }
]

R_.filter(persons, { sex: 'female' })
# => [{ name: 'sabel', sex: 'female' }, { name: 'sonia', sex: 'female' }]

# Filtering hash
is_even = ->(v, k) { v.even? }
R_.filter({ a: 1, b: 2, c: 3, d: 4 }, is_even) # => [2,4]
```
* * *

### <a id="_reject"></a>`R_.reject(collection, predicate_fn = R_.identity)`

The opposite of R_.filter, this method returns the elements of collection that predicate does not return truthy for.

#### Arguments
`collection` *(Array|Hash)*: The collection to iterate over.

`predicate_fn` *(Proc)*: The function invoked per iteration.

#### Returns
*(Array)*: Returns the new filtered array.

#### Example
```ruby
# Filtering array
is_even = ->(value) { value.even? }
R_.reject([1, 2, 3, 4], is_even) # => [1,3]

# Filtering array of hashes
persons = [
    { name: 'islam', sex: 'male' },
    { name: 'sabel', sex: 'female' },
    { name: 'sonia', sex: 'female' }
]

R_.reject(persons, { sex: 'female' })
# => [{ name: 'islam', sex: 'male' }]

# Filtering hash
is_even = ->(v, k) { v.even? }
R_.reject({ a: 1, b: 2, c: 3, d: 4 }, is_even) # => [1,3]
```
* * *

### <a id="_map"></a>`R_.map(collection, iteratee_fn = R_.identity)`

Creates an array of values by running each element in collection thru iteratee. The iteratee is invoked with two arguments:
[value, index|key].

#### Arguments
`collection` *(Array|Hash)*: The collection to iterate over.

`iteratee_fn` *(Proc)*: The function invoked per iteration.

#### Returns
*(Array)*: Returns the new mapped array.

#### Example
```ruby

# Map for values
double = ->(value) { value * 2 }
R_.map([1, 2, 3], double) # => [2,4,6]

# Map for values and indexes
double_even_index = ->(value, index) {
    index.even? ? value * 2 : value
}

R_.map([1,2,3,4,5,6,7,8,9], double_even_index) # => [2,2,6,4,10,6,14,8,18]

# Mapping Hashes
inc_by_one = ->(value) { value + 1 }
hash = { a: 1 }
R_.map(hash, inc_by_one) # => [2]

# Mapping Strings
add_e_to_even_indexes = ->(value, index) {
    index.even? ? value + 'e' : value
}

R_.map('islam', add_e_to_even_indexes) # => ["ie", "s", "le", "a", "me"]
```
* * *

### <a id="_find"></a>`R_.find(collection, iteratee_fn = R_.identity)`

Iterates over elements of collection, returning the first element predicate returns truthy for. The predicate is invoked with two arguments: (value, index|key).

#### Arguments
`collection` *(Array|Hash)*: The collection to inspect.

`iteratee_fn` *(Proc)*: The function invoked per iteration.

#### Returns
*(\*)*: Returns the matched element, else nil.

#### Example
```ruby

is_even = ->(value) { value.even? }
R_.find([1, 2, 3, 4], is_even) # => 2

persons = [
    { name: 'islam', sex: 'male' },
    { name: 'sabel', sex: 'female' },
    { name: 'sonia', sex: 'female' }
]

R_.find(persons, { sex: 'female' }) # => { name: 'sabel', sex: 'female' }
```
* * *

### <a id="_find_last"></a>`R_.find_last(collection, iteratee_fn = R_.identity)`

This method is like R_.find except that it iterates over elements of collection from right to left.

#### Arguments
`collection` *(Array|Hash)*: The collection to inspect.

`iteratee_fn` *(Proc)*: The function invoked per iteration.

#### Returns
*(\*)*: Returns the matched element, else nil.

#### Example
```ruby

is_even = ->(value) { value.even? }
R_.find_last([1, 2, 3, 4], is_even) # => 4

persons = [
    { name: 'islam', sex: 'male' },
    { name: 'sabel', sex: 'female' },
    { name: 'sonia', sex: 'female' }
]

R_.find_last(persons, { sex: 'female' }) # => { name: 'sonia', sex: 'female' }
```
* * *

### <a id="_reduce"></a>`R_.reduce(collection, iteratee_fn = R_.identity, accumulator*)`

Reduces collection to a value which is the accumulated result of running each element in collection thru iteratee, where each successive invocation is supplied the return value of the previous. If accumulator is not given, the first element of collection is used as the initial value. The iteratee is invoked with four arguments:
(accumulator, value, index|key).

#### Arguments
`collection` *(Array|Hash)*: The collection to iterate over.

`iteratee_fn` *(Proc)*: The function invoked per iteration.

`accumulator` *(Any)*: The initial value.

#### Returns
*(\*)*: Returns the accumulated value.

#### Example
```ruby

# Array reducer
sumer = ->(acc, current) {
    acc + current
}

R_.reduce([1, 2, 3, 4, 5], sumer) # => 15

# Hash reducer
hash = { a: 1, b: 2 }
hash_sumer = ->(acc, current) { acc + current }
R_.reduce(hash, hash_sumer, 0) # => 3

# String reducer
joiner = ->(acc, current) {
    acc + ',' + current
}

R_.reduce('islam', joiner) # => 'i,s,l,a,m'

```
* * *

### <a id="_reduce_right"></a>`R_.reduce_right(collection, iteratee_fn = R_.identity, accumulator*)`

This method is like _.reduce except that it iterates over elements of collection from right to left.

#### Arguments
`collection` *(Array|Hash)*: The collection to iterate over.

`iteratee_fn` *(Proc)*: The function invoked per iteration.

`accumulator` *(Any)*: The initial value.

#### Returns
*(\*)*: Returns the accumulated value.

#### Example
```ruby

sumer = ->(acc, current) {
    acc + current
}

R_.reduce_right([1, 2, 3, 4, 5], sumer) # => 15

hash = { a: 1, b: 2 }
hash_sumer = ->(acc, current) { acc + current }
R_.reduce_right(hash, hash_sumer, 0) # => 3
```
* * *

### <a id="_some"></a>`R_.some?(collection, predicate_fn = R_.identity)`

Checks if predicate returns truthy for any element of collection. Iteration is stopped once predicate returns truthy. The predicate is invoked with two arguments: (value, index|key).

#### Arguments
`collection` *(Array|Hash)*: The collection to iterate over.

`predicate_fn` *(Proc)*: The function invoked per iteration.

#### Returns
*(Boolean)*: Returns true if any element passes the predicate check, else false.

#### Example
```ruby

is_even = ->(value) { value.even? }
R_.some?([1, 2, 3, 4], is_even) # => true

persons = [
    { name: 'islam', sex: 'male' },
    { name: 'sabel', sex: 'female' },
    { name: 'sonia', sex: 'female' }
]

R_.some?(persons, { sex: 'male' }) # => true

```
* * *

### <a id="_size"></a>`R_.size(collection)`

Gets the size of collection by returning its length for array-like values or the number of own enumerable string keyed properties for objects.

#### Arguments
`collection` *(Array|Hash|string)*: The collection to inspect.

#### Returns
*(Number)*: Returns the collection size.

#### Example
```ruby

R_.size([1, 2, 3]) # => 3
R_.size({ a: 1, b: 2 }) # => 2
R_.size("pebbles") # => 7
```
* * *

### <a id="_reverse"></a>`R_.reverse(collection)`

Reverses array and/or string so that the first element becomes the last, the second element becomes the second to last, and so on.

#### Arguments
`collection` *(Array|string)*: The collection to modify.

#### Returns
*(Array|string)*: Returns the reversed collection.

#### Example
```ruby

R_.reverse([1, 2, 3]) # => [3,2,1]
R_.reverse('islam') # => 'malsi'
```
* * *

## `“Function” Methods`

### <a id="_flip"></a>`R_.flip(func)`

Creates a proc that invokes the passed proc with arguments reversed.

#### Arguments
`func` *(Proc)*: The proc to flip arguments for.

#### Returns
*(Proc)*: Returns the new flipped proc.

#### Example
```ruby
subtract = ->(a, b) { a - b }
subtract.call(2, 1) # => 1

flipped_subtract = R_.flip(subtract)
flipped_subtract.call(2, 1) # => -1
```
* * *

### <a id="_group_by"></a>`R_.group_by(collection, iteratee)`

Creates an object composed of keys generated from the results of running each element of collection thru iteratee. The order of grouped values is determined by the order they occur in collection. The corresponding value of each key is an array of elements responsible for generating the key. The iteratee is invoked with one argument: (value).

#### Arguments
`collection` *(Array|Hash)*: The collection to iterate over.
`[iteratee=_.identity]` (Proc): The iteratee to transform keys.

#### Returns
*(Object)*: Returns the composed aggregate object.

#### Example
```ruby
iteratee = ->(value) { value.floor }
R_.group_by([6.1, 4.2, 6.3], iteratee);
# => { '4': [4.2], '6': [6.1, 6.3] }
```
* * *

### <a id="_negate"></a>`R_.negate(func)`

Creates a proc that negates the result of the passed proc.

#### Arguments
`func` *(Proc)*: The proc to negate.

#### Returns
*(Proc)*: Returns the new negated proc.

#### Example
```ruby
is_even = ->(value) { value.even? }
is_odd = R_.negate(is_even)

is_even.call(2) # => true
is_even.call(1) # => false
is_odd.call(1) # => true
is_odd.call(2) # => false

R_.filter([1, 2, 3, 4], is_odd) # => [1,3]
```
* * *

### <a id="_curry"></a>`R_.curry(func)`

Creates a proc that accepts arguments of proc and either invokes proc returning its result, if at least arity number of arguments have been provided, or returns a proc that accepts the remaining func arguments, and so on.

#### Arguments
`func` *(Proc)*: The proc to curry.

#### Returns
*(Proc)*: Returns the new curried proc.

#### Example
```ruby
inc = ->(a, b) { a + b }
incByOne = R_.curry(inc).call(1)
incByOne.call(3) # => 4
```
* * *


## `“Hash” Methods`

### <a id="_get"></a>`R_.get(object, path)`

Gets the value at path of object.

#### Arguments
`object` *(Hash|Array)*: The object to query.

`path` *(String)*: The path of the property to get.

#### Returns
*(\*)*: Returns the resolved value.

#### Example
```ruby

# Simple hash
hash = { a: 1, b: 2 }
R_.get(hash, 'a') # => 1
R_.get(hash, 'b') # => 2

# Complex hash with arrays
hash = { a: { b: { c: [{ a: 1 }] } } }
R_.get(hash, 'a.b.c.0.a') # => 1

# You can use also array [] notations
R_.get(hash, 'a.b.c[0].a') # => 1

# You can use Array paths
array_path = ['a', 'b', 'c', '0', 'a']
R_.get(hash, array_path) # => 1

# Not found case
hash = { a: 1, b: 2 }
R_.get(hash, 'a.b.c.xvx.a') # => nil
```
* * *

### <a id="_set"></a>`R_.set(object, path, value)`

Sets the value at path of object. If a portion of path doesn't exist, it's created.

#### Arguments
`object` *(Hash|Array)*: The object to query.

`path` *(String)*: The path of the property to set.

`value` *(\*)*: The value to set.

#### Returns
*(Hash|Array)*: Returns object.

#### Example
```ruby
# Simple hash
hash = { a: 1, b: 2 }
R_.set(hash, 'a', 2)
hash # => { a: 2, b: 2 }

# Hash path creation if not exist
hash = { a: 1, b: 2 }
R_.set(hash, 'c.x.y', 2)
hash # => { a: 1, b: 2, c: { x: { y: 2 } } }

# Hash containing array
hash = { a: 1, b: 2 }
R_.set(hash, 'c.x.y[0]', 2)
hash # => { a: 1, b: 2, c: { x: { y: [2] } } }
```
* * *

### <a id="_unset"></a>`R_.unset(object, path)`

Removes the property at `path` of `object`.

#### Arguments
`object` *(Hash|Array)*: The object to modify.

`path` *(String)*: The path of the property to unset.

#### Returns
*(boolean)*: Returns `true` if the property exists, else `false`.

* * *

### <a id="_update"></a>`R_.update(object, path, updater_fn)`

This method is like R_.set except that accepts updater proc to produce the value to set.

#### Arguments
`object` *(Hash|Array)*: The object to modify.

`path` *(String)*: The path of the property to set.

`updater_fn` *(Proc)*: The proc to produce the updated value depends on the current value.

#### Returns
*(Hash|Array)*: Returns object.

#### Example
```ruby
# Already exist path
hash = { a: [{ b: { c: 3 } }] };
manipulate_self = ->(n) { n * n }

R_.update(hash, 'a[0].b.c', manipulate_self)
hash # => { a: [{ b: { c: 9 } }] }

# For not exist paths
hash = { a: [{ b: { c: 3 } }] }

add_one_if_exist_else_zero = ->(n) {
    n.nil? ? 0 : n + 1
}

R_.update(hash, 'x[0].y.z', add_one_if_exist_else_zero);
hash # => { a: [{ b: { c: 3 } }], x: [{ y: { z: 0 }}] }
```
* * *

### <a id="_at"></a>`R_.at(object, paths)`

Creates an array of values corresponding to paths of hash.

#### Arguments
`object` *(Hash|Array)*: The object to query.

`paths` *(Array of String)*: The paths of the properties to get.

#### Returns
*(\*)*: Returns the resolved value.

#### Example
```ruby

# Simple hash
hash = { a: 1, b: 2 }
R_.at(hash, ['a', 'b']) # => [1, 2]

hash = { 'a' => 1, 'b' => 2 }
R_.at(hash, ['a', 'b']) # => [1, 2]

hash = { a: { b: { c: 3 } } }
R_.at(hash, ['a.b', 'a.b.c']) # => [{ c: 3 }, 3]
```
* * *

### <a id="_pick"></a>`R_.pick(hash, [paths])`

Creates an hash composed of the picked hash properties.

#### Arguments
`hash` *(Hash)*: The source hash.

`[paths]` *(String | Array of String)*: The property paths to pick.

#### Returns
*(Hash)*: Returns the new hash.

#### Example
```ruby

# Simple hash with one specific path
hash = { a: 1, b: 2 }
R_.pick(hash, 'a') # => { a: 1 }

# Simple hash with multiple paths
hash = { a: 1, b: 2 }
R_.pick(hash, ['a', 'b']) # => { a: 1, b: 2 }

# Simple hash with ignoring not exist paths
hash = { a: 1, b: 2 }
R_.pick(hash, ['a', 'b', 'c.x']) # => { a: 1, b: 2 }

# Complex Hash and Array
hash = { a: 1, b: 2, c: { x: { y: [2, 1] } } }
picked = R_.pick(hash, ['c.x.y[0]', 'a'])
picked # => { a: 1, c: { x: { y: [2] } } }

picked2 = R_.pick(hash, ['c.x.y[0]', 'c.x.y[1]', 'a'])
picked2 # => { a: 1, c: { x: { y: [2, 1] } } }
```
* * *

### <a id="_keys"></a>`R_.keys(hash)`

Gets the keys of hash.

#### Arguments
`hash` *(Hash)*: The hash to query.

#### Returns
*(Array)*: Returns the array of keys.

#### Example
```ruby
hash = { a: 1, b: 2 }
R_.keys(hash) # => ['a', 'b']
```

## `“String” Methods`

### <a id="_capitalize"></a>`R_.capitalize(str)`

Converts the first character of string to upper case and the remaining to lower case.

#### Arguments
`str` *(String)*: The string to capitalize.

#### Returns
*(String)*: Returns the capitalized string.

#### Example
```ruby
R_.capitalize(nil) # => ''
R_.capitalize(4) # =>'4'
R_.capitalize('fiverr') # =>'Fiverr'
```
* * *


## `“Util” Methods`

### <a id="_flow"></a>`R_.flow([funs])`

Creates a function that returns the result of invoking the given functions with the this binding of the created function, where each successive invocation is supplied the return value of the previous.

#### Arguments
`[funcs]` *(Function|Function[])*: The functions to invoke.

#### Returns
*(Function)*: Returns the new composite function.

#### Example
```ruby
inc_two_numbers = ->(num1, num2) { num1 + num2 }
square = ->(number) { number * number }
double = ->(number) { number * 2 }
composed = R_.flow([inc_two_numbers, square, double])
composed.call(10, 20) # => 1800
```
* * *

### <a id="_flow_right"></a>`R_.flow_right([funs])`

This method is like `R_.flow` except that it creates a function that invokes the given functions from right to left.

#### Arguments
`[funcs]` *(Function|Function[])*: The functions to invoke.

#### Returns
*(Function)*: Returns the new composite function.

#### Example
```ruby
square = ->(number) { number * number }
double = ->(number) { number * 2 }
composed = R_.flow([square, double])
composed.call(10, 20) # => 400
```
* * *

### <a id="_identity"></a>`R_.identity(value)`

This method returns the first argument it receives.

#### Arguments
`value` *(\*)*: Any value.

#### Returns
*(\*)*: Returns value.

#### Example
```ruby
R_.identity(0) # => 0

R_.identity(1, 2) # => 1
```
* * *

### <a id="_range"></a>`R_.range([start=0], end, [step=1])`

Creates an array of numbers (positive and/or negative) progressing from start up to, but not including, end. A step of -1 is used if a negative start is specified without an end or step. If end is not specified, it's set to start with start then set to 0.

#### Arguments
`[start=0]` *(Number)*: The start of the range.

`end` *(Number)*: The end of the range.

`[step=1]` *(Number)*: The value to increment or decrement by.

#### Returns
*(Array)*: Returns the range of numbers.

#### Example
```ruby
R_.range(4) # => [0, 1, 2, 3]

R_.range(-4) # => [0, -1, -2, -3]

R_.range(1, 5) # => [1, 2, 3, 4]

R_.range(0, 20, 5) # => [0, 5, 10, 15]

R_.range(0, -4, -1) # => [0, -1, -2, -3]

R_.range(1, 4, 0) # => [1, 1, 1]

R_.range(0) # => []
```
* * *

## “Lang” Methods

### <a id="_is_nil"></a>`R_.nil?(value)`

Checks if value is nil.

#### Arguments
`value` *(\*)*: Any value.

#### Returns
*(Boolean)*: Returns true if value is nilish, else false.

#### Example
```ruby
R_.nil?(nil) # => true

R_.nil?(0) # => false
```
* * *

### <a id="_is_string"></a>`R_.string?(value)`

Checks if value is string.

#### Arguments
`value` *(\*)*: Any value.

#### Returns
*(Boolean)*: Returns true if value is string, else false.

#### Example
```ruby
R_.string?(nil) # => false

R_.string?('str') # => true
```
* * *


### <a id="_is_array"></a>`R_.array?(value)`

Checks if value is classified as an Array object.

#### Arguments
`value` *(\*)*: The value to check.

#### Returns
*(Boolean)*: Returns true if value is an array, else false.

#### Example
```ruby
R_.array?([1, 2, 3]) # => true

R_.array?({ a: 1 }) # => false
```
* * *

### <a id="_is_hash"></a>`R_.hash?(value)`

Checks if value is classified as an Hash object.

#### Arguments
`value` *(\*)*: The value to check.

#### Returns
*(Boolean)*: Returns true if value is a hash, else false.

#### Example
```ruby
R_.hash?([1, 2, 3]) # => false

R_.hash?({ a: 1 }) # => true
```
* * *

### <a id="_is_number"></a>`R_.number?(value)`

Checks if value is classified as an Numeric object.

#### Arguments
`value` *(\*)*: The value to check.

#### Returns
*(Boolean)*: Returns true if value is a number, else false.

#### Example
```ruby
R_.number?(56) # => true

R_.number?({ a: 1 }) # => false
```
* * *

### <a id="_is_empty"></a>`R_.empty?(value)`

Checks if value is an empty collection.

#### Arguments
`value` *(\*)*: The value to check.

#### Returns
*(Boolean)*: Returns true if value is empty, else false.

#### Example
```ruby
R_.empty?([1, 2, 3]) # => false

R_.empty?({ a: 1 }) # => false

R_.empty?([]) # => true

R_.empty?({}) # => true
```
* * *

### <a id="_is_equal"></a>`R_.equal?(value, other)`

Performs a deep comparison between two values to determine if they are equivalent.

#### Arguments
`value` *(\*)*: The value to compare.

`other` *(\*)*: The other value to compare.

#### Returns
*(Boolean)*: Returns true if the values are equivalent, else false.

#### Example
```ruby
hash1 = { a: { b: 2 } }
hash2 = { a: { b: 2 } }

R_.equal?(hash1, hash2) # => true
```
* * *

### <a id="_is_eq"></a>`R_.eq?(value, other)`

Performs a reference comparison between two values to determine if they are equivalent.

#### Arguments
`value` *(\*)*: The value to compare.

`other` *(\*)*: The other value to compare.

#### Returns
*(Boolean)*: Returns true if the values are equivalent, else false.

#### Example
```ruby
hash1 = { a: 1 }
hash2 = { a: 1 }

R_.eq?(hash1, hash2) # => false
R_.eq?(hash1, hash1) # => false
```
* * *


## `“Seq” Methods`

### <a id="_chain"></a>`R_.chain(value)`

Creates a Rudash wrapper instance that wraps value with explicit method chain sequences enabled. The result of such sequences must be unwrapped with value().

#### Arguments
`value` *(\*)*: The value to wrap.

#### Returns
*(Object)*: Returns the new Rudash wrapper instance.

#### Example
```ruby
filter_even = ->(number) { number.even? }
inc_by_one = ->(number) { number + 1 }

# You can chain using all Rudash functions.
# Pay attention that we are not sending the data ([1, 2, 3, 4])
# in the arguments since it is been sent by the wrapped value
result = R_.chain([1, 2, 3, 4])
            .filter(filter_even)
            .map(inc_by_one)
            .head()
            .value() # => 3
```
* * *
