//
//  SignInView.swift
//  SwiftUIFirebaseAuth
//
//  Created by Roman Hairulin on 08/11/2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift


struct SignInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @StateObject private var globalViewModel = GlobalViewModel()
    
    @EnvironmentObject var sessionManager: SessionManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("email & password")) {
                    HStack {
                        Text("Email")
                            .bold()
                        TextField("Email", text: $email)
                            .padding(.horizontal, 45)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                    HStack {
                        Text("Password")
                            .bold()
                        SecureField("Password", text: $password)
                            .padding(.horizontal, 10)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                }
                Section {
                    Button("Sign In") {
                        sessionManager.login(email: email.trimmingCharacters(in: .whitespaces), password: password.trimmingCharacters(in: .whitespaces))
                    }
                    .disabled(email == "" || password == "" || globalViewModel.checkIfEmailCorrect(email: email) == false)
                    .alert("Oops... error 🤖", isPresented: $sessionManager.showAlert) {
                        Button("OK", role: .cancel) { dismiss() }
                    } message: {
                        Text(sessionManager.alertMessage)
                    }
                }
                Section(footer: Text("You will be passed to an account creation page")) {
                    NavigationLink(destination: SIgnUpView()) {
                        Text("Sign Up")
                            .foregroundStyle(.blue)
                    }
                }
            }
            .navigationTitle("Firebase Auth")
        }
    }
}

#Preview {
    SignInView()
}
