//
//  GlobalViewModel.swift
//  SwiftUIFirebaseAuth
//
//  Created by Roman Hairulin on 08/11/2023.
//

import Foundation
import SwiftUI

final class GlobalViewModel: ObservableObject {
    
    func checkIfEmailCorrect(email: String) -> Bool {
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"  // 1
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)  // 2
        return emailValidationPredicate.evaluate(with: email)
    }
}

