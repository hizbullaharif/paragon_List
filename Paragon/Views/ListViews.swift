//
//  ListRowView.swift
//  Paragon
//
//  Created by arsal on 9/2/25.
//

import SwiftUI

struct ListView: View {

    @State var todoList: [ItemListModel] = [
        ItemListModel(name: "Buy milk", isCompleted: false),
        ItemListModel(name: "Buy eggs", isCompleted: true),
        ItemListModel(name: "Buy bread", isCompleted: false),
    ]

    var body: some View {
        List {
            ForEach(todoList) { item in
                ListRowView(listItem: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📋")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink(
                "Add",
                destination: AddListView()
            )
        )
    }
}

#Preview {
    ListView()
}
