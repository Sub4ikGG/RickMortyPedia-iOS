//
//  MainViewController.swift
//  RickMortyPedia
//
//  Created by Кирилл Ефремов on 11.12.2024.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .background
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(navigate)))
        
        navigationItem.title = "RickMortyPedia"
    }
    
    @objc func navigate() {
        
    }
}

#Preview {
    let navigationController = UINavigationController(rootViewController: MainViewController())
    navigationController.navigationBar.prefersLargeTitles = true
    
    return navigationController
}
