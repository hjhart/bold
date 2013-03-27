module Bold
  class Base
    include Bold

    def initialize(attributes={})
      @supplies = attributes.delete(:supplies)
    end
  end
end
