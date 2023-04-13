//
//  ChecklistApp.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 14/3/2023.
//

import SwiftUI

@main
/// Base view of the app
struct ChecklistApp: App {
    /// Inisialise a data model with a sample data
    @StateObject var data:DataModel = DataModel.getDataModel()
    var body: some Scene {
        WindowGroup {
            ContentView(model: data)
        }
    }
}
