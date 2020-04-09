//
//  tableCell.swift
//  Simpsons
//
//  Created by chandrasekhar yadavally on 4/7/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

 let characterView = CharacterView(frame: .zero)
    let label = Label(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        addSubview(characterView)
        addSubview(label)
        backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
             characterView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
             characterView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
             characterView.widthAnchor.constraint(equalToConstant: 75),
             characterView.heightAnchor.constraint(equalToConstant: 75),
            
        label.leadingAnchor.constraint(equalTo: characterView.trailingAnchor, constant: 10),
        label.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
        label.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        label.heightAnchor.constraint(equalToConstant: bounds.height * 0.5)
        ])
    }

}
