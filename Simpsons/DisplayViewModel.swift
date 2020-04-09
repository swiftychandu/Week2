//
//  DisplayViewModel.swift
//  Simpsons
//
//  Created by chandrasekhar yadavally on 4/8/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

struct Display {
    let names: [String]
    let iconUrls: [String]
    let texts: [String]
    
    init(with array: [Simpson]) {
        self.names = array.map { $0.Text.components(separatedBy: "-").first ?? "No Name" }
        self.iconUrls = array.map { $0.Icon["URL"] ?? "" }
        self.texts = array.map { $0.Text }
    }
    
    init() {
        self.names = []
        self.iconUrls = []
        self.texts = []
    }
}
