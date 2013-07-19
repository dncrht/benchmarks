# Through composition, you cannot access the original object methods

module WithComposition
  class Milk
    def initialize(component)
      @component = component
    end

    def cost
      @component.cost + 0.4
    end

    def origin
      @component.origin
    end
  end

  class Sugar
    def initialize(component)
      @component = component
    end

    def cost
      @component.cost + 0.2
    end

    def origin
      @component.origin
    end
  end
end