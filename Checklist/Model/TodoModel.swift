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
    var time: Day
    /// Status of todo task
    var isDone: Bool
}

enum Day: String, CaseIterable, Identifiable {
    case mon, tue, wed, thu, fri, sat, sun
    var id: Self { self }
}
