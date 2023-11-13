//
//  ContentView.swift
//  SwiftUIFirebaseAuth
//
//  Created by Roman Hairulin on 08/11/2023.
//

import SwiftUI
import FirebaseAuth


struct ContentView: View {
    
    @StateObject private var sessionManager = SessionManager()
    
    var body: some View {
        Group {
            if sessionManager.isLoggedIn {
                MainView()
                    .environmentObject(sessionManager)
            } else {
                SignInView()
                    .environmentObject(sessionManager)
            }
        }
        .onAppear {
            sessionManager.listen()
        }
    }
}

#Preview {
    ContentView()
}
