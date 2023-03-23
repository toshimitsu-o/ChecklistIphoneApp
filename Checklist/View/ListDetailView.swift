//
//  ListDetailView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 23/3/2023.
//

import SwiftUI

struct ListDetailView: View {
    var todo: Todo
    var body: some View {
        VStack{
            Text(todo.time)
                .foregroundColor(Color.white)
                .frame(width:61.0)
                .background(.blue)
            Text(todo.task)
            if todo.isDone {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.blue)
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(todo: checklist[0])
    }
}
