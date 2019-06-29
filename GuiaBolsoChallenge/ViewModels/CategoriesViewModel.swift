//
//  CategoriesViewModel.swift
//  GuiaBolsoChallenge
//
//  Created by Matheus Leite on 26/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import Foundation
import UIKit

protocol loadCategoriesProtocol {
    func sendCategories(categories: [String])
    func requestError(alertError: UIAlertController)
}

public class CategoriesViewModel {
    
    private let network = Network()
    public var categories = [String]()
    var delegate : loadCategoriesProtocol?
    
    init() {
        self.getCategories()
    }
    
    public func getCategories() {
        self.network.get(endpoint: "/jokes/categories") { (data, error) in
            
            if (error != nil) {
                self.delegate?.requestError(alertError: self.prepareAlertError())
                return
            }
            
            //decode JSON data
            do {
                self.categories = try JSONDecoder().decode([String].self, from: data as! Data)
                self.delegate?.sendCategories(categories: self.categories)
            } catch let jsonError {
                print(jsonError)
            }
        }
    }
    
    func prepareAlertError() -> UIAlertController {
        let alert = UIAlertController(title: "Sorry :(", message: "We can't load categories from server.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
    
    public func numberOfRows() -> Int {
        return categories.count
    }
    
    public func setCell(index: Int) -> CategoriesTableViewCellViewModel {
        return CategoriesTableViewCellViewModel(categories[index])
    }
}
