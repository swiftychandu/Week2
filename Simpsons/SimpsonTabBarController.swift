//
//  SimpsonTabBarController.swift
//  Simpsons
//
//  Created by chandrasekhar yadavally on 4/7/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class SimpsonTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createFirstNC(), createSecondNC() ]
    }
    
    func createFirstNC() -> UINavigationController {
        let tableVC = TableViewController()
        let firstNC = UINavigationController(rootViewController: tableVC)
        firstNC.tabBarItem = UITabBarItem(title: "List View", image: UIImage(named: "tabBarItem"), tag: 0)
        return firstNC
    }
    
    func createSecondNC() -> UINavigationController {
        let collectionVC = CollectionVC()
        let secondNC = UINavigationController(rootViewController: collectionVC)
        secondNC.tabBarItem = UITabBarItem(title: "Collection View", image: UIImage(named: "tabBarItem"), tag: 1)
        return secondNC
    }
    
    
    
    
}
