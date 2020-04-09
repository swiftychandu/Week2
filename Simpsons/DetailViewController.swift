//
//  DetailViewController.swift
//  Simpsons
//
//  Created by chandrasekhar yadavally on 4/8/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let imageView = CharacterView(frame: .zero)
    var imageUrl: String!
    
    init(imageUrl: String) {
        super.init(nibName: nil, bundle: nil)
        self.imageUrl = imageUrl
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
    }
    
    func configureUI() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.downloadImage(from: imageUrl)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.75),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
}
