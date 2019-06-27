//
//  CategoriesTableViewController.swift
//  GuiaBolsoChallenge
//
//  Created by Matheus Leite on 26/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {

    private let categoriesViewModel = CategoriesViewModel()
    private let cellIdentifier = "categoriesCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoriesViewModel.updatedList = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        //TODO: Show a alert indicate error
        self.categoriesViewModel.hasError = {
            
        }
        
        tableView.rowHeight = 60
        tableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.categoriesViewModel.numberOfRows()
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CategoriesTableViewCell
        cell.setup(viewModel: self.categoriesViewModel.setCell(index: indexPath.row))

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToDetail", sender: indexPath.row)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! JokesViewController
        vc.category = self.categoriesViewModel.categories[sender as! Int]
    }


}
