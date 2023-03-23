//
//  ListDetailView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 23/3/2023.
//

import SwiftUI

/// Detail view of checklist list
struct ListDetailView: View {
    @State var todo: Todo
    @State var originalTask: Todo = Todo(task: "", time: "", isDone: false)
    var body: some View {
        VStack{
            Text(todo.task)
                .font(.title)
            Spacer()
            Text(todo.time)
                .foregroundColor(Color.white)
                .frame(width:61.0)
                .background(.blue)
            Text(todo.task)
            TextField("<new name>", text: $todo.task)
            if todo.isDone {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.blue)
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.gray)
            }
            Spacer()
            HStack{
                Button("Undo"){
                    todo = originalTask
                }
            }
            Spacer()
        }
        .onAppear{
            originalTask = todo
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(todo: checklist[0])
    }
}
