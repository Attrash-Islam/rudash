# This module will contain tiny general utilities

module Rudash
  module Utils
    def self.match_number?(str)
      return false unless str.is_a?(String)

      str.match(/^(\d)+$/)
    end

    def self.is_function?(func)
      func.is_a?(Proc) || func.is_a?(Method)
    end

    def self.force_reverse(collection)
      case collection
      when Array then collection.reverse
      when Hash then collection.reverse_each.to_h
      when String then collection.reverse
      else []
      end
    end
  end
end
