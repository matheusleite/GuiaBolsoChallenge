//
//  JokesViewModel.swift
//  GuiaBolsoChallenge
//
//  Created by Matheus Leite on 26/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher

public class JokesViewModel {
    
    private var network = Network()
    public var hasError : ErrorClosure?
    public var loadJoke : UpdatedClosure?
    
    private var joke : Joke? {
        didSet {
            DispatchQueue.main.async {
                self.loadJoke?()
            }
        }
    }
    
    init(category: String) {
        self.getJokeWithCategory(category: category)
    }
    
    public func getJokeWithCategory(category: String) {
        self.network.get(endpoint: "/jokes/random?category=\(category)") { (data, error) in
            
            if (error != nil) {
                self.hasError?()
                return
            }
            
            //decode JSON data
            do {
                self.joke = try JSONDecoder().decode(Joke.self, from: data as! Data)
            } catch let jsonError {
                print(jsonError)
            }
        }
    }
    
    public func setImage(imageView: UIImageView) {
        let url = URL(string: self.joke!.icon_url)!
        
        imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        imageView.kf.indicatorType = .activity
        
        let resource = ImageResource(downloadURL: url, cacheKey: self.joke?.icon_url)
        imageView.kf.setImage(with: resource)
    }
    
    public func setText(label : UILabel) {
        label.text = joke?.value
    }
}
