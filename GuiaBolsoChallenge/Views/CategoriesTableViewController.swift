//
//  CategoriesTableViewController.swift
//  GuiaBolsoChallenge
//
//  Created by Matheus Leite on 26/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController, loadCategoriesProtocol {
    private let cellIdentifier = "categoriesCell"
    let categoriesViewModel = CategoriesViewModel()
    private let activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()

        //set delegate to handle protocol
        self.categoriesViewModel.delegate = self

        self.configLoading()

        //config table
        tableView.rowHeight = 60
        tableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
    }

    //refresh table with data
    func sendCategories(categories: [String]) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }

    //show a alert if request fail
    func requestError(alertError: UIAlertController) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.present(alertError, animated: true, completion: nil)
        }
    }

    //show a activityIndicator when request in progress
    func configLoading() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.black
        tableView.backgroundView = activityIndicator
        self.activityIndicator.startAnimating()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoriesViewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: self.cellIdentifier,
            for: indexPath) as! CategoriesTableViewCell
        cell.setup(viewModel: self.categoriesViewModel.setCell(index: indexPath.row))

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToDetail", sender: indexPath.row)
    }

    // MARK: - Navigation
    //pass selected catetory to jokeViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let jokesVC = segue.destination as! JokesViewController
        jokesVC.category = self.categoriesViewModel.categories[sender as! Int]
    }
}
