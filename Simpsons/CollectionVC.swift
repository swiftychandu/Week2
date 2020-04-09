//
//  CollectionVC.swift
//  Simpsons
//
//  Created by chandrasekhar yadavally on 4/7/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController {
    
    var collectionView: UICollectionView!
    var simpsonsData = Display()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Simpson"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureCollectionView()
        loadData()
    }
    
    func loadData() {
        NetworkManager.shared.getData { result in
            switch result {
            case .success(let simpsons):
                self.simpsonsData = Display(with: simpsons)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error): print(error)
            }
        }
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createFlowLayout(in: view))
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: String(describing: CollectionCell.self))
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
}

extension CollectionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        simpsonsData.names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionCell.self), for: indexPath) as! CollectionCell
        let name = simpsonsData.names[indexPath.row]
        let iconUrl = simpsonsData.iconUrls[indexPath.row]
        cell.set(name: name, iconUrl: iconUrl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = simpsonsData.iconUrls[indexPath.row]
        let detailVC = DetailViewController(imageUrl: item)
        let navController = UINavigationController(rootViewController: detailVC)
        present(navController, animated: true)
    }
    
    
}
