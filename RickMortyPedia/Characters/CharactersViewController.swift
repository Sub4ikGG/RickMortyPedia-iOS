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
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, constant: 1000)
        ])
        
        // MARK: - Setup ContrainerView
        let containerView = UIView()
        containerView.backgroundColor = .clear
        containerView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(containerView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),   // Верхний отступ
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),  // Нижний отступ
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16), // Левый отступ
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16), // Правый отступ
        ])
        
        // MARK: - Setup TempView
        let tempView = UIView()
        tempView.backgroundColor = .gray
        tempView.layer.cornerRadius = ViewConstants.defaultCornerRadius
        tempView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(tempView)
        
        NSLayoutConstraint.activate([
            tempView.topAnchor.constraint(equalTo: containerView.topAnchor),
            tempView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tempView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
        
        tempView.heightAnchor.constraint(equalToConstant: 100).isActive = true
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
