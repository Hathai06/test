//
//  Manager.swift
//  test
//
//  Created by living mobile on 13/1/2563 BE.
//  Copyright © 2563 living mobile. All rights reserved.
//

import Foundation
struct Manager {
    
    var homeurl = "https://jsonplaceholder.typicode.com/photos"
    
    func performRequest(completion: @escaping ([Model]?, Error?)->()) {
           
           if let url = URL(string: homeurl) {
               let session = URLSession(configuration: .default)
               let task = session.dataTask(with: url) { (data, response, error)
                   in
                   
                   if error != nil {
                       print(error!)
                       return
                   }
                   
                   if let safeData = data {
                       self.parseJson(data: safeData, completion: completion)
                   }
               }
               task.resume()
           }
       }
    func detailPerformRequest(completion: @escaping ([Model]?, Error?)->()) {
       
        let urlImage = homeurl
        if let url = URL(string: (urlImage)) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error)
                in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let helpData = data {
                    self.parseJson(data: helpData, completion: completion)
                   
                }
            }
            task.resume()
        }
    }
    
    func parseJson<T>(data: Data?,completion: @escaping([T]?, Error?)->()) where T : Codable {
        
        var decodeData: [T]?
        var error: Error?
        
        guard let Data = data else {
            return
        }
        
        do {
            decodeData = try JSONDecoder().decode(Array<T>.self, from: Data)
            
        } catch let err {
            error = err
            debugPrint(err)
        }
        
        completion(decodeData, error)
    }

}
