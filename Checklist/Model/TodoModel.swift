//
//  TodoModel.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 16/3/2023.
//


struct Todo: Hashable {
    var task: String
    var time: String
    var status: Bool
}

var checklist = [
    Todo(task: "Commit to git", time: "Mon", status: true),
    Todo(task: "Update the changelog", time: "Wed", status: false)
]
