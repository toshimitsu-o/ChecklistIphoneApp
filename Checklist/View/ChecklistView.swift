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
    @ObservedObject var checklist: Checklist
    /// Storing checklist temporarily
    //@State var displayChecklist: Checklist = Checklist(title: "", todos: [])
    /// Empty task value for new todo item
    @State var newTodoTask = ""
    /// Manage state to check undo can be shown
    @State var canUndo = false
    @Environment(\.editMode) private var editMode
    
    /// List of Todo items and buttons for uncheck all, and undo with Edit button
    var body: some View {
        VStack {
            TitleEditView(title: $checklist.title)
                .onChange(of: checklist.title) {
                    _ in
                    saveData()
                }
            List {
                Section(){
                    ForEach($checklist.todos, id:\.id) {
                        $todo in
                        ListRowView(todo: $todo)
                            .onChange(of: todo) {
                                _ in
                                saveData()
                            }
                    }
                    .onDelete{
                        // Delete item
                        index in
                        checklist.todos.remove(atOffsets: index)
                        saveData()
                    }
                    .onMove{
                        // Move item
                        index, i in
                        checklist.todos.move(fromOffsets: index, toOffset: i)
                        saveData()
                    }
                    // Add new Todo by hit enter
                    HStack {
                        Image(systemName: "plus.circle")
                        TextField("New task", text: $newTodoTask)
                            .onSubmit {
                                let newTodo = Todo(task: newTodoTask, time: .none, isDone: false)
                                // Add new Todo
                                checklist.todos.append(newTodo)
                                saveData()
                                // Reset the textfield value
                                newTodoTask = ""
                            }
                    }
                }
                // Items to show in Edit mode
                if editMode?.wrappedValue.isEditing == true {
                    Button(action: {
                        // Change all isDone to false
                        checklist.resetStatuses()
                        saveData()
                        // Change state to show Undo
                        canUndo = true
                    }) {
                        Label("Uncheck All", systemImage: "circle.dotted")
                    }
                    if canUndo {
                        Button(action: {
                            // revert isDone state to previous
                            checklist.undoStatus()
                            saveData()
                            // Change state to hide Undo
                            canUndo = false
                        }) {
                            Label("Undo Checks", systemImage: "arrow.uturn.backward.circle")
                        }
                    }
                }
            }
        }
//        .onAppear{
//            // Copy original checklist
//            displayChecklist = checklist
//        }
//        .onDisappear{
//            // Save updated checklist
//            checklist.title = displayChecklist.title
//            checklist.todos = displayChecklist.todos
//            saveData()
//
//        }
        .navigationBarItems(trailing: EditButton())
        .navigationTitle(checklist.title)
    }
}

struct ChecklistView_Previews: PreviewProvider {
    @StateObject static var checklist = DataModel.getDataModel().checklists[0]
    static var previews: some View {
        ChecklistView(checklist: checklist)
    }
}
