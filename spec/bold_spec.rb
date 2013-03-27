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
end
