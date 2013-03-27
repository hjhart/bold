require 'spec_helper'

describe Bold do
  class Piano; end

  Bold.supplies(:piano) { Piano.new }

  class Bob
    include Bold

    needs :piano
    attr_reader :attributes

    def initialize(attributes={})
      super
      @attributes = attributes
    end
  end

  subject do
    Bob.new
  end

  its(:piano) { should be_a(Piano) }

  context "when it is supplied Bach's lautenwerck" do
    let(:lautenwerck) { double }

    subject do
      Bob.new(supplies: {
        piano: lautenwerck
      })
    end

    its(:piano) { should be(lautenwerck) }
    its(:attributes) { should_not have_key(:supplies) }
  end
end
