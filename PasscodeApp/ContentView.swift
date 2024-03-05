//
//  ContentView.swift
//  PasscodeApp
//
//  Created by vbugrym on 05.03.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    @State private var isAuthenticated = false
    
    var body: some View {
        VStack {
            if isAuthenticated {
                VStack {
                    Text("You're in!")
                    
                    Button("Log Out") {
                        isAuthenticated.toggle()
                    }
                }
            } else {
                PasscodeView(isAuthenticated: $isAuthenticated)
            }
        }
        .padding()
        .onChange(of: scenePhase) { oldValue, newValue in
            guard newValue == .background || newValue == .inactive else {
                return
            }
            
            isAuthenticated = false
        }
    }
    
}

#Preview {
    ContentView()
}
