//
//  CharactersViewController.swift
//  RickMortyPedia
//
//  Created by Кирилл Ефремов on 12.12.2024.
//

import Foundation
import UIKit
import SwiftUI

class CharactersViewController : UIViewController {
    let contentView = UIView()
    let stackView = UIStackView()
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .background
        title = String(localized: "characters_button")
        
        // MARK: - Setup ScrollView
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        // MARK: - Setup ContentView
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
        // MARK: - Setup ContrainerView
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),   // Верхний отступ
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16), // Левый отступ
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16), // Правый отступ
        ])
        
        // MARK: - Setup StackView
        stackView.axis = .vertical
        stackView.spacing = ViewConstants.defaultSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
        
        // MARK: - Setup TempView
        for i in 1..<30 {
            let tempView = UIView()
            tempView.backgroundColor = UIColor.gray.withAlphaComponent(1.0 - (Double(i) / 100.0))
            
            stackView.addArrangedSubview(tempView)
            
            tempView.heightAnchor.constraint(equalToConstant: .random(in: 100...500)).isActive = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        contentView.heightAnchor.constraint(greaterThanOrEqualTo: stackView.heightAnchor, constant: ViewConstants.defaultPadding * 2).isActive = true
    }
}

struct CharactersViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            let vc = CharactersViewController()
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.navigationBar.prefersLargeTitles = true
            
            return navigationController
        }
    }
}
