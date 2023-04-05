//
//  MasterListRowView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 27/3/2023.
//

import SwiftUI

/// Sub view to contain row content for the main checklist list
struct MasterListRowView: View {
    /// Biding checklist
    @Binding var checklist: Checklist
    var body: some View {
        HStack {
            Text(checklist.title)
        }
    }
}
