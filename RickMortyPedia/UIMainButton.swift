//
//  UICharactersButton.swift
//  RickMortyPedia
//
//  Created by Кирилл Ефремов on 12.12.2024.
//

import Foundation
import UIKit
import SwiftUI

class UIMainButton: UIButton {
    
    let title: String
    let width: CGFloat
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                backgroundColor = .button.withAlphaComponent(0.7)
            } else {
                backgroundColor = .button
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(_ frame: CGRect = CGRect(), title: String, width: CGFloat) {
        self.title = title
        self.width = width
        
        super.init(frame: frame)
        
        setup()
    }
    
    private func setup() {
        setTitle(title, for: .normal)
        setTitleColor(.buttonTitle, for: .normal)

        layer.cornerRadius = 16
        layer.masksToBounds = true
        
        frame.size.height = 64
        frame.size.width = width
        
        backgroundColor = .button
    }
}

struct UIMainButton_Preview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            let vc = UIViewController()
            let button = UIMainButton(title: "UIMainButton", width: vc.view.frame.widthWithPadding)
            
            vc.view.addSubview(button)
            
            button.center = vc.view.center
            
            return vc
        }
    }
}
