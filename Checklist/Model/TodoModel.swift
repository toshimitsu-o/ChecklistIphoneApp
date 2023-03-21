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
    Todo(task: "Review lecture slides", time: "Tue", isDone: false),
    Todo(task: "Do workshop tasks", time: "Wed", isDone: false)
]
