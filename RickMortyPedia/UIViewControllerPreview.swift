//
//  UIViewControllerPreview.swift
//  RickMortyPedia
//
//  Created by Кирилл Ефремов on 12.12.2024.
//

import Foundation

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController

    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
}
#endif
