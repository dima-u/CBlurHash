# CBlurHash

Blurhash Swift Package. Based on C implementation.

Package based on https://github.com/woltapp/blurhash

Package works about 20 times faster then original swift implementation.

### Swift Package Manager

Once you have your Swift package set up, adding CBlurHash as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/dima-u/CBlurHash.git", .branch("master"))
]
```

### Usage


```swift

import CBlurHash

// create image from blurhash
let someImage = UIImage(blurHash: "LEHV6nWB2yk8pyo0adR*.7kCMdnj", size: .init(width: 128, height: 128))

// get blurhash from image
let hash = someUIImage.blurHash(xComponents: 4, yComponents: 3)

```
