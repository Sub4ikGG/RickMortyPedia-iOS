//
//  MainViewController.swift
//  RickMortyPedia
//
//  Created by Кирилл Ефремов on 11.12.2024.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController {
    
    private var rickImageView: UIImageView { setupRickImageView() }
    
    private let charactersButton: UIMainButton = UIMainButton(title: String(localized: "characters_button"))
    private let locationsButton: UIMainButton = UIMainButton(title: String(localized: "locations_button"))
    private let episodesButton: UIMainButton = UIMainButton(title: String(localized: "episodes_button"))
    
    private var stackView: UIStackView { setupStackView() }
    
    private func setupStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [rickImageView, charactersButton, locationsButton, episodesButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }
    
    private func setupRickImageView() -> UIImageView {
        let rickImageEdgeInsetValue: CGFloat = -20
        let rickImageUIEdgeInsets = UIEdgeInsets(
            top: rickImageEdgeInsetValue,
            left: rickImageEdgeInsetValue,
            bottom: rickImageEdgeInsetValue,
            right: rickImageEdgeInsetValue
        )
        
        let rickImage = UIImageView(image: UIImage(resource: .rickLogo))
        rickImage.image = rickImage.image?.withAlignmentRectInsets(rickImageUIEdgeInsets)
        rickImage.contentMode = .scaleAspectFit
        return rickImage
    }
    
    override func loadView() {
        super.loadView()
        
        setupButtonsActions()
        
        let stackView = UIStackView(arrangedSubviews: [rickImageView, charactersButton, locationsButton, episodesButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        // Настраиваем ограничения для UIStackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ViewConstants.leadingPadding),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: ViewConstants.trailingPadding),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: ViewConstants.bottomPadding),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: ViewConstants.topPadding)
        ])
        
        navigationItem.title = "RickMortyPedia"
    }
    
    private func setupButtonsActions() {
        charactersButton.addTarget(self, action: #selector(showCharactersViewController), for: .touchUpInside)
        locationsButton.addTarget(self, action: #selector(showLocationsViewController), for: .touchUpInside)
        episodesButton.addTarget(self, action: #selector(showEpisodesViewController), for: .touchUpInside)
    }
    
    @objc private func showCharactersViewController() {
        let charactersViewController = CharactersViewController()
        navigationController?.pushViewController(charactersViewController, animated: true)
    }
    
    @objc private func showLocationsViewController() {
        let locationsViewController = LocationsViewController()
        navigationController?.pushViewController(locationsViewController, animated: true)
    }
    
    @objc private func showEpisodesViewController() {
        let episodesViewController = UIViewController()
        navigationController?.pushViewController(episodesViewController, animated: true)
    }
}

struct MainViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            let vc = MainViewController()
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.navigationBar.prefersLargeTitles = true
            
            return navigationController
        }
    }
}
