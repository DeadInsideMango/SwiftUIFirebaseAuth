//
//  UpdateDataViewModel.swift
//  SwiftUIFirebaseAuth
//
//  Created by Roman Hairulin on 11/11/2023.
//

import Foundation
import Firebase
import SwiftUI

final class UpdateDataViewModel: ObservableObject {
    
    func update(firstName: String, phoneNumber: String) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = firstName
        changeRequest?.commitChanges { error in
            if let error = error {
                print("Error: \(String(describing: error.localizedDescription))")
            } else {
                print("Data updated succesfelly")
            }
        }
    }
}
