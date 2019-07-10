require 'rudash'
require 'test/unit'

class RejectTest < Test::Unit::TestCase
    def test_reject_evens
        isEven = -> (value) { value % 2 === 0 }
        result = Rudash.reject[[1,2,3,4], isEven]
        assert_equal result, [1,3]
    end

    def test_reject_hashes_by_hash
        persons = [
            { name: 'islam', sex: 'male' },
            { name: 'sabel', sex: 'female' },
            { name: 'ruth', sex: 'female' }
        ]
        result = Rudash.reject[persons, { sex: 'female' }]
        assert_equal result, [
            { name: 'islam', sex: 'male' }
        ]
    end

    def test_nil_params
        result = Rudash.reject[nil, nil]
        assert_equal result, []
    end
end