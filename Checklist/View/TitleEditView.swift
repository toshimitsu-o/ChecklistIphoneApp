//
//  TitleEditView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 2/4/2023.
//

import SwiftUI

struct TitleEditView: View {
    @Binding var title: String
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
                }.padding(20)
                .onAppear{
                    displayTitle = title
                }
                .onDisappear{
                    title = displayTitle
                }
            Spacer()
        }
    }
}
