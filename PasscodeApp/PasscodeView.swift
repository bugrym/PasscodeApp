//
//  PasscodeView.swift
//  PasscodeApp
//
//  Created by vbugrym on 05.03.2024.
//

import SwiftUI

struct PasscodeView: View {
    @Binding var isAuthenticated: Bool
    @State private var passcode = ""
    @State private var showPasscodeError = false
    
    var body: some View {
        VStack(spacing: 48) {
            VStack(spacing: 24) {
                Text("Enter Passcode")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                
                Text("Please enter your 4-digit pin to securely access yout account.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
            .padding(.top)
         
            // Indicator view
            PasscodeIndicatorView(passcode: $passcode)
            
            if showPasscodeError {
                Text("Incorrect passcode. Please try again.")
                    .font(.caption)
                    .foregroundStyle(.red)
            }
            
            Spacer()
            
            // Numberpad view
            NumberPadView(passcode: $passcode)
        }
        .onChange(of: passcode) {
            verifyPasscode()
        }
    }
    
    private func verifyPasscode() {
        guard passcode.count == 4 else {
            return
        }
        
        Task {
            try? await Task.sleep(nanoseconds: 125_000_00)
            isAuthenticated = passcode == "1312"
            showPasscodeError = !isAuthenticated
            passcode.removeAll()
        }
    }
}

#Preview {
    PasscodeView(isAuthenticated: .constant(false))
}
