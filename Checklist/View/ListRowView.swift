//
//  ListRowView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 23/3/2023.
//

import SwiftUI

/// Row view of checklist list
struct ListRowView: View {
    @Binding var todo: Todo
    var body: some View {
        HStack {
            Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                .foregroundColor(todo.isDone ? .blue : .gray)
                .onTapGesture {
                    todo.isDone = !todo.isDone
                }
            Text(todo.task)
            Spacer()
            Text(todo.time.rawValue.capitalized)
                .foregroundColor(Color.white)
                .frame(width:55.0)
                .background(.blue)
        }
    }
}
