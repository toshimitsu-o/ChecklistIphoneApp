//
//  ChecklistView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 27/3/2023.
//

import SwiftUI

/// Detail view listing Todo of a selected Checklist with Edit button
struct ChecklistView: View {
    /// Binding checklist value
    @Binding var checklist: Checklist
    /// Storing checklist temporarily
    @State var displayChecklist: Checklist = Checklist(title: "", todos: [])
    /// Empty task value for new todo item
    @State var newTodoTask = ""
    @Environment(\.editMode) private var editMode
    
    /// List of Todo items and buttons for uncheck all, and undo with Edit button
    var body: some View {
        VStack {
            TitleEditView(title: $displayChecklist.title)
            List {
                Section(){
                    ForEach($displayChecklist.todos, id:\.id) {
                        $todo in
                        ListRowView(todo: $todo)
                    }
                    .onDelete{
                        // Delete item
                        index in
                        displayChecklist.todos.remove(atOffsets: index)
                    }
                    .onMove{
                        // Move item
                        index, i in
                        displayChecklist.todos.move(fromOffsets: index, toOffset: i)
                    }
                    // Add new Todo by hit enter
                    HStack {
                        Image(systemName: "plus.circle")
                        TextField("New task", text: $newTodoTask)
                            .onSubmit {
                                let newTodo = Todo(task: newTodoTask, time: .none, isDone: false)
                                // Add new Todo
                                displayChecklist.todos.append(newTodo)
                                // Reset the textfield value
                                newTodoTask = ""
                            }
                    }
                }
                // Items to show in Edit mode
                if editMode?.wrappedValue.isEditing == true {
                    Button(action: {
                        // Loop to change todo check state to false
                        for index in displayChecklist.todos.indices {
                            displayChecklist.todos[index].isDone = false
                        }
                    }) {
                        Label("Uncheck All", systemImage: "circle.dotted")
                    }
                    Button(action: {
                        // Loop to revert todo check state to original
                        for index in displayChecklist.todos.indices {
                            displayChecklist.todos[index].isDone = checklist.todos[index].isDone
                        }
                    }) {
                        Label("Undo Checks", systemImage: "arrow.uturn.backward.circle")
                    }
                }
            }
        }
        .onAppear{
            // Copy original checklist
            displayChecklist = checklist
        }
        .onDisappear{
            // Save updated checklist
            checklist = displayChecklist
        }
        .navigationBarItems(trailing: EditButton())
        .navigationTitle($displayChecklist.title)
    }
}

struct ChecklistView_Previews: PreviewProvider {
    @State static var checklist = Checklist(title: testChecklists[0].title, todos: testChecklists[0].todos)
    static var previews: some View {
        ChecklistView(checklist: $checklist)
    }
}
