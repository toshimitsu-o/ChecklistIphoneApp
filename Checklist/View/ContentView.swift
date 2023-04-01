//
//  ContentView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 14/3/2023.
//

import SwiftUI

/// Main view of the app
struct ContentView: View {
    @State var checklists = [
        Checklist(title: "List One", todos: [
            Todo(task: "Read Swift book", time: "Mon", isDone: true),
            Todo(task: "Review lecture slides", time: "Tue", isDone: true),
            Todo(task: "Do workshop tasks", time: "Wed", isDone: true),
            Todo(task: "Attend workshop", time: "Thu", isDone: false),
            Todo(task: "Read additional readings", time: "Fri", isDone: false)
        ])
    ]
    var body: some View {
        NavigationView{
            List {
                ForEach($checklists, id:\.self) {
                    $checklist in
                    NavigationLink(destination: ChecklistView(checklist: $checklist)) {
                        MasterListRowView(checklist: $checklist)
                    }
                }
            }
            .navigationBarItems(trailing: Button(action: {
                // Add new item
                let newChecklist = Checklist(title: "New item", todos: [])
                checklists.insert(newChecklist, at: 0)
            }){Image( systemName: "plus.circle")})
            .navigationTitle("Checklists")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
