require "spec_helper"
require "bitmask_attribute/concern"

RSpec.describe BitmaskAttribute::Concern do
  let(:foo) { Foo.new }

  describe "bitmask attribute present" do

    context "where bit is present" do
      before { foo.bitmask_attributes = 3 }

      it "returns true" do
        expect(foo.bitmask_attribute_present?(1)).to eql(true)
      end
    end

    context "where bit is not present" do
      before { foo.bitmask_attributes = 2 }

      it "returns false" do
        expect(foo.bitmask_attribute_present?(1)).to eql(false)
      end
    end
  end

  describe "add bitmask attribute" do
    context "where the bit isn't present" do
      before { foo.bitmask_attributes = 2 }

      it "adds the bit to the bitmask" do
        foo.add_bitmask_attribute(1)
        expect(foo.bitmask_attributes).to eql(3)
      end
    end

    context "where the bit is present" do
      before { foo.bitmask_attributes = 3 }

      it "doesn't add the bit to the bitmask" do
        foo.add_bitmask_attribute(1)
        expect(foo.bitmask_attributes).to eql(3)
      end
    end
  end

  describe "remove bitmask attribute" do
    context "where the bit is present" do
      before { foo.bitmask_attributes = 3 }

      it "removes the bit from the bitmask" do
        foo.remove_bitmask_attribute(1)
        expect(foo.bitmask_attributes).to eql(2)
      end
    end

    context "where the bit isn't present" do
      before { foo.bitmask_attributes = 2 }

      it "doesn't remove the bit from the bitmask" do
        foo.remove_bitmask_attribute(1)
        expect(foo.bitmask_attributes).to eql(2)
      end
    end
  end

  class Foo
    include BitmaskAttribute::Concern

    attr_accessor :bitmask_attributes

    bitmask_attribute :bitmask_attributes
  end
end
