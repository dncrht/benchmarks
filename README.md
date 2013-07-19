Some benchmarks

# Benchmarks on adding functionality to objects

Run it with ```ruby decoration_benchmarks.rb```

## Calling an existing method

On ruby 1.8.7 (2012-02-08 patchlevel 358) [universal-darwin12.0]
```
      user     system      total        real
Extend 12.760000   0.020000  12.780000 ( 12.791525)
Composition  2.940000   0.040000   2.980000 (  2.987024)
Decorator  2.970000   0.040000   3.010000 (  3.011930)
DelegateClass  4.900000   0.0100000   4.900000 (  4.890110)
SimpleDelegator  DID NOT FINISH
```

On ruby 2.0.0p195 (2013-05-14 revision 40734) [x86_64-darwin12.3.0]
```
       user     system      total        real
Extend  3.320000   0.080000   3.400000 (  3.410460)
Composition  0.910000   0.000000   0.910000 (  0.906366)
Decorator  0.920000   0.000000   0.920000 (  0.919914)
DelegateClass  2.20000   0.000000   2.20000 (  2.28722)
SimpleDelegator  2.170000   0.010000   2.180000 (  2.168008)
```

## Calling a method of the base class

On ruby 1.8.7 (2012-02-08 patchlevel 358) [universal-darwin12.0]
```
      user     system      total        real
Extend 11.470000   0.040000  11.510000 ( 11.527092)
Composition  2.520000   0.030000   2.550000 (  2.555245)
Decorator  4.280000   0.060000   4.340000 (  4.334987)
DelegateClass  4.300000   0.000000   4.300000 (  4.247540)
SimpleDelegator  DID NOT FINISH
```

On ruby 2.0.0p195 (2013-05-14 revision 40734) [x86_64-darwin12.3.0]
```
       user     system      total        real
Extend  2.760000   0.060000   2.820000 (  2.825868)
Composition  0.970000   0.000000   0.970000 (  0.975073)
Decorator  1.750000   0.000000   1.750000 (  1.749426)
DelegateClass  2.10000   0.000000   2.10000 (  2.10643)
SimpleDelegator  2.450000   0.000000   2.450000 (  2.457126)
```
