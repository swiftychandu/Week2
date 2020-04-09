//
//  CollectionCell.swift
//  Simpsons
//
//  Created by chandrasekhar yadavally on 4/8/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    let label = Label(frame: .zero)
    let characterView = CharacterView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(name: String, iconUrl: String ) {
        characterView.downloadImage(from: iconUrl)
        label.text = name
    }
        
    func configure() {
        backgroundColor = .systemBackground
        addSubview(label)
        addSubview(characterView)
        
        NSLayoutConstraint.activate([
            characterView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            characterView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            characterView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            characterView.heightAnchor.constraint(equalTo: characterView.widthAnchor),
            
            label.topAnchor.constraint(equalTo: characterView.bottomAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            label.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
}
