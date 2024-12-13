//
//  LocationsViewController.swift
//  RickMortyPedia
//
//  Created by Кирилл Ефремов on 13.12.2024.
//

import Foundation
import UIKit
import SwiftUI

class LocationsViewController : UIViewController {
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    private let items: [Location] = [
        Location(name: "Moscow"),
        Location(name: "Saint-Petersburg"),
        Location(name: "Katowice"),
        Location(name: "Frankfurt"),
        Location(name: "Dallas")
    ]
    
    override func loadView() {
        super.loadView()
        
        title = String(localized: "locations_button")
        view.backgroundColor = .background
        
        // MARK: - Setup TableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(LocationCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.separatorStyle = .none
    }
}

extension LocationsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath) as! LocationCell
        let item = items[indexPath.row]
        cell.initialize(location: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

struct LocationsViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            let vc = LocationsViewController()
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.navigationBar.prefersLargeTitles = true
            
            return navigationController
        }
    }
}
