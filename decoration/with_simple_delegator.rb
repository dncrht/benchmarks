require 'delegate'

# Original object methods are available

module WithSimpleDelegator
  class Milk < SimpleDelegator

    def cost
      super + 0.4
    end
  end

  class Sugar < SimpleDelegator

    def cost
      super + 0.2
    end
  end
end