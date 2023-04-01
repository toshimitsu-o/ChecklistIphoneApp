//
//  ChecklistView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 27/3/2023.
//

import SwiftUI

struct ChecklistView: View {
    @Binding var checklist: Checklist
    @State var displayChecklit: Checklist
    @Environment(\.editMode) var editMode
    var body: some View {
            List {
                ForEach($checklist.todos, id:\.self) {
                    $todo in
                    NavigationLink(destination: ListDetailView(todo: $todo)) {
                        ListRowView(todo: $todo)
                    }
                }
            }
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                // Add new item
                let newTodo = Todo(task: "New", time: "-", isDone: false)
                checklist.todos.insert(newTodo, at: 0)
            }){Image(systemName: "plus.circle")})
            .navigationTitle($checklist.title)
    }
}

//struct ChecklistView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChecklistView(checklist: testChecklists[0])
//    }
//}
