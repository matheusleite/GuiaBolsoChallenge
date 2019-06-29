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

protocol loadJokeProtocol {
    func sendJoke(joke: Joke)
    func requestError(alertError: UIAlertController)
}

public class JokesViewModel {
    
    var joke : Joke?
    private var network = Network()
    var delegate : loadJokeProtocol
    
    init(category: String, loadProtocol: loadJokeProtocol) {
        self.delegate = loadProtocol
        self.getJokeWithCategory(category: category)
    }
    
    func prepareAlertError() -> UIAlertController {
        let alert = UIAlertController(title: "Sorry :(", message: "We can't load joke from server.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
    
    public func getJokeWithCategory(category: String) {
        self.network.get(endpoint: "/jokes/random?category=\(category)") { (data, error) in
            
            if (error != nil) {
                DispatchQueue.main.async {
                    self.delegate.requestError(alertError: self.prepareAlertError())
                }
                return
            }
            
            //decode JSON data
            do {
                self.joke = try JSONDecoder().decode(Joke.self, from: data as! Data)
                
                DispatchQueue.main.async {
                    self.delegate.sendJoke(joke: self.joke!)
                }
            } catch let jsonError {
                print(jsonError)
            }
        }
    }
    
    public func setImage(imageView: UIImageView) {
        let url = URL(string: self.joke!.icon_url)!
        
        imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        imageView.kf.indicatorType = .activity
        
        //image caching
        let resource = ImageResource(downloadURL: url, cacheKey: self.joke?.icon_url)
        imageView.kf.setImage(with: resource)
    }
    
    public func setText(label : UILabel) {
        label.text = joke?.value
    }
}
