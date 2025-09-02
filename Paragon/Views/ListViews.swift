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
        Group {
            if listViewModel.lists.isEmpty {
                EmptyStateView()
            } else {
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
            }
        }
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
 
struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "tray")
                .font(.system(size: 44, weight: .regular))
                .foregroundStyle(.secondary)
            Text("No items yet")
                .font(.title3.weight(.semibold))
            Text("Tap Add to create your first task.")
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
