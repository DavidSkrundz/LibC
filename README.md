LibC [![Swift Version](https://img.shields.io/badge/Swift-4.0-orange.svg)](https://swift.org/download/#releases) [![Platforms](https://img.shields.io/badge/Platforms-macOS%20|%20Linux-lightgray.svg)](https://swift.org/download/#releases) [![Build Status](https://travis-ci.org/DavidSkrundz/LibC.svg?branch=master)](https://travis-ci.org/DavidSkrundz/LibC) [![Codebeat Status](https://codebeat.co/badges/ef1bd196-3a7c-41c5-a1fd-3a5c2f6aea55)](https://codebeat.co/projects/github-com-davidskrundz-libc) [![Codecov](https://codecov.io/gh/DavidSkrundz/LibC/branch/master/graph/badge.svg)](https://codecov.io/gh/DavidSkrundz/LibC)
====

A limited Swift wrapper around standard C libraries


Features
--------

###### DateTime
```Swift
let dateTime = DateTime()
```

###### Random
```Swift
let a = UInt8.random() // 0...UInt8.max
let b = UInt32.random(max: 10) // 0..<10
let c = Double.random() // 0.0...1.0
```

###### Interface
```Swift
let i = Interface.interfaces() // [Interface]
```

###### Socket
```Swift
let s = Socket(family: .IPv4, type: .Datagram, protocol: .IP)
```

###### Directory
```Swift
let d = Directory.current()
try Directory.change(to: "..")
```

###### Dynamic Linker
```Swift
let handle = try DL.open("/path/to/lib", .now)
let mult = try DL.symbol(handle, "mult") // mult(Int, Int) -> Int { return $0 * $1 }
let multFunc = main.asFunction(((Int, Int) -> Int).self)
let result = multFunc(5, 3) // 15
mainFunc = nil
try DL.close(handle)
```

Prerequisites
-------------

###### Linux
`$ sudo apt-get install libbsd-dev`
