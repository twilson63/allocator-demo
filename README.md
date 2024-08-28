# Allocator

This module allocates a reward amount based on a set of amounts with a price and yield


## allocator-demo

```
aos test-allocator
aos> .load-blueprint apm
aos> APM.install('@rakis/test-unit')
aos> .load run_tests.lua
```

## to test with real deposit sample

```
aos> Deposits = Send({Target = "weYQPicduyY_Oa0ShzLsm-sc3uMVxVfHdIxGuwMfF5s", Action = "Get-Deposits"}).receive().Data
```
Wait a few moments...
```
aos> .load run_tests.lua
```


