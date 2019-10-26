# This module was written in order to give the predicate functions for R_.filter, R_.map, R_.each, etc..
# to be called with any dynamic arguments as it can. What differante JavaScript from Ruby is that once you configured a function
# with a specific set of arguments then you must call it with that set or else you will get an exception.
# That is so useful for predicate functions that developer define out of the library scope. We send all the arguments
# to the developer defined Proc and if it's failed because of ArgumentError we call it recursively with less argument until success.

module Rudash
  module DynamicArgsCount
    def self.call(func, *args)
      func.call(*args)

    rescue ArgumentError
      raise ArgumentError.new('Argument Error') if args.size.zero?

      *initial, _last = args
      self.call(func, *initial)
    end
  end
end
