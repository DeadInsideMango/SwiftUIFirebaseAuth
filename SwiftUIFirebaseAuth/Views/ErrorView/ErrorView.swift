//
//  ErrorView.swift
//  SwiftUIFirebaseAuth
//
//  Created by Roman Hairulin on 10/11/2023.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        NavigationStack {
            Text("There occure an error")
                .navigationTitle("Oops...")
        }
    }
}

#Preview {
    ErrorView()
}
