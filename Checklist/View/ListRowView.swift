//
//  ListRowView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 23/3/2023.
//

import SwiftUI

/// Row view of checklist list
struct ListRowView: View {
    @Binding var todo: Todo
    let lightGray = Color(white: 0.9)
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(todo.isDone ? .blue : .gray)
                    .onTapGesture {
                        todo.isDone = !todo.isDone
                    }
                TextField("New task", text: $todo.task)
                Spacer()
                Menu {
                    Picker(selection: $todo.time) {
                        ForEach(Day.allCases) { value in
                            Text(value.rawValue.capitalized)
                                .tag(value)
                        }
                    } label: {}
                } label: {
                    Text(todo.time == .none ? "-" : todo.time.rawValue.capitalized)
                        .font(.body)
                        .foregroundColor(Color.white)
                        .frame(width:50.0)
                        .background(todo.time == .none ? lightGray : .green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }.id(todo.time)
//                Text(todo.time.rawValue.capitalized)
//                    .foregroundColor(Color.white)
//                    .frame(width:55.0)
//                    .background(.blue)
//                    .onTapGesture {
//                        showEdit = !showEdit
//                    }
            }
//            if (showEdit) {
//                VStack {
//                    HStack {
//                        TextField("New task", text: $todo.task)
//                        Picker(selection: $todo.time, label: EmptyView()) {
//                            ForEach(Day.allCases) {
//                                day in
//                                Text(day.rawValue.capitalized)
//                            }
//                        }.pickerStyle(.menu)
//                            .background(lightGray)
//                            .frame(width: 70)
//                            .clipped()
//                    }
//                    Button(action: {showEdit = false}) {
//                        Label("Done", systemImage: "arrow.uturn.backward.circle")
//                    }
//                }
//                .padding(8)
//                .background(.white)
//                .clipShape(RoundedRectangle(cornerRadius: 8))
//                .shadow(color: boxShadow, radius: 5, x: 5, y: 5)
//            }
        }
    }
}
