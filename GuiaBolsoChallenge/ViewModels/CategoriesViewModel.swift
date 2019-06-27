//
//  CategoriesViewModel.swift
//  GuiaBolsoChallenge
//
//  Created by Matheus Leite on 26/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import Foundation

public typealias UpdatedClosure = () -> ()
public typealias ErrorClosure = () -> ()

public class CategoriesViewModel {
    
    private let network = Network()
    public var categories = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.updatedList?()
            }
        }
    }
    
    public var hasError : ErrorClosure?
    public var updatedList : UpdatedClosure?
    
    init() {
        self.getCategories()
    }
    
    public func getCategories() {
        self.network.get(endpoint: "/jokes/categories") { (data, error) in
            
            if (error != nil) {
                self.hasError?()
                return
            }
            
            //decode JSON data
            do {
                self.categories = try JSONDecoder().decode([String].self, from: data as! Data)
            } catch let jsonError {
                print(jsonError)
            }
        }
    }
    
    public func numberOfRows() -> Int {
        return categories.count
    }
    
    public func setCell(index: Int) -> CategoriesTableViewCellViewModel {
        return CategoriesTableViewCellViewModel(categories[index])
    }
}
