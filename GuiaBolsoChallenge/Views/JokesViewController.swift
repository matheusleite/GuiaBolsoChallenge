//
//  JokesViewController.swift
//  GuiaBolsoChallenge
//
//  Created by Matheus Leite on 26/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import UIKit

class JokesViewController: UIViewController {

    var jokesViewModel : JokesViewModel?
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var category = "" {
        didSet {
            self.jokesViewModel = JokesViewModel(category: self.category)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.jokesViewModel?.loadJoke = {
            self.setUI()
        }
    }
    
    func setUI() {
        self.jokesViewModel?.setText(label: textLabel)
        self.jokesViewModel?.setImage(imageView: iconImageView)
    }
    

}
