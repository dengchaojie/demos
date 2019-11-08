import UIKit
import CoreGraphics//cg
import CoreImage//ci

import ImageIO

let imgV = UIImageView()
imgV.frame = CGRect.init(x: 0, y: 0, width: 30, height: 40)
let scaleFactor = UIScreen.main.scale
let scale = CGAffineTransform.init(scaleX: scaleFactor, y: scaleFactor)
let size = imgV.bounds.size.applying(scale)
print(size.width)
print(size.height)
print(imgV.bounds.size.width)
print(imgV.bounds.size.height)

///UIGraphicsImageRenderer
// 技巧 #1：绘制到UIGraphicsImageRender
//func resizedImage(at url: URL, for size: CGSize) -> UIImage? {
//    guard let img = UIImage.init(contentsOfFile: url.path) else {
//        return nil
//    }
//    let render = UIGraphicsImageRenderer.init(size: size)
//
//    return render.image { (context) in
//        img.draw(in: CGRect.init(origin: .zero, size: size))
//    }
//}

///
// 技巧 #2：绘制到Core Graphics Context中
func resizedImage(at url: URL, for size: CGSize) -> UIImage? {
    guard let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil),
          let image = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, nil)
    else {
        return nil
    }
    let context = CGContext.init(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: image.bitsPerComponent, bytesPerRow: image.bytesPerRow, space: image.colorSpace ?? CGColorSpace.init(name: CGColorSpace.sRGB)!, bitmapInfo: image.bitmapInfo.rawValue)
    context?.interpolationQuality = .high
    context?.draw(image, in: CGRect.init(origin: .zero, size: size))
    guard let scaleImage = context?.makeImage() else {
        return nil
    }
    return UIImage.init(cgImage: scaleImage)

}


///
// 技巧 #3：使用 Image I/O 创建缩略图像
//func resizedImage(at url: URL, for size: CGSize) -> UIImage? {
//    let options: [CFString: Any] = [
//        kCGImageSourceCreateThumbnailWithTransform: true,
//        kCGImageSourceCreateThumbnailFromImageIfAbsent: true,
//        kCGImageSourceShouldCacheImmediately: true,
//        kCGImageSourceThumbnailMaxPixelSize: max(size.width, size.height)
//    ]
//
//    guard let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil),
//          let image = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options as CFDictionary)
//    else {
//        return nil
//    }
//    return UIImage.init(cgImage: image)
//}


///技巧 #4：使用 Core Image 进行 Lanczos 重采样
let sharedContext = CIContext.init(options: [CIContextOption.useSoftwareRenderer : false])
func resizedImage(at url: URL, scale: CGFloat, aspectRatio: CGFloat) -> UIImage? {
    guard let image = CIImage.init(contentsOf: url) else {
        return nil
    }
    let filter = CIFilter.init(name: "CILanczosScaleTransform")
    filter?.setValue(image, forKey: kCIInputImageKey)
    filter?.setValue(scale, forKey: kCIInputScaleKey)
    filter?.setValue(aspectRatio, forKeyPath: kCIInputAspectRatioKey)
    
    guard let outputImage = filter?.outputImage,
        let cgImage = sharedContext.createCGImage(outputImage, from: outputImage.extent)
    else {
        return nil
    }
    
    return UIImage.init(cgImage: cgImage)
}

