//
//  TodoModel.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 16/3/2023.
//


struct Todo: Hashable {
    var task: String
    var time: String
    var isDone: Bool
}

var checklist = [
    Todo(task: "Read Swift book", time: "Mon", isDone: true),
    Todo(task: "Review lecture slides", time: "Tue", isDone: true),
    Todo(task: "Do workshop tasks", time: "Wed", isDone: true),
    Todo(task: "Attend workshop", time: "Thu", isDone: false),
    Todo(task: "Read additional readings", time: "Fri", isDone: false)
]
