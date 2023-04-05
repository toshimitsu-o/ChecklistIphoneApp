//
//  TodoModel.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 16/3/2023.
//
import Foundation

///  Defines Todo task
struct Todo: Hashable {
    var id = UUID()
    /// Task name
    var task: String
    /// Time tag for todo task (enum Day)
    var time: Day
    /// Status of todo task
    var isDone: Bool
}

/// Selection of day for the time tag in Todo
enum Day: String, CaseIterable, Identifiable {
    case none, mon, tue, wed, thu, fri, sat, sun
    var id: Self { self }
}
