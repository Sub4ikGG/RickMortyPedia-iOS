//
//  Character.swift
//  RickMortyPedia
//
//  Created by Кирилл Ефремов on 13.12.2024.
//

import Foundation

struct Character {
    let uuid: UUID
    let name: String
    
    init(index: UUID = UUID(), name: String) {
        self.uuid = index
        self.name = name
    }
}
