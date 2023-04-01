//
//  ChecklistApp.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 14/3/2023.
//

import SwiftUI

@main
struct ChecklistApp: App {
    @State var model: DataModel = DataModel(checklists: testChecklists)
    var body: some Scene {
        WindowGroup {
            ContentView(model: $model)
        }
    }
}
