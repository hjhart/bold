require "bold/version"

module Bold
  @suppliers = {}

  def self.included(klass)
    klass.extend(ClassMethods)
  end

  def self.supplies(dep, &supplier)
    @suppliers[dep] = supplier
  end

  def self.supply(dep)
    @suppliers[dep].call
  end

  module ClassMethods
    def needs(dep)
      define_method(dep) do
        @deps ||= {}
        @deps[dep] ||= Bold.supply(dep)
      end
    end
  end
end
