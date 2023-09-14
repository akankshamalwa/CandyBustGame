//
//  BalanceVerificationBottomSheetView.swift
//  Totality_Assignment
//
//  Created by Akanksha Malawade on 12/09/23.
//

import SwiftUI

struct BalanceVerificationBottomSheetView: View {

    // MARK: - Private Properties

    @State private var isBalanceVerificationViewAppear = false
    @State private var offset: CGFloat = 220

    // MARK: - Bind Property

    @Binding var isVerificationSheetPresented: Bool

    // MARK: - Public Properties

    let maxHeight: CGFloat
    let onDismiss: () -> Void

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: isBalanceVerificationViewAppear ? 150 : 0, height: isBalanceVerificationViewAppear ? 30 : 0)
                .animation(.easeOut(duration: 1.0))
                .padding()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation {
                            isBalanceVerificationViewAppear.toggle()
                        }
                    }
                }

            Rectangle()
                .foregroundColor(.gray)
                .frame(width: 100, height: 20)

            // WalletBalanceView
            WalletBalanceView(
                isSheetOpen: $isVerificationSheetPresented,
                dragOffset: $offset,
                maxHeight: maxHeight,
                foregroundColor: .green) {

                    // Call the completion handler and close the sheet
                    isVerificationSheetPresented.toggle()
                    onDismiss()
                }
        }
        .frame(maxWidth: .infinity, maxHeight: maxHeight)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .offset(y: isVerificationSheetPresented ? offset : maxHeight)
        .gesture(

            // Gesture for dragging the sheet
            DragGesture()
                .onChanged { value in
                    offset = max(0, value.translation.height)
                }
                .onEnded { value in
                    if offset > maxHeight * 0.25 {
                        isVerificationSheetPresented = true
                    } else {
                        isVerificationSheetPresented = false
                    }
                    offset = 0
                })
    }
}

