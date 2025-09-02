//
//  ListRowView.swift
//  Paragon
//
//  Created by arsal on 9/2/25.
//

import SwiftUI

struct ListRowView: View {
    let listItem: ItemListModel
    var body: some View {
        HStack(spacing: 12) {
            Image(
                systemName: listItem.isCompleted
                    ? "checkmark.circle.fill" : "circle"
            )
            .foregroundStyle(listItem.isCompleted ? .green : .secondary)
            .imageScale(.large)
            .contentTransition(.symbolEffect)

            Text(listItem.name)
                .font(.title3.weight(.medium))
                .foregroundStyle(listItem.isCompleted ? .secondary : .primary)
                .strikethrough(listItem.isCompleted, color: .secondary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            Spacer(minLength: 0)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.secondary.opacity(0.12))
        )
        .contentShape(Rectangle())
        .accessibilityElement(children: .combine)
        .accessibilityValue(
            listItem.isCompleted ? "Completed" : "Not completed"
        )
    }
}

#Preview {
    VStack(spacing: 12) {
        ListRowView(listItem: ItemListModel(name: "abc", isCompleted: true))

    }
    .padding()
}
