require "bold/version"

module Bold
  autoload :Base, 'bold/base'

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

  module ClassMethods
    def needs(need)

      define_method(need) do
        @supplies ||= {}
        @supplies[need] ||= Bold.supply(need)
      end
    end
  end
end
