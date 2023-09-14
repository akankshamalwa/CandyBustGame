//
//  WalletBalanceView.swift
//  Totality_Assignment
//
//  Created by Akanksha Malawade on 12/09/23.
//

import SwiftUI

struct WalletBalanceView: View {

    // MARK: - Private Property

    @State private var isBalanceViewAppear = false

    // MARK: - Bind Properties

    @Binding var isSheetOpen: Bool
    @Binding var dragOffset: CGFloat

    // MARK: - Public Properties

    let maxHeight: CGFloat
    let foregroundColor: Color
    let onDismiss: () -> Void

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack(alignment: .center, spacing: 20) {
                RoundReactangleView(area: 60, value: "5", foreGroundColor: .green)
                RoundReactangleView(area: 60, value: "10", foreGroundColor: .gray)
                RoundReactangleView(area: 60, value: "15", foreGroundColor: .gray)
            }
            .offset(x: isBalanceViewAppear ? 0 : UIScreen.main.bounds.width)
            .animation(.easeOut(duration: 2.0))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        isBalanceViewAppear.toggle()
                    }
                }
            }

            HStack(alignment: .center, spacing: 5) {
                Text("Wallet Balance:")
                    .font(.subheadline.bold())

                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 50, height: 20)
                    .cornerRadius(5)

                Spacer()

                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 50, height: 20)
                    .cornerRadius(5)

                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 20, height: 20)
                    .cornerRadius(5)
            }
            .padding(.horizontal)

            // Next button
            RoundedRectangle(cornerRadius: 120)
                .frame(width: 320, height: 50)
                .foregroundColor(foregroundColor)
                .overlay(Text("NEXT")
                            .font(.system(size: 20))
                            .foregroundColor(.white))
                .padding()
                .onTapGesture {
                    // Call the completion handler and close the sheet
                    onDismiss()
                }
        }
        .opacity(0.7)
    }
}

