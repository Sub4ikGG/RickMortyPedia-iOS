//
//  ViewExtensions.swift
//  RickMortyPedia
//
//  Created by Кирилл Ефремов on 12.12.2024.
//

import Foundation

extension CGRect {
    var widthWithPadding: CGFloat {
        let value = self.width - ViewConstants.defaultPadding
        return value < 0 ? self.width : value
    }
}
