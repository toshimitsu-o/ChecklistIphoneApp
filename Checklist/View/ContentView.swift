//
//  ContentView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 14/3/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List {
                ForEach(checklist, id:\.self) {
                    todo in
                    NavigationLink(destination: ListRowView(todo: todo)) {
                        ListRowView(todo: todo)
                    }
                }
            }.navigationTitle("MAD Tasks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
