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
            Text(todo.time)
                .foregroundColor(Color.white)
                .frame(width:61.0)
                .background(.blue)
            Text(todo.task)
            Spacer()
            if todo.isDone {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.blue)
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.gray)
            }
        }
    }
}
