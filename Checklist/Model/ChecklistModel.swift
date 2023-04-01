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

struct DataModel {
    var checklists: [Checklist]
}

var testChecklists = [
    Checklist(title: "List One", todos: [
        Todo(task: "Read Swift book", time: .mon, isDone: true),
        Todo(task: "Review lecture slides", time: .tue, isDone: true),
        Todo(task: "Do workshop tasks", time: .wed, isDone: true),
        Todo(task: "Attend workshop", time: .thu, isDone: false),
        Todo(task: "Read additional readings", time: .fri, isDone: false)
    ])
]
