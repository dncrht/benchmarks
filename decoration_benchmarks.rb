#!/usr/bin/env ruby

# Documentation:
# http://robots.thoughtbot.com/post/14825364877/evaluating-alternative-decorator-implementations-in
# http://khelll.com/blog/ruby/delegation-in-ruby/
# http://mikepackdev.com/blog_posts/31-exhibit-vs-presenter
# https://charlie.bz/blog/things-that-clear-rubys-method-cache

require 'benchmark'

require './decoration/coffee'

require './decoration/with_composition'
require './decoration/with_decorator'
require './decoration/with_delegate_class'
require './decoration/with_extend'
require './decoration/with_simple_delegator'


REPEAT = 100000

puts 'Benchmark on adding functionality to objects'
puts '-----------------------------------------------'
puts 'Calling an existing method'

Benchmark.bm do |benchmark|

  benchmark.report('Extend') do
   REPEAT.times do
      coffee = Coffee.new
      coffee.extend(WithExtend::Milk)
      coffee.cost
      coffee.extend(WithExtend::Sugar)
      coffee.cost
    end
  end

  benchmark.report('PORO') do
   REPEAT.times do
      coffee = Coffee.new
      WithComposition::Sugar.new(WithComposition::Milk.new(coffee)).cost
    end
  end

  benchmark.report('Decorator') do
   REPEAT.times do
      coffee = Coffee.new
      WithDecorator::Sugar.new(WithDecorator::Milk.new(coffee)).cost
    end
  end

  benchmark.report('DelegateClass') do
   REPEAT.times do
      coffee = Coffee.new
      WithDelegateClass::Sugar.new(WithDelegateClass::Milk.new(coffee)).cost
    end
  end

  benchmark.report('SimpleDelegator') do;break
   REPEAT.times do
      coffee = Coffee.new
      WithSimpleDelegator::Sugar.new(WithSimpleDelegator::Milk.new(coffee)).cost
    end
  end

end

puts '-----------------------------------------------'
puts 'Calling a method of the base class'

Benchmark.bm do |benchmark|

  benchmark.report('Extend') do
   REPEAT.times do
      coffee = Coffee.new
      coffee.extend(WithExtend::Milk)
      coffee.extend(WithExtend::Sugar)
      coffee.origin
    end
  end

  benchmark.report('Composition') do
   REPEAT.times do
      coffee = Coffee.new
      WithComposition::Sugar.new(WithComposition::Milk.new(coffee)).origin
    end
  end

  benchmark.report('Decorator') do
   REPEAT.times do
      coffee = Coffee.new
      WithDecorator::Sugar.new(WithDecorator::Milk.new(coffee)).origin
    end
  end

  benchmark.report('DelegateClass') do
   REPEAT.times do
      coffee = Coffee.new
      WithDelegateClass::Sugar.new(WithDelegateClass::Milk.new(coffee)).origin
    end
  end

  benchmark.report('SimpleDelegator') do;break
   REPEAT.times do
      coffee = Coffee.new
      WithSimpleDelegator::Sugar.new(WithSimpleDelegator::Milk.new(coffee)).origin
    end
  end

end