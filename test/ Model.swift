//
//   Model.swift
//  test
//
//  Created by living mobile on 13/1/2563 BE.
//  Copyright © 2563 living mobile. All rights reserved.
//

import Foundation
struct Model : Codable {
    
    let albumId : Int
    let id : Int
    let title : String?
    let url : String?
    let thumbnailUrl : String?
    
    private enum CodingKeys : String, CodingKey {
           case albumId = "albumId"
           case id = "id"
           case title = "title"
           case url = "url"
           case thumbnailUrl = "thumbnailUrl"
       }
    
}
