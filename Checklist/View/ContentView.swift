//
//  ContentView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 14/3/2023.
//

import SwiftUI

/// Main view of the app
struct ContentView: View {
    @State var checklist = [
        Todo(task: "Read Swift book", time: "Mon", isDone: true),
        Todo(task: "Review lecture slides", time: "Tue", isDone: true),
        Todo(task: "Do workshop tasks", time: "Wed", isDone: true),
        Todo(task: "Attend workshop", time: "Thu", isDone: false),
        Todo(task: "Read additional readings", time: "Fri", isDone: false)
    ]
    var body: some View {
        NavigationView{
            List {
                ForEach($checklist, id:\.self) {
                    $todo in
                    NavigationLink(destination: ListDetailView(todo: $todo)) {
                        ListRowView(todo: $todo)
                    }
                }
            }.navigationTitle("MAD Tasks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
