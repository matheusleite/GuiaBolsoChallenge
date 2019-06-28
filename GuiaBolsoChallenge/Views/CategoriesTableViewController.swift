//
//  CategoriesTableViewController.swift
//  GuiaBolsoChallenge
//
//  Created by Matheus Leite on 26/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {

    private let cellIdentifier = "categoriesCell"
    private let categoriesViewModel = CategoriesViewModel()
    private let activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configLoading()
        self.categoriesViewModel.updatedList = {
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.tableView.reloadData()
            }
        }
        
        //TODO: Show a alert indicate error
        self.categoriesViewModel.hasError = {
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.showAlertError()
            }
        }
        
        tableView.rowHeight = 60
        tableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
    }

    func configLoading() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.black
        tableView.backgroundView = activityIndicator
        self.activityIndicator.startAnimating()
    }
    
    func showAlertError() {
        let alert = UIAlertController(title: "Sorry :(", message: "We can't load categories from server.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
