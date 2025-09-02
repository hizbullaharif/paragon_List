//
//  ItemListModel.swift
//  Paragon
//
//  Created by arsal on 9/2/25.
//

import Foundation

struct ItemListModel: Identifiable, Codable {
    var id: String
    var name: String
    var isCompleted: Bool

    init(
        id: String = UUID().uuidString,
        name: String,
        isCompleted: Bool = false
    ) {
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
    }

    func updateCompletion() -> ItemListModel {
        return ItemListModel(id: id, name: name, isCompleted: !isCompleted)
    }
}
