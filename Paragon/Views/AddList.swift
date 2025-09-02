//
//  ListRowView.swift
//  Paragon
//
//  Created by arsal on 9/2/25.
//

import SwiftUI

struct AddListView: View {

    @State var listName: String = ""

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {

        VStack {
            TextField("List Name", text: $listName)
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .frame(height: 50)
                .multilineTextAlignment(.leading)

            Button {
                addToList()
            } label: {
                Text("Add")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 30)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding(10)
        .navigationTitle("Add to List 🖋️")
    }

    func addToList() {
        guard !listName.isEmpty else { return }
        listViewModel.addToList(name: listName)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    NavigationView {
        AddListView()
    }

}
