//
//  Network.swift
//  GuiaBolsoChallenge
//
//  Created by Matheus Leite on 26/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import Foundation

public final class Network {
    
    //do a get request to API
    func get(endpoint: String, completion: @escaping (_ data: Any?, _ error: Any?) -> Void) {
        guard let url = URL(string: API.url + endpoint) else
            { return }
    
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                completion(nil, error)
                return
            }
            
            guard let data = data  else {
                completion(nil, error)
                return
            }
            
            completion(data, nil)
        }.resume()
    }
    
}
