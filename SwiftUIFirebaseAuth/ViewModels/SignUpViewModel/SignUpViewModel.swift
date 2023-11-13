//
//  SignUpViewModel.swift
//  SwiftUIFirebaseAuth
//
//  Created by Roman Hairulin on 08/11/2023.
//

import Foundation
import FirebaseAuth
import SwiftUI

final class SignUpViewController: ObservableObject {
    
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    func createUserWithEmailAndPassword(email: String, password: String) {
        
        if isPasswordSecure(password) {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                print(authResult?.description ?? "")
                if let error = error {
                    self.alertMessage = error.localizedDescription
                    self.showAlert = true
                }
            }
        } else {
            self.alertMessage = "The password does not follow safety requirments"
            self.showAlert = true
        }
    }
    
    func isPasswordSecure(_ password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}$")
        return passwordTest.evaluate(with: password)
    }
    
}
