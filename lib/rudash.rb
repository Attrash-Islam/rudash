require_relative './rudash/map.rb'
require_relative './rudash/is_nil.rb'
require_relative './rudash/filter.rb'
require_relative './rudash/some.rb'
require_relative './rudash/every.rb'
require_relative './rudash/find.rb'
require_relative './rudash/concat.rb'
require_relative './rudash/find_last.rb'
require_relative './rudash/reduce.rb'
require_relative './rudash/reduce_right.rb'
require_relative './rudash/compact.rb'
require_relative './rudash/head.rb'
require_relative './rudash/last.rb'
require_relative './rudash/tail.rb'
require_relative './rudash/size.rb'
require_relative './rudash/flip.rb'
require_relative './rudash/identity.rb'
require_relative './rudash/get.rb'
require_relative './rudash/is_array.rb'
require_relative './rudash/is_equal.rb'
require_relative './rudash/is_hash.rb'
require_relative './rudash/is_empty.rb'
require_relative './rudash/reverse.rb'
require_relative './rudash/curry.rb'
require_relative './rudash/is_number.rb'
require_relative './rudash/keys.rb'
require_relative './rudash/each.rb'
require_relative './rudash/uniq.rb'
require_relative './rudash/difference.rb'
require_relative './rudash/is_string.rb'
require_relative './rudash/eq.rb'
require_relative './rudash/each_right.rb'
require_relative './rudash/at.rb'
require_relative './rudash/negate.rb'
require_relative './rudash/capitalize.rb'
require_relative './rudash/without.rb'
require_relative './rudash/intersection.rb'
require_relative './rudash/join.rb'
require_relative './rudash/initial.rb'
require_relative './rudash/set.rb'
require_relative './rudash/pick.rb'
require_relative './rudash/update.rb'
require_relative './rudash/slice.rb'
require_relative './rudash/remove.rb'
require_relative './rudash/union.rb'
require_relative './rudash/reject.rb'
require_relative './rudash/range.rb'
require_relative './rudash/group_by.rb'
require_relative './rudash/take.rb'
require_relative './rudash/drop_right.rb'
require_relative './rudash/chain.rb'
require_relative './rudash/flow.rb'

require_relative './utils/chain_wrapper.rb'

# This is the exposed Gem class that contains all Rudash methods.
# New methods can use already implemented methods in the library by refering to "self"
# in the method if and only if the method get extended into the R_ class.
class R_
    extend Rudash::Map
    extend Rudash::IsNil
    extend Rudash::Filter
    extend Rudash::Some
    extend Rudash::Every
    extend Rudash::Find
    extend Rudash::Concat
    extend Rudash::FindLast
    extend Rudash::Reduce
    extend Rudash::ReduceRight
    extend Rudash::Compact
    extend Rudash::Head
    extend Rudash::Last
    extend Rudash::Tail
    extend Rudash::Size
    extend Rudash::Flip
    extend Rudash::Identity
    extend Rudash::Get
    extend Rudash::IsArray
    extend Rudash::IsEqual
    extend Rudash::IsHash
    extend Rudash::IsEmpty
    extend Rudash::Reverse
    extend Rudash::Curry
    extend Rudash::IsNumber
    extend Rudash::Keys
    extend Rudash::Each
    extend Rudash::Uniq
    extend Rudash::Difference
    extend Rudash::IsString
    extend Rudash::Eq
    extend Rudash::EachRight
    extend Rudash::At
    extend Rudash::Negate
    extend Rudash::Capitalize
    extend Rudash::Without
    extend Rudash::Intersection
    extend Rudash::Join
    extend Rudash::Initial
    extend Rudash::Set
    extend Rudash::Pick
    extend Rudash::Update
    extend Rudash::Slice
    extend Rudash::Remove
    extend Rudash::Union
    extend Rudash::Reject
    extend Rudash::Range
    extend Rudash::GroupBy
    extend Rudash::Take
    extend Rudash::DropRight
    extend Rudash::Chain
    extend Rudash::Flow
end
