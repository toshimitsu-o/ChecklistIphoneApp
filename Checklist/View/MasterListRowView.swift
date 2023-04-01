//
//  MasterListRowView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 27/3/2023.
//

import SwiftUI

struct MasterListRowView: View {
    @Binding var checklist: Checklist
    var body: some View {
        HStack {
            Text(checklist.title)
        }
    }
}

//struct MasterListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterListRowView()
//    }
//}
