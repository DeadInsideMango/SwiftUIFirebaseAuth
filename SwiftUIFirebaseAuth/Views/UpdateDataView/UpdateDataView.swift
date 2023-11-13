//
//  UpdateDataView.swift
//  SwiftUIFirebaseAuth
//
//  Created by Roman Hairulin on 11/11/2023.
//

import SwiftUI

struct UpdateDataView: View {
    
    @State private var firstName: String = ""
    @State private var phoneNumber: String = ""
    
    @StateObject private var updateDataViewModel = UpdateDataViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List {
            Section(header: Text("Add personal info to your account")) {
                HStack {
                    Text("Name")
                        .bold()
                    TextField("Name", text: $firstName)
                        .padding(.horizontal, 10)
                }
                HStack {
                    Text("Phone")
                        .bold()
                    TextField("Phone number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .padding(.horizontal, 5)
                    
                }
            }
            Section {
                Button("Save changes") {
                    updateDataViewModel.update(firstName: firstName.trimmingCharacters(in: .whitespaces), phoneNumber: phoneNumber)
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(firstName.isEmpty || phoneNumber.isEmpty)
            }
        }
        .navigationTitle("Update")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UpdateDataView()
}
