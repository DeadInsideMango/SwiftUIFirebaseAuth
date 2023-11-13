//
//  MainView.swift
//  SwiftUIFirebaseAuth
//
//  Created by Roman Hairulin on 11/11/2023.
//

import SwiftUI
import Firebase

struct MainView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("user information")) {
                    HStack {
                        Text("Email:")
                            .bold()
                        Text("\(sessionManager.user?.email ?? "")")
                            .padding(.horizontal, 10)
                    }
                    HStack {
                        Text("Name:")
                            .bold()
                        Text("\(sessionManager.user?.displayName ?? "No name provided")")
                            .padding(.horizontal, 5)
                    }
                    HStack {
                        Text("Phone:")
                            .bold()
                        Text("\(sessionManager.user?.phoneNumber ?? "No phone number added")")
                            .padding(.horizontal, 5)
                    }
                }
                Section(header: Text("Add your name and set up a phone number")) {
                    NavigationLink(destination: UpdateDataView()) {
                        Text("Update personal data")
                            .foregroundStyle(.blue)
                    }
                }
                Section(header: Text("Sign out from an account")) {
                    Button("Sign out", role: .cancel) {
                        sessionManager.signOut()
                    }
                }
                Section(header: Text("Deleting an account cannot be canceled")) {
                    Button("Delete an account", role: .destructive) {
                        sessionManager.deleteUser()
                    }
                }
            }
            .navigationTitle("Today")
        }
    }
}

#Preview {
    MainView()
}
