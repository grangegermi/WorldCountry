//
//  BackButton.swift
//  Country
//
//  Created by MAC on 8.12.24.
//

import SwiftUI

struct BackButton: View {
    //MARK: - Properties
    @Environment(\.dismiss) var dismiss
    //MARK: - body
    var body: some View {
        Button {
            dismiss()
        }label: {
            ZStack{
                Circle()
                    .frame(width: 34)
                    .foregroundColor(.black)
                    .opacity(0.3)
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .opacity(0.8)
                
            }
        }
    }
}

#Preview {
    BackButton()
}
