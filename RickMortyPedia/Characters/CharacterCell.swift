//
//  CharacterCell.swift
//  RickMortyPedia
//
//  Created by Кирилл Ефремов on 13.12.2024.
//

import Foundation
import UIKit
import SwiftUI

class CharacterCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initialize(location: Character) {
        self.selectionStyle = .none
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ViewConstants.topPadding / 2),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ViewConstants.leadingPadding),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ViewConstants.trailingPadding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: ViewConstants.bottomPadding / 2)
        ])
        
        let uuidLabel = UILabel()
        uuidLabel.text = "UUID: \(location.uuid)"
        uuidLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(uuidLabel)
        
        let nameLabel = UILabel()
        nameLabel.text = "Name: \(location.name)"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(nameLabel)
    }
}

struct LocationCell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            let vc = LocationsViewController()
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.navigationBar.prefersLargeTitles = true
            
            return navigationController
        }
    }
}
