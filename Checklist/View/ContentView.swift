//
//  ContentView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 14/3/2023.
//

import SwiftUI

/// Main view of the app listing checklists with Add and Edit buttons
struct ContentView: View {
    /// Biding data model
    @ObservedObject var model: DataModel
    /// Master list with navigation
    var body: some View {
        NavigationView{
            List {
                ForEach(model.checklists, id:\.id) {
                    checklist in
                    NavigationLink(destination: ChecklistView(checklist: checklist)) {
                        MasterListRowView(checklist: checklist)
                    }
                }
                .onDelete{
                    // Delete item
                    index in
                    model.checklists.remove(atOffsets: index)
                    saveData()
                }
                .onMove{
                    // Move item
                    index, i in
                    model.checklists.move(fromOffsets: index, toOffset: i)
                    saveData()
                }
            }
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                // Add new item
                let newChecklist = Checklist(title: "New item", todos: [])
                model.checklists.append(newChecklist)
                saveData()
            }){Image(systemName: "plus.circle")})
            .navigationTitle("Checklists")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var data:DataModel = DataModel.getDataModel()
    static var previews: some View {
        ContentView(model: data)
    }
}
