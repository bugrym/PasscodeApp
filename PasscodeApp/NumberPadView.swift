//
//  NumberPadView.swift
//  PasscodeApp
//
//  Created by vbugrym on 05.03.2024.
//

import SwiftUI

struct NumberPadView: View {
    private let columns: [GridItem] = [.init(), .init(), .init()]
    
    @Binding var passcode: String
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(1 ... 9, id: \.self) { index in
                Button {
                    add(index)
                } label: {
                    Text("\(index)")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .contentShape(.rect)
                }
            }
            
            
            Button {
                delete()
            } label: {
                Image(systemName: "delete.backward")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .contentShape(.rect)
            }
            
            Button {
                add(0)
            } label: {
                Text("0")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .contentShape(.rect)
            }
        }
        .foregroundStyle(.primary)
    }
    
    private func add(_ value: Int) {
        guard passcode.count < 4 else {
            return
        }
        
        passcode.append("\(value)")
    }
    
    private func delete() {
        guard !passcode.isEmpty else {
            return
        }
        
        passcode.removeLast()
    }
}

#Preview {
    NumberPadView(passcode: .constant(""))
}
