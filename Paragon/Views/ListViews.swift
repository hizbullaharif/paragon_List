//
//  ListRowView.swift
//  Paragon
//
//  Created by arsal on 9/2/25.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        List {
            ForEach(listViewModel.lists) { item in
                ListRowView(listItem: item)
                    .onTapGesture {
                        withAnimation(
                            .spring(response: 0.25, dampingFraction: 0.9)
                        ) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onMove(perform: listViewModel.onMoveList)
            .onDelete(perform: listViewModel.onDeleteList)
            
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
    NavigationView {
        ListView()
            .environmentObject(ListViewModel())
    }
}
