//
//  ChecklistModel.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 27/3/2023.
//

/// Defines checklist model
struct Checklist: Hashable {
    /// Checklist title name
    var title: String
    /// Array to store todos
    var todos: [Todo]
    /// Function to change all isDone statues to false
    mutating func resetStatuses() {
        for i in todos.indices {
            todos[i].previouIsDone = todos[i].isDone
            todos[i].isDone = false
        }
    }
    /// Function to revert  all isDone statues to previous ones
    mutating func undoStatus() {
        for i in todos.indices {
            // Check if previouIsDone exists
            if let previous = todos[i].previouIsDone {
                todos[i].isDone = previous
            }
        }
    }
}

