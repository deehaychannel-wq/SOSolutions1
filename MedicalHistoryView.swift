//
//  MedicalHistoryView.swift
//  SOSolutions
//
//  Created by Dee Hay on 2/5/26.
//

import SwiftUI

struct MedicalHistoryView : View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Text("Medical History")
                .navigationTitle("Medical History")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Done") {
                            dismiss()
                        }
                    }
                }
        }
    }
}
