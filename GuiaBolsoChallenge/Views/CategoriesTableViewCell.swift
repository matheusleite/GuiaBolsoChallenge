//
//  CategoriesTableViewCell.swift
//  GuiaBolsoChallenge
//
//  Created by Matheus Leite on 27/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    func setup(viewModel: CategoriesTableViewCellViewModel) {
        self.textLabel?.text = viewModel.textLabel()
    }
}
