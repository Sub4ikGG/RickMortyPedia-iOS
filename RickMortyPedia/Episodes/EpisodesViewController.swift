//
//  EpisodesViewController.swift
//  RickMortyPedia
//
//  Created by Кирилл Ефремов on 15.12.2024.
//

import Foundation
import UIKit
import SwiftUI

class EpisodesViewController : UIViewController {
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .background
    }
    
    override func viewDidLoad() {
        title = String(localized: "episodes_button")
        super.viewDidLoad()
    }
}

struct EpisodesViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            let vc = EpisodesViewController()
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.navigationBar.prefersLargeTitles = true
            
            return navigationController
        }
    }
}
