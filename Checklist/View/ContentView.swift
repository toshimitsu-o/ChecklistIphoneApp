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
                    ListRowView(todo: todo)
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
