//
//  ChecklistView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 27/3/2023.
//

import SwiftUI

struct ChecklistView: View {
    @Binding var checklist: Checklist
    var body: some View {
            List {
                ForEach($checklist.todos, id:\.self) {
                    $todo in
                    NavigationLink(destination: ListDetailView(todo: $todo)) {
                        ListRowView(todo: $todo)
                    }
                }
            }
            .navigationTitle($checklist.title)
    }
}

//struct ChecklistView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChecklistView(checklist: testChecklists[0])
//    }
//}
