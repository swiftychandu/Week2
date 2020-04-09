//
//  ViewController.swift
//  Simpsons
//
//  Created by chandrasekhar yadavally on 4/6/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    var simpsonsData = Display()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Simpson"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureTableView()
        loadData()
    }
    
    func loadData() {
        NetworkManager.shared.getData { result in
            switch result {
            case .success(let simpsons):
                self.simpsonsData = Display(with: simpsons)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error): print(error)
            }
        }
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 80
        tableView.register(TableCell.self, forCellReuseIdentifier: String(describing: TableCell.self))
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        simpsonsData.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableCell.self), for: indexPath) as! TableCell
        let name = simpsonsData.names[indexPath.row]
        let iconUrl = simpsonsData.iconUrls[indexPath.row]
        cell.set(name: name, iconUrl: iconUrl)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = simpsonsData.iconUrls[indexPath.row]
        let detailVC = DetailViewController(imageUrl: item)
        let navController = UINavigationController(rootViewController: detailVC)
        present(navController, animated: true)
    }
    
    
}
