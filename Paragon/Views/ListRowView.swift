//
//  ListRowView.swift
//  Paragon
//
//  Created by arsal on 9/2/25.
//

import SwiftUI

struct ListRowView: View {
    let listItem: ItemListModel

    @State private var isCompleted: Bool = false
    var onToggle: ((Bool) -> Void)? = nil
    

    var body: some View {
        HStack(spacing: 12) {
            Button {
                withAnimation(.spring(response: 0.25, dampingFraction: 0.9)) {
                    isCompleted.toggle()
                    onToggle?(isCompleted)
                }
            } label: { 
                Image(
                    systemName: isCompleted ? "checkmark.circle.fill" : "circle"
                )
                .foregroundStyle(isCompleted ? .green : .secondary)
                .imageScale(.large)
                .contentTransition(.symbolEffect)
            }
            .buttonStyle(.plain)
            .accessibilityLabel(
                listItem.isCompleted ? "Mark as incomplete" : "Mark as complete"
            )

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
        .onTapGesture {
            withAnimation(.spring(response: 0.25, dampingFraction: 0.9)) {
                isCompleted.toggle()
                onToggle?(isCompleted)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityValue(listItem.isCompleted ? "Completed" : "Not completed")
    }
}

#Preview {
    VStack(spacing: 12) {
        ListRowView(listItem: ItemListModel(name: "abc", isCompleted: true))
        
    }
    .padding()
}
