//
//  TransparentTextHelper.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 03/01/2019.
//  Copyright © 2019 Valentin Šarić. All rights reserved.
//

import UIKit
class TransparentTextHelper{
    static func maskedImage(size: CGSize, text: String) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        
        let context = UIGraphicsGetCurrentContext()
        context?.scaleBy(x: 1.7, y: -1.7)
        context?.translateBy(x: -24, y: -40)
        
        // draw rounded rectange inset of the button's entire dimensions
//
//        UIColor.white.setStroke()
//        let pathRect = CGRect(origin: .zero, size: size).insetBy(dx: 10, dy: 10)
//        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 5)
//        path.lineWidth = 4
//        path.stroke()
        
        // draw the text
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .caption1),
            .foregroundColor: UIColor.white
        ]
        let textSize = text.size(withAttributes: attributes)
        let point = CGPoint(x: (size.width - textSize.width) / 2, y: (size.height - textSize.height) / 2)
        text.draw(at: point, withAttributes: attributes)
        
        // capture the image and end context
        
        let maskImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // create image mask
        
        guard let cgimage = maskImage?.cgImage, let dataProvider = cgimage.dataProvider else { return nil }
        
        let bytesPerRow = cgimage.bytesPerRow
        let bitsPerPixel = cgimage.bitsPerPixel
        let width = cgimage.width
        let height = cgimage.height
        let bitsPerComponent = cgimage.bitsPerComponent
        
        guard let mask = CGImage(maskWidth: width, height: height, bitsPerComponent: bitsPerComponent, bitsPerPixel: bitsPerPixel, bytesPerRow: bytesPerRow, provider: dataProvider, decode: nil, shouldInterpolate: false) else { return nil }
        
        // create the actual image
        
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIGraphicsGetCurrentContext()?.clip(to: rect, mask: mask)
        UIColor.white.withAlphaComponent(0.9).setFill()
        UIBezierPath(rect: rect).fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // return image
        
        return image
    }
}
