//
//  ListViewModel.swift
//  Paragon
//
//  Created by arsal on 9/2/25.
//

import Foundation

class ListViewModel: ObservableObject {

    @Published var lists: [ItemListModel] = [] {
        didSet {
            persistData()
        }
    }

    init() {
        getItems()
    }

    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: "lists"),
            let lists = try? JSONDecoder().decode(
                [ItemListModel].self,
                from: data
            )
        else { return }
        self.lists = lists
    }

    func onMoveList(from source: IndexSet, to destination: Int) {
        lists.move(fromOffsets: source, toOffset: destination)
    }

    func onDeleteList(at offsets: IndexSet) {
        lists.remove(atOffsets: offsets)
    }

    func addToList(name: String) {
        lists.append(ItemListModel(name: name, isCompleted: false))
    }

    func updateItem(item: ItemListModel) {
        if let index = lists.firstIndex(where: { $0.id == item.id }) {
            lists[index] = item.updateCompletion()
        }
    }

    func persistData() {
        if let data = try? JSONEncoder().encode(lists) {
            UserDefaults.standard.set(data, forKey: "lists")
        }
    }
}
