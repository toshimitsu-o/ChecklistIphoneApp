//
//  ContentView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 14/3/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("MAD tasks")
                .font(.title)
            List {
                ForEach(checklist, id:\.self) { todo in
                    HStack {
                        Text(todo.time)
                            .foregroundColor(Color.white)
                            .frame(width:61.0)
                            .background(.blue)
                        Text(todo.task)
                        Spacer()
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
