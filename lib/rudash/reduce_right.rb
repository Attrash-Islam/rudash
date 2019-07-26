require_relative 'reduce.rb'
require_relative '../utils/index.rb'

module Rudash
    module ReduceRight
        extend Rudash
    
        def reduce_right(collection, *rest_args)
            reversed_collection = Rudash::Utils.force_reverse(collection)
            self.reduce(reversed_collection, *rest_args)
        end
    end
end
