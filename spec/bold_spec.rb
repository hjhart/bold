require 'spec_helper'

describe Bold do
  class Piano; end

  Bold.supplies(:piano) { Piano.new }

  class Bob
    include Bold

    needs :piano
  end

  subject do
    Bob.new
  end

  its(:piano) { should be_a(Piano) }

  context "when supplied Bach's lautenwerck" do
    class Smith < Bold::Base
      needs :piano
      attr_reader :attributes

      attr_reader :attributes

      def initialize(attributes={})
        super
        @attributes = attributes
      end
    end

    let(:lautenwerck) { "Bach's lautenwerck" }

    subject do
      Smith.new(supplies: {
        piano: lautenwerck
      })
    end

    its(:piano) { should be(lautenwerck) }
    its(:attributes) { should_not have_key(:supplies) }
  end
end
