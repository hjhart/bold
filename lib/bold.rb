require "bold/version"

module Bold
  @suppliers = {}

  def self.included(klass)
    klass.extend(ClassMethods)
  end

  def self.supplies(need, &supplier)
    @suppliers[need] = supplier
  end

  def self.supply(need)
    @suppliers[need].call
  end

  def initialize(attributes={})
    @supplies = attributes.delete(:supplies) || {}
  end

  module ClassMethods
    def needs(need)
      define_method(need) do
        @supplies[need] ||= Bold.supply(need)
      end
    end
  end
end
