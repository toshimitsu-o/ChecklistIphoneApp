//
//  DataModel.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 5/4/2023.
//

/// Model to store user's checklists
struct DataModel {
    /// Array of Checklist
    var checklists: [Checklist]
}

/// Sample array of Checklist containing an array of Todo
var testChecklists = [
    Checklist(title: "MAD tasks", todos: [
        Todo(task: "Read Swift book", time: .mon, isDone: true),
        Todo(task: "Review lecture slides", time: .tue, isDone: true),
        Todo(task: "Do workshop tasks", time: .wed, isDone: true),
        Todo(task: "Attend workshop", time: .thu, isDone: false),
        Todo(task: "Read additional readings", time: .fri, isDone: false)
    ])
]
