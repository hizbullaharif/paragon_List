//
//  ItemListModel.swift
//  Paragon
//
//  Created by arsal on 9/2/25.
//

import Foundation

struct ItemListModel: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var isCompleted: Bool
}
