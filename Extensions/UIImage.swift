//
//  UIImage.swift
//  Images
//
//  Created by Nikolay Trofimov on 07.03.2023.
//  Copyright © 2023 Cocoacasts. All rights reserved.
//

import UIKit

extension UIImage {
    
    func resizedImage(with size: CGSize) -> UIImage? {
        // create graphics context
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        // draw image in graphics context
        draw(in: CGRect(origin: .zero, size: size))
        
        // create image from current graphics context
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // clean up graphics context
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
    
}
