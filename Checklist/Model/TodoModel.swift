//
//  TodoModel.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 16/3/2023.
//

///  Defines Todo tasks
struct Todo: Hashable {
    /// Task name
    var task: String
    /// Time tag for todo task
    var time: String
    /// Status of todo task
    var isDone: Bool
}

var checklist = [
    Todo(task: "Read Swift book", time: "Mon", isDone: true),
    Todo(task: "Review lecture slides", time: "Tue", isDone: true),
    Todo(task: "Do workshop tasks", time: "Wed", isDone: true),
    Todo(task: "Attend workshop", time: "Thu", isDone: false),
    Todo(task: "Read additional readings", time: "Fri", isDone: false)
]
