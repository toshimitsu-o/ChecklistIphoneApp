//
//  TodoModel.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 16/3/2023.
//

///  Defines Todo task
struct Todo: Hashable {
    /// Task name
    var task: String
    /// Time tag for todo task
    var time: String
    /// Status of todo task
    var isDone: Bool
}
