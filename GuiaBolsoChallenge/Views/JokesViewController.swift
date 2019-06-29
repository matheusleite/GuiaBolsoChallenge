//
//  JokesViewController.swift
//  GuiaBolsoChallenge
//
//  Created by Matheus Leite on 26/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import UIKit

class JokesViewController: UIViewController, loadJokeProtocol {

    var category = ""
    var jokesViewModel : JokesViewModel?
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.jokesViewModel = JokesViewModel(category: self.category, loadProtocol: self)
    }
    
    override func viewDidLayoutSubviews() {
        //shadow in card view
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.3
        cardView.layer.shadowOffset = .zero
        cardView.layer.shadowRadius = 5
        cardView.layer.cornerRadius = 10
    }
    
    func sendJoke(joke: Joke) {
        self.setUI()
    }
    
    func requestError(alertError: UIAlertController) {
        self.present(alertError, animated: true, completion: nil)
    }
    
    func setUI() {
        self.jokesViewModel?.setText(label: textLabel)
        self.jokesViewModel?.setImage(imageView: iconImageView)
    }
}
