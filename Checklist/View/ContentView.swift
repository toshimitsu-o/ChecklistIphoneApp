//
//  ContentView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 14/3/2023.
//

import SwiftUI

/// Main view of the app
struct ContentView: View {
    @Binding var model: DataModel
    var body: some View {
        NavigationView{
            List {
                ForEach($model.checklists, id:\.self) {
                    checklist in
                    NavigationLink(destination: ChecklistView(checklist: checklist)) {
                        MasterListRowView(checklist: checklist)
                    }
                }
                .onDelete{
                    // Delete item
                    index in
                    model.checklists.remove(atOffsets: index)
                }
                .onMove{
                    // Move item
                    index, i in
                    model.checklists.move(fromOffsets: index, toOffset: i)
                }
            }
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                // Add new item
                let newChecklist = Checklist(title: "New item", todos: [])
                model.checklists.append(newChecklist)
            }){Image(systemName: "plus.circle")})
            .navigationTitle("Checklists")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var model = DataModel(checklists: testChecklists)
    static var previews: some View {
        ContentView(model: $model)
    }
}
