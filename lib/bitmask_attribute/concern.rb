require 'active_support/concern'
require 'active_support/inflector'

module BitmaskAttribute
  module Concern
    extend ActiveSupport::Concern

    module ClassMethods

      def bitmask_attribute(name, options_hash)
        single_name = name.to_s.singularize
        define_method "#{single_name}_present?" do |bit_sequence|
          send(name) & bit_sequence == bit_sequence
        end

        define_method "add_#{single_name}" do |bit_sequence|
          current_bits = send(name)
          send("#{name}=", current_bits | bit_sequence)
        end

        define_method "remove_#{single_name}" do |bit_sequence|
          current_bits = send(name)
          send("#{name}=", current_bits & ~bit_sequence)
        end

        options_hash.each do |key, value|
          define_method "#{key}=" do |bool_value|
            bool_value ? send("add_#{single_name}", value) : send("remove_#{single_name}", value)
          end
        end
      end
    end
  end
end
