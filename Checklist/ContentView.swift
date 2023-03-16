//
//  ContentView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 14/3/2023.
//

import SwiftUI

struct Todo: Hashable {
    var task: String
    var status: Bool
}

var checklist = [
    Todo(task: "Commit to git", status: true),
    Todo(task: "Update the changelog", status: false)
]

struct ContentView: View {
    var body: some View {
        List {
            ForEach(checklist, id:\.self) { todo in
                HStack {
                    Text(todo.task)
                    Spacer()
                    if todo.status {
                        Image(systemName: "checkmark.circle.fill")
                    } else {
                        Image(systemName: "circle")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
