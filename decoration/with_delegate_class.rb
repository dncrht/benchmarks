require 'delegate'
require './decoration/coffee'

# Original object methods are available

module WithDelegateClass
  class Milk < DelegateClass(Coffee)

    def initialize(x)
      super(x)              # Step 2
    end

    def cost
      super + 0.4
    end
  end

  class Sugar < DelegateClass(Coffee)

    def initialize(x)
      super(x)              # Step 2
    end

    def cost
      super + 0.2
    end
  end
end