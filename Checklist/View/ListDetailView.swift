//
//  ListDetailView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 23/3/2023.
//

import SwiftUI

/// Detail view of checklist list
struct ListDetailView: View {
    @Binding var todo: Todo
    @State var originalTodo: Todo = Todo(task: "", time: "", isDone: false)
    @State var newTodo: Todo = Todo(task: "", time: "", isDone: false)
    var body: some View {
        VStack{
            Text(newTodo.task)
                .font(.title)
            Spacer()
            Text(newTodo.time)
                .foregroundColor(Color.white)
                .frame(width:61.0)
                .background(.blue)
            Text(newTodo.task)
            TextField("<new name>", text: $newTodo.task)
            if newTodo.isDone {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.blue)
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.gray)
            }
            Spacer()
            HStack{
                if (originalTodo != newTodo) {
                    Button("Undo"){
                        newTodo = originalTodo
                    }
                }
            }
            Spacer()
        }
        .onAppear{
            originalTodo = todo
            newTodo = todo
        }
        .onDisappear{
            todo = newTodo
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(todo: .constant(Todo(task: "Read Swift book", time: "Mon", isDone: true)))
    }
}
