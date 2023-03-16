//
//  ContentView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 14/3/2023.
//

import SwiftUI

struct Todo: Hashable {
    var task: String
    var time: String
    var status: Bool
}

var checklist = [
    Todo(task: "Commit to git", time: "Mon", status: true),
    Todo(task: "Update the changelog", time: "Wed", status: false)
]

struct ContentView: View {
    var body: some View {
        List {
            ForEach(checklist, id:\.self) { todo in
                HStack {
                    Text(todo.time)
                        .foregroundColor(Color.white)
                        .frame(width:61.0)
                        .background(.blue)
                    Text(todo.task)
                    Spacer()
                    if todo.status {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                    } else {
                        Image(systemName: "circle")
                            .foregroundColor(.gray)
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
