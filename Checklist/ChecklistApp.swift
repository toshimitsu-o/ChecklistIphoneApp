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
    init() {
        /// Change color of navigation bar title
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemGreen]
        }
    var body: some Scene {
        WindowGroup {
            if (data.loadingCompleted) {
                ContentView(model: data)
            } else {
                LoadingView()
            }
        }
    }
}
