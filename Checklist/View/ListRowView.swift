//
//  ListRowView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 23/3/2023.
//

import SwiftUI

/// Sub view of row content for todo list
struct ListRowView: View {
    /// Biding todo value
    @Binding var todo: Todo
    /// Background colour for .none selection in Todo:Time
    let noneBackgroundColor = Color(white: 0.9)
    
    /// Todo details with checkmark, task text field, and menu with picker to change todo.time
    var body: some View {
        VStack {
            HStack {
                Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(todo.isDone ? .blue : .gray)
                    .onTapGesture {
                        // Toggle todo check state
                        todo.isDone = !todo.isDone
                    }
                TextField("New task", text: $todo.task)
                Spacer()
                // Menu selection to change time
                Menu {
                    Picker(selection: $todo.time) {
                        ForEach(Day.allCases) { value in
                            Text(value.rawValue.capitalized)
                                .tag(value)
                        }
                    } label: {}
                } label: {
                    // Label for the menu control
                    Text(todo.time == .none ? "-" : todo.time.rawValue.capitalized)
                        .font(.body)
                        .foregroundColor(Color.white)
                        .frame(width:50.0)
                        .background(todo.time == .none ? noneBackgroundColor : .green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }.id(todo.time)
            }
        }
    }
}
