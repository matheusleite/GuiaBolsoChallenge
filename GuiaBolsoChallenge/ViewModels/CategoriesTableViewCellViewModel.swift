//
//  CategoriesTableViewCellViewModel.swift
//  GuiaBolsoChallenge
//
//  Created by Matheus Leite on 27/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import Foundation

public class CategoriesTableViewCellViewModel {
    public let categoryName: String

    init(_ categoryName: String) {
        self.categoryName = categoryName
    }

    public func textLabel() -> String {
        return self.categoryName.capitalized
    }
}
