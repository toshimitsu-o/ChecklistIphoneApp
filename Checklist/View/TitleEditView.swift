//
//  TitleEditView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 2/4/2023.
//

import SwiftUI

/// Sub view to edit title in edit mode
struct TitleEditView: View {
    /// Binding title value
    @Binding var title: String
    /// Storing title value temporary
    @State var displayTitle: String = ""
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        if editMode?.wrappedValue.isEditing == true {
                HStack {
                    Image(systemName: "square.and.pencil")
                    TextField("New title", text: $displayTitle)
                    Button("Cancel"){
                        displayTitle = title
                    }
                }.padding(30)
                .onAppear{
                    // Duplicate title value
                    displayTitle = title
                }
                .onDisappear{
                    // Save updated title value
                    title = displayTitle
                }
            Spacer()
        }
    }
}
