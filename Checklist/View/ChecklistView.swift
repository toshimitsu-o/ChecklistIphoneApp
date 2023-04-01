//
//  ChecklistView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 27/3/2023.
//

import SwiftUI
extension UIPickerView {
   open override var intrinsicContentSize: CGSize {
      return CGSize(width: UIView.noIntrinsicMetric, height: super.intrinsicContentSize.height)}
}
struct ChecklistView: View {
    @Binding var checklist: Checklist
    @State var displayChecklist: Checklist = Checklist(title: "", todos: [])
    @State var newTodoTask = ""
    @State private var selectedDay: Day = .none
    @Environment(\.editMode) var editMode
    var body: some View {
        VStack {
            List {
                if(editMode?.wrappedValue == .active) {
                    Section(header: Text("Title")) {
                        HStack {
                            TextField("New title", text: $displayChecklist.title)
                            Button("Cancel"){
                                displayChecklist.title = checklist.title
                            }
                        }
                    }
                }
                Section() {
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
                    
                }
                Section(header: Text("Add new task")) {
                    HStack {
                        Image(systemName: "plus.circle")
                        VStack {
                            Picker("Time", selection: $selectedDay) {
                                ForEach(Day.allCases) {
                                    day in
                                    Text(day.rawValue.capitalized)
                                }
                            }.pickerStyle(.menu)
                            TextField("New task", text: $newTodoTask)
                                .onSubmit {
                                    let newTodo = Todo(task: newTodoTask, time: selectedDay, isDone: false)
                                    displayChecklist.todos.append(newTodo)
                                    newTodoTask = ""
                                    selectedDay = .none
                                }
                        }
                    }
                }
                if(editMode?.wrappedValue == .active) {
                    Button(action: {
                        for index in displayChecklist.todos.indices {
                            displayChecklist.todos[index].isDone = false
                        }
                    }) {
                        Label("Uncheck All", systemImage: "circle.dotted")
                    }
                }
                if (displayChecklist != checklist) {
                    Button(action: {displayChecklist = checklist}) {
                        Label("Undo Changes", systemImage: "arrow.uturn.backward.circle")
                    }
                }
            }
        }
        .onAppear{
            displayChecklist = checklist
        }
        .onDisappear{
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
