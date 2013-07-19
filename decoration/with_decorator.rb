# Original object methods are available

module DecoratorBehavior
  def initialize(component)
    @component = component
  end

  def method_missing(meth, *args)
    if @component.respond_to?(meth)
      @component.send(meth, *args)
    else
      super
    end
  end

  def respond_to?(meth)
    @component.respond_to?(meth)
  end
end

module WithDecorator
  class Milk
    include DecoratorBehavior

    def cost
      @component.cost + 0.4
    end
  end

  class Sugar
    include DecoratorBehavior

    def cost
      @component.cost + 0.2
    end
  end
end