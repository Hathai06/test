//
//  ImageExtention.swift
//  test
//
//  Created by living mobile on 13/1/2563 BE.
//  Copyright © 2563 living mobile. All rights reserved.
//

import UIKit
extension UIImageView {
    
    func performImageRequest(thumbnailUrl: String?) {
        
        guard let imageUrl = thumbnailUrl else {
            return
        }
        
        let imageCache = NSCache<NSString, AnyObject>()
        let url: URL?
        
        if imageUrl.hasPrefix("https://") || imageUrl.hasPrefix("http://") {
            
            url = URL(string: imageUrl)
        }
        else {
            
            url = URL(string: "https://" + imageUrl)
        }
        
        if let cachedImage = imageCache.object(forKey: imageUrl as NSString) as? UIImage {
            self.image = cachedImage
        } else {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url!) { (data, response, error) in
                guard error == nil else {
                    print(error!)
                    return
                }
                
                guard response != nil else {
                    print("no response")
                    return
                }
                
                guard let data = data else {
                    print("no data")
                    return
                }
                
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data)
                    imageCache.setObject(imageToCache!, forKey: imageUrl as NSString)
                    self.image = imageToCache
                }
            }; task.resume()
        }
        
    }
    
}
