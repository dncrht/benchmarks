# Original object methods are available

module WithExtend
  module Milk
    def cost
      super + 0.4
    end
  end

  module Sugar
    def cost
      super + 0.2
    end
  end
end