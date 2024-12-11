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
        
        view.backgroundColor = .background
        
        let charactersButton = UIMainButton(title: "Characters", width: view.frame.widthWithPadding)
        charactersButton.center = view.center
        
        view.addSubview(charactersButton)
        
        navigationItem.title = "RickMortyPedia"
    }
    
    @objc func buttonTapped() {
        print("buttonTapped")
    }
}

#Preview {
    let navigationController = UINavigationController(rootViewController: MainViewController())
    navigationController.navigationBar.prefersLargeTitles = true
    
    return navigationController
}
