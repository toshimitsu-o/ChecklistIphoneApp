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
}

var testChecklists = [
    Checklist(title: "List One", todos: [
        Todo(task: "Read Swift book", time: "Mon", isDone: true),
        Todo(task: "Review lecture slides", time: "Tue", isDone: true),
        Todo(task: "Do workshop tasks", time: "Wed", isDone: true),
        Todo(task: "Attend workshop", time: "Thu", isDone: false),
        Todo(task: "Read additional readings", time: "Fri", isDone: false)
    ])
]
