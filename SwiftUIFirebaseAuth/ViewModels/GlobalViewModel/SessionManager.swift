//
//  SessionManager.swift
//  SwiftUIFirebaseAuth
//
//  Created by Roman Hairulin on 10/11/2023.
//

import Foundation
import SwiftUI
import Firebase

class SessionManager: ObservableObject {
    
    @Published var isLoggedIn: Bool = true
    @Published var user: User?
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    
    func listen() {
        Auth.auth().addStateDidChangeListener {(_, user) in
            if let user = user {
                self.isLoggedIn = true
                self.user = user
            } else {
                self.isLoggedIn = false
                self.user = nil
            }
        }
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {(_, error) in
            if let error = error {
                self.alertMessage = "Incorrect email or password, please try again"
                self.showAlert = true
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.isLoggedIn = false
            self.user = nil
        } catch let error {
            print("Sign out failed: \(error.localizedDescription)")
        }
    }
    
    func deleteUser() {
        user?.delete { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("User has been deleted")
            }
        }
    }
    
}
