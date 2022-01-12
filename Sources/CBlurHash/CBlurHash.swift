//  Image+Blurhash.swift
//
//  Created by dmitriy Uyanov on 12.01.2022.
//  dima-u@inbox.ru
//

import blurhash

#if canImport(UIKit)

import UIKit

extension UIImage {
    // decode
    public convenience init?(blurHash: String, size: CGSize) {
        guard let pixelBuffer = decode(blurHash, Int32(size.width), Int32(size.height), 1, 3) else {
            return nil
        }

        let bytes = Data(bytesNoCopy: UnsafeMutableRawPointer(pixelBuffer),
                         count: Int(size.width * size.height) * 3,
                         deallocator: .custom { pppp, _ in
                             free(pppp)
                         })

        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
        let bitsPerComponent = 8
        let bitsPerPixel = 24

        let providerRef = CGDataProvider(data: bytes as CFData)

        if let cgim = CGImage(
            width: Int(size.width),
            height: Int(size.height),
            bitsPerComponent: bitsPerComponent,
            bitsPerPixel: bitsPerPixel,
            bytesPerRow: Int(size.width) * 3,
            space: rgbColorSpace,
            bitmapInfo: bitmapInfo,
            provider: providerRef!,
            decode: nil,
            shouldInterpolate: true,
            intent: .defaultIntent
        ) {
            self.init(cgImage: cgim)
        }

        return nil
    }

    // encode
    public func blurHash(xComponents: Int, yComponents: Int) -> String? {
        guard let cgImage = cgImage,
              let data = cgImage.dataProvider?.data,
              let bytes = CFDataGetBytePtr(data)
        else {
            return nil
        }

        guard cgImage.colorSpace?.model == .rgb else {
            return nil
        }

        let pointer = UnsafeMutablePointer(mutating: bytes)

        if let hash = blurHashForPixels(Int32(xComponents), Int32(yComponents), Int32(size.width), Int32(size.height), pointer, cgImage.bytesPerRow) {
            return String(cString: hash)
        }
        return nil
    }
}

#endif
