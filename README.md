# LibC

[![](https://img.shields.io/badge/Swift-5.0--5.3-orange.svg)][1]
[![](https://img.shields.io/badge/os-macOS%20|%20Linux-lightgray.svg)][1]
[![](https://travis-ci.com/DavidSkrundz/LibC.svg?branch=master)][2]
[![Codebeat Status](https://codebeat.co/badges/ef1bd196-3a7c-41c5-a1fd-3a5c2f6aea55)][3]
[![Codecov](https://codecov.io/gh/DavidSkrundz/LibC/branch/master/graph/badge.svg)][4]

[1]: https://swift.org/download/#releases
[2]: https://travis-ci.com/DavidSkrundz/LibC
[3]: https://codebeat.co/projects/github-com-davidskrundz-libc
[4]: https://codecov.io/gh/DavidSkrundz/LibC

Wrapper for some C stuff

## Importing

```Swift
import LibC
```

```Swift
dependencies: [
	.package(url: "https://github.com/DavidSkrundz/LibC.git",
	         from: "2.0.0")
],
targets: [
	.target(
		name: "",
		dependencies: [
			"Libc"
		]),
]
```

## Using

### FixedWidthInteger

```Swift
static func random() -> Self
static func random<T: RandomNumberGenerator>(using: inout T) -> Self
```

### `DateTime`

```Swift
let dateTime = DateTime()
```

### `Interface`

```Swift
let i: [Interface] = Interface.interfaces()
```

### `Socket`

```Swift
let s = Socket(family: .IPv4, type: .Datagram, protocol: .IP)
```

### `Directory`

```Swift
let d = Directory.current()
try Directory.change(to: "..")
```
