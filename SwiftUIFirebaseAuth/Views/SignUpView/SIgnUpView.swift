//
//  SIgnUpView.swift
//  SwiftUIFirebaseAuth
//
//  Created by Roman Hairulin on 08/11/2023.
//

import SwiftUI

struct SIgnUpView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordHint: String = "Please be sure to create your password at least 8 characters long, with at least one large letter (A-Z), with at least one number (0-9), with at least one small case character (a-z). Otherwise you will not be able to create an account in our system."
    
    @StateObject private var gloBalViewModel = GlobalViewModel()
    @StateObject private var signUpViewModel = SignUpViewController()
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("email & password"), footer: Text(passwordHint)) {
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
                    Button("Sign Up") {
                        signUpViewModel.createUserWithEmailAndPassword(email: email.trimmingCharacters(in: .whitespaces), password: password.trimmingCharacters(in: .whitespaces))
                    }
                    .disabled(email.isEmpty || password.isEmpty || gloBalViewModel.checkIfEmailCorrect(email: email.trimmingCharacters(in: .whitespaces)) == false)
                    .alert("Password error", isPresented: $signUpViewModel.showAlert) {
                        Button("Try again", role: .cancel) { }
                    } message: {
                        Text(signUpViewModel.alertMessage)
                    }
                }
            }
            .navigationTitle("Create an account")
        }
    }
}

#Preview {
    SIgnUpView()
}
